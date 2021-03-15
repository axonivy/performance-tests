FROM axonivy/axonivy-engine:nightly

ADD --chown=ivy:ivy testProjects/latest/Performance/target/performance-1.0.0-SNAPSHOT.iar /usr/lib/axonivy-engine/deploy/performance.iar

ADD --chown=ivy:ivy docker/ivy/app-performance.yaml /usr/lib/axonivy-engine/configuration/applications/performance/app.yaml