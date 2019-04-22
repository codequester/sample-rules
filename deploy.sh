keytool -genkeypair -alias kieserver -keyalg RSA -keystore keystore.jks -storepass password123 -keypass password123 --dname "CN=shgovind,OU=FSI,O=redhat.com,L=dallas,S=TX,C=US"

oc new-app -f rhdm73-kieserver.yaml \
  -p APPLICATION_NAME=sample-rules \
  -p KIE_SERVER_CONTAINER_DEPLOYMENT=sample-kieserver-rules=com.sample.kjar:sample-rules:1.0 \
  -p KIE_SERVER_MGMT_DISABLED=true \
  -p KIE_SERVER_STARTUP_STRATEGY=LocalContainersStartupStrategy \
  -p MAVEN_REPO_URL=http://nexus3-nexus3.apps.na311.openshift.opentlc.com/repository/releases \
  -p KIE_SERVER_HTTPS_SECRET=kieserver-app-secret \
  -p KIE_SERVER_HTTPS_PASSWORD=password123



oc new-app -f rhdm71-prod-immutable-kieserver.yaml \
  -p APPLICATION_NAME=sample-rules \
  -p KIE_SERVER_CONTAINER_DEPLOYMENT=sample-kieserver-rules=com.sample.kjar:sample-rules:1.0 \
  -p SOURCE_REPOSITORY_URL=https://github.com/codequester/sample-rules.git \
  -p KIE_SERVER_HTTPS_SECRET=secret123 \
  -p IMAGE_STREAM_NAMESPACE=rules