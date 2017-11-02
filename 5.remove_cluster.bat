REM #
REM #---------------------------------------------------#
REM #						        #
REM # 7. Remove Cluster				        #
REM #						        #
REM #---------------------------------------------------#
REM #	
SET user_name=Conor
SET cluster_directory=C:\Users\%user_name%\Documents\College\NoSQL_Data_Architectures\Assignment_2\Clusters

RMDIR /S /Q %cluster_directory%\cfg0
RMDIR /S /Q %cluster_directory%\cfg1
RMDIR /S /Q %cluster_directory%\cfg2
REM # 
RMDIR /S /Q %cluster_directory%\dublin0
RMDIR /S /Q %cluster_directory%\dublin1
RMDIR /S /Q %cluster_directory%\dublin2
REM # 
RMDIR /S /Q %cluster_directory%\cork0
RMDIR /S /Q %cluster_directory%\cork1
RMDIR /S /Q %cluster_directory%\cork2
REM # 
RMDIR /S /Q %cluster_directory%\limerick0
RMDIR /S /Q %cluster_directory%\limerick1
RMDIR /S /Q %cluster_directory%\limerick2
REM # 
RMDIR /S /Q %cluster_directory%\galway0
RMDIR /S /Q %cluster_directory%\galway1
RMDIR /S /Q %cluster_directory%\galway2
REM # 