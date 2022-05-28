# Performance Test Suite of the Axon Ivy Platform

## Build

[Build](https://jenkins.ivyteam.io/job/performance-tests/job/master/)

If this build is yellow graph the console log after "There are errors in".

## Add a new test process

1. Open the ivy project located under `testProjects/latest/Performance` with the oldest test version of the Designer.
2. In the designer, add a new test process and implement it.
3. Add a new line calling runPerformanceTest(...) to the method runPerformanceTests in the Jenkinsfile to call the new test process.

## Add a new ivy version to the suite

1. Add a new child directory to directory `docker/ivy` that represents the new version.
2. Copy the Dockerfile of an other version and add it to the new directory.
3. Adapt the Dockerfile so that it uses the correct docker image for the new version.
4. Add a new line calling prepareIvyContainer to the stage build-containers in the Jenkinsfile.
5. Add a new line calling runPerformanceTests to the stage test in the Jenkinsfile.

## Tools

### Axon.ivy test project

An Axon.ivy Project that is used during the test is located in the directory `testProjects/latest/Performance`. It contains simple processes
that are used as target to measure the performance.

### Docker

Multiple Dockerfiles are located in subdirectories of the directory `docker` to build containers for different ivy versions, maven and wrk.

- ivy: The ivy containers for different versions will bundle the Axon.ivy test project and deploy it on startup.
- mvn: The maven container is used to build the Axon.ivy test project.
- wrk: The wrk container is used to execute load requests on the ivy containers.

### WRK

[WRK](https://github.com/wg/wrk) is a modern HTTP benchmarking tool to generate HTTP request load on a server. Its usage is as simple as:

    wrk -c10 -t1 -d10s http://dev.axonivy.com
	
This will generate HTTP requests on 10 different connections using 1 thread for 10 seconds on the given URL.

### Jenkins Plot Plugin

I use the Plot plugin to plot the average response time for a single test of all ivy versions into a plot or diagram. The plot plugin uses a CSV file of the build as datasource. 

### Jenkins Performance Plugin

I use the Performance plugin to plot the average response time, throughput and errors for each test. Unfortunately the WRK support of the plugin is very limitted. 
Errors are not supported et al. Response times in nanoseconds are reported as seconds. 
So be careful when analyzing the results.

### Groovy / Jenkins Pipline

The Jenkins Pipeline defined in the `Jenkinsfile` is used to orchestrate the build. 
It first builds the ivy test project, then the containers, then runs the tests against each Axon.ivy version and finally reports the result.

During the report stage, I use groovy to parse the wrk result files located in the `results` directory. If there are errors in these files I make the build `UNSTABLE`. 
The average response times of all result files of the same test are summarized in a CSV that is used by the Plot plugin to draw the Response Time diagrams.

The console output of each ivy container is redirected to the `logs` directory for later analyses.

### Running tests on your developer machine

You can run single tests also on your developer machine. 

1. Use `mvn clean verify` to build the test projects
2. Use `docker-compose up -d ivy-xxx wrk` to start the wrk and the ivy container under test
3. Use `docker ps` to find the containter id of the wrk container and the ivy container under test
4. Use `docker exec -it {wrk container id} sh` to start a shell in the wrk container
5. Use `wrk -c10 -d60 http://ivy-xxx:8080/performance/pro/Performance/xxx/yyy.ivp` to execute a performance test
6. Use `docker stop {ivy container id}` to stop the ivy container and trigger the JFR file to be written
7. Use `docker cp {ivy container id}:/usr/lib/axonivy-engine/recording.jfr c:\tmp\nightly.jfr` to copy the JFR recording file to your host system (only 8.0.x and higher)
