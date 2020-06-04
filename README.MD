# Performance Test Suite of Axon.ivy Digital Business Platform

## Build

https://jenkins.ivyteam.io/job/ivy-core_performance-tests/job/master/

## Add a new test process

1. Open the ivy project located under testProjects/latest/Performance with the oldest test version of the Designer.
2. In the designer, add a new test process and implement it.
3. Add a new line calling runPerformanceTest(...) to the method runPerformanceTests in the Jenkinsfile to call the new test process.

## Add a new ivy version to the suite

1. Add a new child directory to directory docker/ivy that represents the new version.
2. Copy the Dockerfile of an other version and add it to the new directory.
3. Adapt the Dockerfile so that it uses the correct docker image for the new version.
4. Add a new line calling prepareIvyContainer to the stage build-containers in the Jenkinsfile.
5. Add a new line calling runPerformanceTests to the stage test in the Jenkinsfile.

