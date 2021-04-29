FROM axonivy/axonivy-engine:9.2.0

ADD --chown=ivy:ivy testProjects/9.2.0/Performance/target/performance-1.0.0-SNAPSHOT.iar /usr/lib/axonivy-engine/deploy/performance.iar

ADD --chown=ivy:ivy docker/ivy/app-performance.yaml /usr/lib/axonivy-engine/configuration/applications/performance/app.yaml

ADD --chown=ivy:ivy docker/ivy/jvm.options /usr/lib/axonivy-engine/configuration/jvm.options
