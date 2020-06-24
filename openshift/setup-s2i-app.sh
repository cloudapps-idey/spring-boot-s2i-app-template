oc create -f configmap/s2i.cm
oc create -f secrets/mysql.sec
oc create -f secrets/ssl.sec
oc create -f secrets/s2i.sec
oc new-app -f templates/build-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git
oc new-app -f templates/deployment-s2i-app-template.yaml -p APP_GIT_URL=https://github.com/IndraniDey1/spring-boot-s2i-app.git

