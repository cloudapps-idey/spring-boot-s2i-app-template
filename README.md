# spring-boot-s2i-app-pipeline

This repo is developed to deploy the application that is in https://github.com/IndraniDey1/spring-boot-s2i-app.git 
via template. This is in preparation to deploy via Jenkins. 

# manually you can deploy the application using templates
- clone this ropo
- This repo deploys the app in proejct name  's2i-app-pipeline'. If you want to change the name of the project then make sure you change the name in setup-s2i-app.sh and also in configmap/s2i-cm.yaml file

- invoke the file ./setup-s2i-app-pipeline.sh
[ this will setup configmap, secret, invoke the build and deployment yaml files.]

- oc get routes

-curl http://<route url>/catfactservice/facts
  
- if you want to run the mysql db part of the app. then please see the database/setupdb.sh file
- provide the mysql pod name inside setupdb.sh file by doing; oc get pods
- run the script ./setupdb.sh
[ this will setup the bookstore db with one table called book. It also inserts few rows to the table]
-- curl http://<route url>/bookservice/books
  
# Creat a Jenkins pipeline for the application resides in https://github.com/IndraniDey1/spring-boot-s2i-app.git 
TBD
