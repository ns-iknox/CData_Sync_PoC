echo `date` >> restart.log 
java -jar start.jar --stop >> restart.log 
echo "Stop complete." >> restart.log 
java -jar start.jar >> restart.log 
echo "Start complete." >> restart.log 