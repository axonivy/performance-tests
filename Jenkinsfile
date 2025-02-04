import static groovy.io.FileType.*

pipeline {
  agent {
    label 'performance-test'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '180'))
  }

  triggers {
    cron '0 19 * * *'
  }

  stages {
    stage('build-test-projects') {
      steps  {
        script {          
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/17/Dockerfile .').inside {
            maven cmd: 'clean verify -f testProjects/10.0.0/Performance/pom.xml'
          }
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/21/Dockerfile .').inside {
             maven cmd: 'clean verify -f testProjects/12.0.0/Performance/pom.xml'
           }
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/21/Dockerfile .').inside {
            maven cmd: 'clean verify -f testProjects/latest/Performance/pom.xml'
          }
        }
      }
    }
  
    stage('build-containers') {
      steps {
        script {
          docker.build("wrk:${env.BUILD_ID}", '-f docker/wrk/Dockerfile .')          
          prepareIvyContainer('10.0.0')
          prepareIvyContainer('10.0.x')
          prepareIvyContainer('10.0.n')
          prepareIvyContainer('12.0.0')
          prepareIvyContainer('12.0.x')
          prepareIvyContainer('12.0.n')
          // prepareIvyContainer('dev')
        }
      }
    }

    stage('test') {
      steps {
        script {
          sh "rm -rf results && rm -rf logs && rm -rf recordings && mkdir -p results && mkdir -p logs && mkdir -p recordings"
          
          // frequently updated:
          // runPerformanceTests('dev')
          runPerformanceTests('10.0.n')
          runPerformanceTests('10.0.x')
          runPerformanceTests('12.0.n')
          runPerformanceTests('12.0.x')

          // static releases
          runPerformanceTests('10.0.0')
          runPerformanceTests('12.0.0')
        }
      }
    }
    stage('report') {
      steps {
        script {
          checkErrors()
          createCsvReports()
          createPlots()
          perfReport "results/*.wrk"
        }
      }
    }
  }
}

def prepareIvyContainer(String version) {
  docker.build("ivy-$version:${env.BUILD_ID}", "-f docker/ivy/$version/Dockerfile .")
}

def runPerformanceTests(String version) {
  mailContainer = docker.image("greenmail/standalone").run();
  try {
    ivyContainer = docker.image("ivy-$version:${env.BUILD_ID}").run(" --link ${mailContainer.id}:mail");
    try {
      waitUntilIvyIsRunning(ivyContainer)
      docker.image("wrk:${env.BUILD_ID}").inside(" --link ${ivyContainer.id}:ivy") {
        runPerformanceTestsInContainer(version);
      }
    } finally {
      sh "docker logs ${ivyContainer.id} > logs/${version}.log"      
      sh "docker stop ${ivyContainer.id}"
      if (version.equals("dev") || version.startsWith("12.0.")) {
        sh "docker cp ${ivyContainer.id}:/ivy/recording.jfr recordings/${version}.jfr"
      } else {
        sh "docker cp ${ivyContainer.id}:/usr/lib/axonivy-engine/recording.jfr recordings/${version}.jfr"
      }      
      ivyContainer.stop()
    }
  } finally {
    mailContainer.stop();
  }
}

def runPerformanceTestsInContainer(String version) {
  echo "Going to test $version"
  runPerformanceTest(version, "infoPage", "")
  runPerformanceTest(version, "themeCss", "system/faces/javax.faces.resource/theme.css?ln=primefaces-serenity-ivy")
  runPerformanceTest(version, "processEngineSimpleLoop", "performance/pro/Performance/17273CC5183C042A/start.ivp")
  runPerformanceTest(version, "restElement", "performance/pro/Performance/17273D0D9D496ED8/element.ivp")
  runPerformanceTest(version, "restApi", "performance/pro/Performance/17273D0D9D496ED8/api.ivp")
  runPerformanceTest(version, "soapElement", "performance/pro/Performance/17297D7F72BCF2F9/element.ivp")
  runPerformanceTest(version, "dbElement", "performance/pro/Performance/17297CB96C670B79/element.ivp")
  runPerformanceTest(version, "rule", "performance/pro/Performance/172E670BBE4A3218/compileAndExecuteRule.ivp")
  runPerformanceTest(version, "logDebug", "performance/pro/Performance/17491D197ECC2DB6/logDebug.ivp")
  runPerformanceTest(version, "logError", "performance/pro/Performance/17491D197ECC2DB6/logErrors.ivp")
  runPerformanceTest(version, "readCmsString", "performance/pro/Performance/1791C5396913061C/readCmsString.ivp")
  runPerformanceTest(version, "readCmsFile", "performance/pro/Performance/1791C5396913061C/readCmsFile.ivp")
  runOnce(version, "businessDataFill", "performance/pro/Performance/1848AB6ADCA8F207/fillBusinessData.ivp")      
  runPerformanceTest(version, "businessDataSearch", "performance/pro/Performance/1848AB6ADCA8F207/searchBusinessData.ivp")
  runPerformanceTest(version, "businessDataFind", "performance/pro/Performance/1848AB6ADCA8F207/findBusinessData.ivp")
  runPerformanceTest(version, "task", "performance/pro/Performance/184D1FD2D64C0ADB/task.ivp")
  if (supportsNotification(version)) {
    runOnce(version, "notification before", "performance/pro/Performance/18E2CF64C4D238CB/before.ivp")
    runPerformanceTest(version, "notificationTask", "performance/pro/Performance/18E2CF2431E9C990/task.ivp")
    runPerformanceTest(version, "notificationRender", "performance/pro/Performance/18E2D005A95C1C56/render.ivp")
    runOnce(version, "notification after", "performance/pro/Performance/18E2CF64C4D238CB/after.ivp")
  }
}

def supportsNotification(String version) {
  return version.equals("dev") || version.startsWith("12.0.");
}

def waitUntilIvyIsRunning(def container) {
  timeout(2) {
    waitUntil {
      def exitCode = sh script: "docker exec ${container.id} wget -t 1 -q http://localhost:8080/ -O /dev/null", returnStatus: true
      return exitCode == 0;
    }
  }
}

def runOnce(String version, String name, String url) {
  String resultFile = "results/" + version + "_" + name + ".wrk";
  url = adjustUrlToVersion(version, url)
  echo "Run once $url"
  sh "wget -O/dev/null -q $url"
}

def runPerformanceTest(String version, String name, String url) {
  String resultFile = "results/" + version + "_" + name + ".wrk";
  url = adjustUrlToVersion(version, url)
  echo "Testing $url"
  
  warmUp(url)
  test(url, resultFile)
}

def warmUp(String url) {
  test(url, "/dev/null")
}

def test(String url, String resultFile) {
  sh "#!/bin/sh\n"+
     "wrk -d10s -t1 --timeout 10s $url > $resultFile"
}

def adjustUrlToVersion(String version, String url) {
  baseUrl = "http://ivy:8080/";
  if (version.startsWith("7.")) {
    baseUrl += "ivy/";
    if (url.contains("system/faces/javax.faces.resource/")) {
      url = url.replace("system/faces/javax.faces.resource/", "javax.faces.resource/");
    }

    if (url.contains("?ln=primefaces-serenity-ivy")) {
      url = url.replace("?ln=primefaces-serenity-ivy", ".xhtml?ln=primefaces-modena-ivy");
    }
    if (url.contains("/pro/")) {
      url = url.replace("/pro/", "/")
      url = url.capitalize()
      url = "pro/"+url;
    }
  }
  return baseUrl + url;
}

def checkErrors() {
  try {
    def result = sh(returnStdout: true, script: "#!/bin/sh\n" + "grep -l 'Non-2xx' results/*.wrk").trim()
    result = result.replace("\n", ", ")
    unstable "There are errors in: "+result    
  } catch(exe) {
  }
}

def createCsvReports() {
  def times = [:]
  def files = findFiles(glob: 'results/*.wrk')
  files.each{ file -> 
    def content = readFile(file.toString())
    times[file.getName()] = parseAverageResponseTime(content) } 
  def tests = toTests(times)
  tests.each{ entry -> writeCSV file: "results/"+entry.key+".csv", records: entry.value }
  archiveArtifacts artifacts: 'results/*.csv', onlyIfSuccessful: true
}

def createPlots() {
  def times = [:]
  def files = findFiles(glob: 'results/*.csv')
  files.each{ file -> 
    def name = file.name.replace(".csv", "")
    plot csvFileName: "plot-response-time-${name}.csv", 
         csvSeries: [[displayTableFlag: false, exclusionValues: '', file: file.toString(), inclusionFlag: 'OFF', url: '']], 
         group: 'Response Times', 
         numBuilds: '100', 
         style: 'line', 
         title: name, 
         useDescr: true, 
         yaxis: 'Response Time [ms]'
  } 
}

def parseAverageResponseTime(String content) {
  def avgResponseTime = 0.0;
  content.split('\n').each{ line -> 
    if (line.contains("Latency")) {
      avgResponseTime = parseAverageResponseTimeFromLine(line)
    } 
  }
  return avgResponseTime
} 

def parseAverageResponseTimeFromLine(String line) {
  def parts = line.trim().split();
  def responseTime = parts[1]
  def factor = 1.0d;
  if (responseTime.endsWith("ns")) {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 0.000001d
  }
  else if (responseTime.endsWith("us")) {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 0.001d
  }
  else if (responseTime.endsWith("ms")) {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 1.0d
  }
  else if (responseTime.endsWith("s")) {
    responseTime = responseTime.substring(0, responseTime.length() - 1)
    factor = 1000.0d
  }
  else {
    throw new IllegalArgumentException("Cannot parse "+responseTime)
  }
  def time = Double.parseDouble(responseTime)
  return time * factor
}

def toTests(Map times) {
  def tests = [:]
  times.each{
      entry -> 
      def name = entry.key.replace(".wrk", "")
      def parts = name.split("_")
      name = parts[1]
      def version = parts[0]
      def records = tests[name]
      def value = entry.value.toString()
      if (records == null)
      {
        records = [[], []]
        tests[name] = records
      }
      records[0].add(version)
      records[1].add(value)
  }
  return tests
}
