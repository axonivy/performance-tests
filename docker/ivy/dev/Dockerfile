FROM axonivy/axonivy-engine:dev

ADD --chown=ivy:ivy testProjects/latest/Performance/target/performance-1.0.0-SNAPSHOT.iar /ivy/deploy/performance.iar
ADD --chown=ivy:ivy docker/ivy/jvm.options /ivy/configuration/jvm.options
ADD --chown=ivy:ivy docker/ivy/log4j2.xml /ivy/configuration/log4j2.xml
ADD --chown=ivy:ivy docker/ivy/ivy.yaml /ivy/configuration/ivy.yaml
