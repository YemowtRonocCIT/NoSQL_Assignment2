SET mongo_exe=C:\Program Files\MongoDB\Server\3.4\bin\mongo.exe
SET original_directory="%cd%"
SET connector_directory=C:\"Program Files (x86)"\Python36-32\Lib\site-packages\mongo_connector

cd %connector_directory%
python connector.py -m localhost:27000 -t http://localhost:7474/db/data -d neo4j_doc_manager
%mongo_exe% --port 27000
REM python connector.py -m localhost:27100 -t http://localhost:7474/db/data -d neo4j_doc_manager
REM %mongo_exe% --port 27100
REM python connector.py -m localhost:27200 -t http://localhost:7474/db/data -d neo4j_doc_manager
REM %mongo_exe% --port 27200
REM python connector.py -m localhost:27300 -t http://localhost:7474/db/data -d neo4j_doc_manager
REM %mongo_exe% --port 27300
cd %original_directory%