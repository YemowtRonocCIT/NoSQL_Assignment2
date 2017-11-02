REM #
REM #---------------------------------------------------#
REM #						        #
REM # 6. Shard the collection			        #
REM #						        #
REM #---------------------------------------------------#
REM #
SET mongo_exe=C:\"Program Files"\MongoDB\Server\3.0\bin\mongo.exe
%mongo_exe% --shell 4.shard_collection.js
REM #



