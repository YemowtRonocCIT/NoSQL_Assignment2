REM #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 0. Set myName to the name of the computer       #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
SET myName=DESKTOP-GIC9RBH
SET name="Conor"
SET assignmentDirectory=C:\Users\%name%\Documents\College\"NoSQL Data Architectures"\"Assignment 2"
SET mongod_exe=C:\"Program Files"\MongoDB\Server\3.0\bin\mongod.exe
SET mongos_exe=C:\"Program Files"\MongoDB\Server\3.0\bin\mongos.exe
SET cluster_directory=%assignmentDirectory%\Clusters
REM #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 1. Start the config server database instances   #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 1.1. Create the data directory for each of the config servers
REM #	
mkdir %cluster_directory%\cfg0
mkdir %cluster_directory%\cfg1
mkdir %cluster_directory%\cfg2
REM #	
REM # 1.2. Start the config server instances 
REM #
start /b %mongod_exe% --configsvr --dbpath %cluster_directory%\cfg0 --port 26050
start /b %mongod_exe% --configsvr --dbpath %cluster_directory%\cfg1 --port 26051
start /b %mongod_exe% --configsvr --dbpath %cluster_directory%\cfg2 --port 26052
REM #	
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#

REM #						      #
REM # 2. Start the "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos instances   		      #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 2.1. A first "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos process listens to the default port 27017
REM #	
start /b mongos_exe --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052"

REM #	
REM # 2.2. Remaining "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos processes listen to the explicit ports assigned by us
REM #	
start /b %mongos_exe% --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26061

start /b %mongos_exe% --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26062
start /b %mongos_exe% --configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26063
REM #	
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 3. Create the shards of our cluster	      #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 3.1. Create the data directory for each of the replica sets servers
REM #	
mkdir %cluster_directory%\"dublin0"
mkdir %cluster_directory%\"dublin1"
mkdir %cluster_directory%\"dublin2"
mkdir %cluster_directory%\"cork0"
mkdir %cluster_directory%\"cork1"
mkdir %cluster_directory%\"cork2"
mkdir %cluster_directory%\"limerick0"
mkdir %cluster_directory%\"limerick1"
mkdir %cluster_directory%\"limerick2"
mkdir %cluster_directory%\"galway0"
mkdir %cluster_directory%\"galway1"
mkdir %cluster_directory%\"galway2"
REM #	
REM # 3.2. Start each member of the replica set 
REM #	
start /b %mongod_exe% --replSet dublin --dbpath %cluster_directory%\"dublin0" --port 27000
start /b %mongod_exe% --replSet dublin --dbpath %cluster_directory%\"dublin1" --port 27001
start /b %mongod_exe% --replSet dublin --dbpath %cluster_directory%\"dublin2" --port 27002
start /b %mongod_exe% --replSet cork --dbpath %cluster_directory%\"cork0" --port 27100
start /b %mongod_exe% --replSet cork --dbpath %cluster_directory%\"cork1" --port 27101
start /b %mongod_exe% --replSet cork --dbpath %cluster_directory%\"cork2" --port 27102
start /b %mongod_exe% --replSet limerick --dbpath %cluster_directory%\"limerick0" --port 27200
start /b %mongod_exe% --replSet limerick --dbpath %cluster_directory%\"limerick1" --port 27201
start /b %mongod_exe% --replSet limerick --dbpath %cluster_directory%\"limerick2" --port 27202
start /b %mongod_exe% --replSet galway --dbpath %cluster_directory%\"galway0" --port 27300
start /b %mongod_exe% --replSet galway --dbpath %cluster_directory%\"galway1" --port 27301
start /b %mongod_exe% --replSet galway --dbpath %cluster_directory%\"galway2" --port 27302
REM #	
