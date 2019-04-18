oc new-app -f rhdm71-kieserver.yaml \
  -p APPLICATION_NAME=sample-rules \
  -p KIE_SERVER_CONTAINER_DEPLOYMENT=sample-kieserver-rules=com.sample.kjar:sample-rules:1.0 \
  -p KIE_SERVER_MGMT_DISABLED=true \
  -p KIE_SERVER_STARTUP_STRATEGY=LocalContainersStartupStrategy \
  -p MAVEN_REPO_URL=http://nexus3-nexus3.apps.na311.openshift.opentlc.com/repository/releases \
  -p KIE_SERVER_HTTPS_SECRET=secret123 \
  -p IMAGE_STREAM_NAMESPACE=rules