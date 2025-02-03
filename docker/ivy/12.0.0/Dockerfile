FROM axonivy/axonivy-engine:12.0.3

ADD --chown=ivy:ivy testProjects/12.0.0/Performance/target/performance-1.0.0-SNAPSHOT.iar /ivy/deploy/performance.iar
ADD --chown=ivy:ivy docker/ivy/jvm.options /ivy/configuration/jvm.options
ADD --chown=ivy:ivy docker/ivy/log4j2.xml /ivy/log4j2.xml
