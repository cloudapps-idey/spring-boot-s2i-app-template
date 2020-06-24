#use this script if you want to delete everything like all the configs, configmap and secrets but you want to keep the project name the same
oc delete all --all
oc delete cm s2i-cm
oc delete secret mysql-sec
oc delete secret sslcert-sec
oc delete secret quay-sec
oc delete secret s2i-sec
~                             
