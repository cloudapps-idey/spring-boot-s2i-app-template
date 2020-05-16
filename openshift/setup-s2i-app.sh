oc new-project s2i-app-pipeline
oc create -f configmap/s2i-cm.yaml
oc create -f secrets/idey-idey-sec.yaml
oc create -f secrets/mysql-sec.yaml
oc create -f secrets/s2i-sec.yaml
oc new-app -f templates/build-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git
oc new-app -f templates/deployment-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git

