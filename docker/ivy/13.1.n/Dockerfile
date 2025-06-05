FROM axonivy/axonivy-engine:nightly-13.1

ADD --chown=ivy:ivy testProjects/13.1.0/Performance/target/performance-1.0.0-SNAPSHOT.iar /ivy/deploy/performance.iar
ADD --chown=ivy:ivy docker/ivy/jvm.options /ivy/configuration/jvm.options
ADD --chown=ivy:ivy docker/ivy/log4j2.xml /ivy/log4j2.xml
