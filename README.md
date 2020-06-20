# spring-boot-s2i-app-template

This repo is developed to deploy the application that is in https://github.com/IndraniDey1/spring-boot-s2i-app.git 
via template. 

How to run this app:

1. git clone https://github.com/IndraniDey1/spring-boot-s2i-app-template.git
2. cd spring-boot-s2i-app-pipeline/openshift directory
3. check ./setup-s2i-app.sh file to make sure oc project is commented out
4. run setup file
  ./setup-s2i-app.sh 
5. Copy the mysql pod name 
   oc get pods
6. vi database/setupdb.sh
   replace the mood=<mysql pod name you got from 'oc get pod' command>
7. run db setup
   database/setupdb.sh
8. oc get route
9.  Test: curl http://<route url>/catfactservice/facts
          curl http://<route url>/bookdservice/books
  

