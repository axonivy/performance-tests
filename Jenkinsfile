import static groovy.io.FileType.*

pipeline {
  agent {
    label 'performance-test'
  }


  options {
    buildDiscarder(logRotator(numToKeepStr: '180'))
  }

  triggers {
    cron '@midnight'
  }

  stages {
    stage('build-test-projects') {
      steps  {
        script {
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/8/Dockerfile .').inside {
            maven cmd: 'clean verify -f testProjects/7.2.0/Performance/pom.xml'
          }
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/11/Dockerfile .').inside {
            maven cmd: 'clean verify -f testProjects/9.2.0/Performance/pom.xml'
            maven cmd: 'clean verify -f testProjects/latest/Performance/pom.xml'
          }
        }
      }
    }
  
    stage('build-containers') {
      steps {
        script {
          docker.build("wrk:${env.BUILD_ID}", '-f docker/wrk/Dockerfile .')
          prepareIvyContainer('7.2.0')
          prepareIvyContainer('8.0.0')
          prepareIvyContainer('8.0.x')
          prepareIvyContainer('8.0.n')
          prepareIvyContainer('9.1.0')
          prepareIvyContainer('9.2.0')
          prepareIvyContainer('sprint')
          prepareIvyContainer('nightly')
        }
      }
    }

    stage('test') {
      steps {
        script {
          sh "rm -rf results && rm -rf logs && mkdir -p results && mkdir -p logs"
          runPerformanceTests('7.2.0')
          runPerformanceTests('8.0.0')
          runPerformanceTests('8.0.x')
          runPerformanceTests('8.0.n')
          runPerformanceTests('9.1.0')
          runPerformanceTests('9.2.0')
          runPerformanceTests('sprint')
          runPerformanceTests('nightly')
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
  docker.image("ivy-$version:${env.BUILD_ID}").withRun() { container ->
    docker.image("wrk:${env.BUILD_ID}").inside(" --link ${container.id}:ivy") {
    
      sleep 25
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
      runPerformanceTest(version, "cms", "performance/pro/Performance/1791C5396913061C/readCms.ivp")
    }

    sh "docker logs ${container.id} > logs/${version}.log"
  }
}

def runPerformanceTest(String version, String name, String url)
{
  String resultFile = "results/" + version + "_" + name + ".wrk";
  url = adjustUrlToVersion(version, url)
  echo "Testing $url"
  
  warmUp(url)
  test(url, resultFile)
}

def warmUp(String url)
{
  test(url, "/dev/null")
}

def test(String url, String resultFile)
{
  sh "#!/bin/sh\n"+
     "wrk -d10s -t1 --timeout 10s $url > $resultFile"
}

def adjustUrlToVersion(String version, String url)
{
  baseUrl = "http://ivy:8080/";
  if (version.startsWith("7."))
  {
    baseUrl += "ivy/";
    if (url.contains("system/faces/javax.faces.resource/"))
    {
      url = url.replace("system/faces/javax.faces.resource/", "javax.faces.resource/");
    }

    if (url.contains("?ln=primefaces-serenity-ivy"))
    {
      url = url.replace("?ln=primefaces-serenity-ivy", ".xhtml?ln=primefaces-modena-ivy");
    }
    if (url.contains("/pro/"))
    {
      url = url.replace("/pro/", "/")
      url = url.capitalize()
      url = "pro/"+url;
    }
  }
  if (version.startsWith("8."))
  {
    baseUrl += "ivy/";
    if (url.contains("system/faces/javax.faces.resource/"))
    {
      url = url.replace("system/faces/javax.faces.resource/", "sys/javax.faces.resource/");
    }
    if (url.contains("/pro/"))
    {
      url = url.replace("/pro/", "/")
      url = url.capitalize()
      url = "pro/"+url;
    }
  }
  return baseUrl + url;
}

def checkErrors()
{
  try
  {
    def result = sh(returnStdout: true, 
                       script: "#!/bin/sh\n"+
                               "grep -l 'Non-2xx' results/*.wrk").trim()
    result = result.replace("\n", ", ")
    def errors = result.split(", ");
    if (isUnstable(errors))
    {
	  unstable "There are errors in: "+result
    }
  }
  catch(exe)
  {
  }
}

def isUnstable(String[] errors)
{
  for (def error : errors)
  {
      if (!knownIssue(error))
      {
          return true;
      }
  }
  return false;
}

def knownIssue(String error)
{
  def blacklist = ["results/7.2.0_soapElement.wrk", 
                   "results/8.0.0_soapElement.wrk", 
                   "results/8.0.x_soapElement.wrk", 
                   "results/9.1.0_soapElement.wrk", 
                   "results/sprint_soapElement.wrk"]
      
  for (def black : blacklist)
  {
    if (black.equals(error))
    {
      return true;
    }
  }
  return false;
}

def createCsvReports()
{
  def times = [:]
  def files = findFiles(glob: 'results/*.wrk')
  files.each{ file -> 
    def content = readFile(file.toString())
    times[file.getName()] = parseAverageResponseTime(content) } 
  def tests = toTests(times)
  tests.each{ entry -> writeCSV file: "results/"+entry.key+".csv", records: entry.value }
  archiveArtifacts artifacts: 'results/*.csv', onlyIfSuccessful: true
}

def createPlots()
{
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


def parseAverageResponseTime(String content)
{
  def avgResponseTime = 0.0;
  content.split('\n').each{ line -> 
    if (line.contains("Latency"))
    {
      avgResponseTime = parseAverageResponseTimeFromLine(line)
    } 
  }
  return avgResponseTime
} 

def parseAverageResponseTimeFromLine(String line)
{
  def parts = line.trim().split();
  def responseTime = parts[1]
  def factor = 1.0d;
  if (responseTime.endsWith("ns"))
  {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 0.000001d
  }
  else if (responseTime.endsWith("us"))
  {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 0.001d
  }
  else if (responseTime.endsWith("ms"))
  {
    responseTime = responseTime.substring(0, responseTime.length() - 2)
    factor = 1.0d
  }
  else if (responseTime.endsWith("s"))
  {
    responseTime = responseTime.substring(0, responseTime.length() - 1)
    factor = 1000.0d
  }
  else
  {
    throw new IllegalArgumentException("Cannot parse "+responseTime)
  }
  def time = Double.parseDouble(responseTime)
  return time * factor
}

def toTests(Map times)
{
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
