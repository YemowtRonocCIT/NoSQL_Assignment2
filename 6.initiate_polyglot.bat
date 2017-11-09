SET mongo_exe=C:\Program Files\MongoDB\Server\3.4\bin\mongo.exe
SET connector_directory=C:\"Program Files (x86)"\Python36-32\Lib\site-packages\mongo_connector

cd %connector_directory%
python connector.py -m localhost:27000 -t http://localhost:7474/db/data -d neo4j_doc_manager
%mongo_exe% --port 27000