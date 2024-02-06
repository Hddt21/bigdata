# check hadoop install (with user hadoop)
su hadoop
start-all.sh
hdfs dfs -ls /user/

# check build (with user ubuntu)
cd ~/Downloads/mnmcount/scala
sbt clean package

# run and check output (files should be refreshedi - with user ubuntu)
spark-submit --class main.scala.mnmc.MnMcount target/scala-2.12/main-scala-mnmc_2.12-1.0.jar data/mnm_dataset.csv
hdfs dfs -ls /user/test
ll output

# check spark shell (with user ubuntu)
spark-shell & echo "LAUNCHING spark-shell"
crtl+c to close

# check airflow (user ubuntu)
airflow webserver
airflow scheduler
crtl+c to close

# close all hadoop processes (user hadoop)
su hadoop
stop-all.sh



