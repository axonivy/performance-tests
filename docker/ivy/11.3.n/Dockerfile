FROM axonivy/axonivy-engine:nightly-11.3

ADD --chown=ivy:ivy testProjects/11.3.0/Performance/target/performance-1.0.0-SNAPSHOT.iar /usr/lib/axonivy-engine/deploy/performance.iar
ADD --chown=ivy:ivy docker/ivy/jvm.options /usr/lib/axonivy-engine/configuration/jvm.options
ADD --chown=ivy:ivy docker/ivy/log4j2.xml /usr/lib/axonivy-engine/configuration/log4j2.xml
