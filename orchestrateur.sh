#!/bin/bash



#telecharger l'API et stocker en local
wget -P getdata/storage/ http://www.restcountries.com/v3.1/all

#renomer le fichier all en country.json

mv ./getdata/storage/all ./getdata/storage/country.json

#ecrire sur HDFS 
hdfs dfs -put -f  ./getdata/storage/country.json  /user/hadoop/user/ubuntu/datalake/



cd ./jobs/job1/scala

sh run.sh

cd ./jobs/job2/scala

sh run.sh