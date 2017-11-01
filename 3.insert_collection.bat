REM #
REM #---------------------------------------------------#
REM #						        #
REM # 5. Insert collection from File		        #
REM #						        #
REM #---------------------------------------------------#
REM #	
SET mongo_import_exe=C:\"Program Files"\MongoDB\Server\3.0\bin\mongoimport.exe
%mongo_import_exe% --db test --collection restaurants --drop --file 3.restaurants_dataset.json
REM #



