#use this script if you just want to delete deployment but want to keep build, cofigmap and secret

oc delete dc/spring-boot-s2i-app-git
oc delete svc/spring-boot-s2i-app-git
oc delete route/spring-boot-s2i-app-git
