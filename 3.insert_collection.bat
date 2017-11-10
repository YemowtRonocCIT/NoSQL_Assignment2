REM #
REM #---------------------------------------------------#
REM #						        #
REM # 5. Insert collection from File		        #
REM #						        #
REM #---------------------------------------------------#
REM #	
SET original_directory="%cd%"
SET mongo_import_exe=mongoimport.exe

cd C:\"Program Files"\MongoDB\Server\3.0\bin
%mongo_import_exe% --db test --collection restaurants --drop --file %original_directory%\3.restaurants_dataset.json
cd %original_directory%
REM #



