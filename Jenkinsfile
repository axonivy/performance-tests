pipeline {
  agent any

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
          docker.build("mvn:${env.BUILD_ID}", '-f docker/mvn/Dockerfile .').inside {
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
          prepareIvyContainer('9.1.s')
          prepareIvyContainer('9.1.n')
        }
      }
    }

    stage('test') {
      steps {
        script {
          sh "#!/bin/sh\n" +
             "mkdir -p results\n" +
             "mkdir -p logs\n"

          runPerformanceTests('7.2.0')
          runPerformanceTests('8.0.0')  
          runPerformanceTests('8.0.x')        
          runPerformanceTests('9.1.s')    
          runPerformanceTests('9.1.n')          

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
    
      sleep 10
      echo "Going to test $version"
     
      runPerformanceTest(version, "infoPage", "")
      runPerformanceTest(version, "themeCss", "system/faces/javax.faces.resource/theme.css?ln=primefaces-serenity-ivy")
      runPerformanceTest(version, "processEngineSimpleLoop", "performance/pro/Performance/17273CC5183C042A/start.ivp")
      runPerformanceTest(version, "restElement", "performance/pro/Performance/17273D0D9D496ED8/element.ivp")
      runPerformanceTest(version, "restApi", "performance/pro/Performance/17273D0D9D496ED8/api.ivp")
    }
    
    sh "docker logs ${container.id} > logs/${version}.log"
  }
}

def runPerformanceTest(String version, String name, String url)
{
  String resultFile = "results/" + version + "_" + name + ".wrk";
  url = adjustUrlToVersion(version, url)
  echo "Testing $url"
  sh "#!/bin/sh\n"+
     "wrk -d10s -t1 $url > $resultFile"
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
