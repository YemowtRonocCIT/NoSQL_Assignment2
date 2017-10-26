REM #
REM #-------------------------------------------------#
REM #						      #
REM # 0. Set myName to the name of the computer       #
REM #						      #
REM #-------------------------------------------------#
REM #	
SET myName=COM-IT22-51246.student-cit
REM #
REM #-------------------------------------------------#
REM #						      #
REM # 1. Start the config server database instances   #
REM #						      #
REM #-------------------------------------------------#
REM #	
REM # 1.1. Create the data directory for each of the config servers
REM #	
mkdir h:\cfg0
mkdir h:\cfg1
mkdir h:\cfg2
REM #	
REM # 1.2. Start the config server instances 
REM #	
start /b C:\MongoDB_3_0\bin\mongod.exe --configsvr --dbpath h:\cfg0 --port 26050
start /b C:\MongoDB_3_0\bin\mongod.exe --configsvr --dbpath h:\cfg1 --port 26051
start /b C:\MongoDB_3_0\bin\mongod.exe --configsvr --dbpath h:\cfg2 --port 26052
REM #	
REM #-------------------------------------------------#

pause
REM #						      #
REM # 2. Start the C:\MongoDB_3_0\bin\mongos instances   		      #
REM #						      #
REM #-------------------------------------------------#
REM #	
REM # 2.1. A first C:\MongoDB_3_0\bin\mongos process listens to the default port 27017
REM #	
start /b C:\MongoDB_3_0\bin\mongos.exe --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052

pause
REM #	
REM # 2.2. Remaining C:\MongoDB_3_0\bin\mongos processes listen to the explicit ports assigned by us
REM #	
start /b C:\MongoDB_3_0\bin\mongos.exe --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26061

pause
start /b C:\MongoDB_3_0\bin\mongos.exe --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26062
pause
start /b C:\MongoDB_3_0\bin\mongos.exe --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26063
pause
REM #	
REM #-------------------------------------------------#
REM #						      #
REM # 3. Create the shards of our cluster	      #
REM #						      #
REM #-------------------------------------------------#
REM #	
REM # 3.1. Create the data directory for each of the replica sets servers
REM #	
mkdir h:\dublin0
mkdir h:\dublin1
mkdir h:\dublin2
mkdir h:\cork0
mkdir h:\cork1
mkdir h:\cork2
mkdir h:\limerick0
mkdir h:\limerick1
mkdir h:\limerick2
mkdir h:\galway0
mkdir h:\galway1
mkdir h:\galway2
REM #	
REM # 3.2. Start each member of the replica set 
REM #	
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet dublin --dbpath h:\dublin0 --port 27000
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet dublin --dbpath h:\dublin1 --port 27001
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet dublin --dbpath h:\dublin2 --port 27002
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet cork --dbpath h:\cork0 --port 27100
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet cork --dbpath h:\cork1 --port 27101
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet cork --dbpath h:\cork2 --port 27102
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet limerick --dbpath h:\limerick0 --port 27200
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet limerick --dbpath h:\limerick1 --port 27201
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet limerick --dbpath h:\limerick2 --port 27202
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet galway --dbpath h:\galway0 --port 27300
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet galway --dbpath h:\galway1 --port 27301
pause
start /b C:\MongoDB_3_0\bin\mongod.exe --replSet galway --dbpath h:\galway2 --port 27302
pause
REM #	
