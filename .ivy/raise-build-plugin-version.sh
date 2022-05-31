#!/bin/bash

mvn --batch-mode versions:set-property versions:commit -f testProjects/latest/Performance/pom.xml -Dproperty=project.build.plugin.version -DnewVersion=${2} -DallowSnapshots=true
