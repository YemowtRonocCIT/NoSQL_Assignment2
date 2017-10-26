REM #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 0. Set myName to the name of the computer       #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
SET myName=COM-SDH4.R00121583
REM #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 1. Start the config server database instances   #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 1.1. Create the data directory for each of the config servers
REM #	
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg0
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg1
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg2
REM #	
REM # 1.2. Start the config server instances 
REM #
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe --configsvr --dbpath" "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg0" --port 26050
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe --configsvr --dbpath" "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg1" --port 26051
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe --configsvr --dbpath" "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cfg2" --port 26052
REM #	
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#

pause
REM #						      #
REM # 2. Start the "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos instances   		      #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 2.1. A first "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos process listens to the default port 27017
REM #	
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos.exe "--configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052

pause
REM #	
REM # 2.2. Remaining "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos processes listen to the explicit ports assigned by us
REM #	
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos.exe "--configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26061

pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos.exe "--configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26062
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongos.exe "--configdb %myName%.local:26050,%myName%.local:26051,%myName%.local:26052 --port 26063
pause
REM #	
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #						      #
REM # 3. Create the shards of our cluster	      #
REM #						      #
REM #"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"--"---#
REM #	
REM # 3.1. Create the data directory for each of the replica sets servers
REM #	
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin0
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin1
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin2
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork0
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork1
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork2
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick0
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick1
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick2
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway0
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway1
mkdir "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway2
REM #	
REM # 3.2. Start each member of the replica set 
REM #	
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe"--replSet dublin --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin0 "--port 27000
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe"--replSet dublin --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin1"--port 27001
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe"--replSet dublin --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"dublin2"--port 27002
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet cork --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork0 "--port 27100
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet cork --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork1 "--port 27101
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet cork --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"cork2 "--port 27102
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet limerick --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick0 "--port 27200
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet limerick --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick1 "--port 27201
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet limerick --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"limerick2 "--port 27202
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet galway --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway0 "--port 27300
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet galway --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway1 "--port 27301
pause
start /b "C:"\"Program Files"\"MongoDB"\"Server"\"3.0"\"bin"\"mongod.exe "--replSet galway --dbpath "C:"\"Users"\"Conor"\"Documents"\"College"\"NoSQL Data Architectures"\"Assignment 2"\"Setup Scripts"\"galway2 "--port 27302
pause
REM #	
