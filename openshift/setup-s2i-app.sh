#oc new-project s2i-app-pipeline
#1. run setup
#2  copy the mysql pod name
#3  run data/set up script
oc create -f configmap/s2i.cm
oc create -f secrets/quay.sec
oc create -f secrets/mysql.sec
oc create -f secrets/ssl.sec
oc new-app -f templates/build-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git
oc new-app -f templates/deployment-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git

