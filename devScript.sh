shopt -s extglob
MASTER_FLAG=$1                                                                
      
#get the number of active ssh connections
ACTIVE_USER=$(who | wc -l )

#If number active ssh connections > 1 dont allow updates 
if [ $ACTIVE_USER -gt 0 ]
then
	echo The server update has been blocked as zenen is currently doing server maintenance.  Please try again in a few minutes or contact zenen
	exit 1
fi

pm2 stop server
cd /home/zenen/apps/COMP-2800-TEAM-DTC-11-Covid-Royale/

if [[ $MASTER_FLAG ]] && [ $MASTER_FLAG == "master" ]                         
then                                                                          
    echo Updating server from master
    git checkout master
else                                                                          
    echo Updating server from dev
    git checkout dev
fi                                                                            

git pull
sleep 1
pm2 start server
sleep 5
echo Final check
pm2 status | awk '{print $18}'

