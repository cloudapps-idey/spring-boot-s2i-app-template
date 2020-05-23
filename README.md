# spring-boot-s2i-app-pipeline ( in construction)

This repo is developed to deploy the application that is in https://github.com/IndraniDey1/spring-boot-s2i-app.git 
via template. This is in preparation to deploy via Jenkins. 

How to run this app:

1. git clone https://github.com/IndraniDey1/spring-boot-s2i-app-pipeline.git
2. cd spring-boot-s2i-app-pipeline/openshift directory
3. Modify the namespace to match your project name 
   vi configmap/s2i-cm.yaml
4. check ./setup-s2i-app.sh file to make sure oc project is commented out
5. run setup file
  ./setup-s2i-app.sh 
6. Copy the mysql pod name 
   oc get pods
7. vi database/setupdb.sh
   replace the mood=<mysql pod name you got from 'oc get pod' command>
8. run db setup
   database/setupdb.sh
9. oc get route
10. curl http://<route url>/catfactservice/facts
11. curl http://<route url>/bookdservice/books
  
# Creat a Jenkins pipeline for the application resides in 
https://github.com/IndraniDey1/spring-boot-s2i-app.git 
TBD
