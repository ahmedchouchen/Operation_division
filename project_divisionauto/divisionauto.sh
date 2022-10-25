#########################################################################################################
# Calcultrice de DIVISION-AUTO de 2 nombres 
# Auteur  : ACH
# Date    : 22/10/2022
# Version : 0.5
# Modication :
#  ACH 21/10/2022 :  Ajout d'une boucle d'exécution
#  ACH 21/10/2022 :  gestion de fichier output  et de fichier log
#  ACH 22/10/2022 :  Lancer le script en mode arrière plan
#  ACH 23/10/2022 :    Planification du script
#########################################################################################################


 
#################################################################         
#echo "Et le code de retour du dernier echo est :  "$
#################################################################

###
# la valeur f va indiquer le nombre maximal dexecution "
#echo "votre max est $1"
#################################################################
# valeur intialiser pour rendre le boucle continue , rep sera la valeur du choix du continuation  
rep="o"
#################################################################


division="divisionauto"


#################################################################
# variable date 
te_debut=`date -u`  # temps de debut execution 
te_fin=`date -u`       # temps de fin  execution 
#################################################################
##############################################################################################
 #!/bin/bash
   
ts=`date '+%Y%m%d%H%M%S'`
logfile="divisionauto"
status="Status :"
F="Failed"
S="Success"
des="======>"
mess="Pas de fichier input"
exist="0"
#SCRIPTNAME=`basename "$0"`
#arbre=`pwd`

 chemain=`pwd`
 creation=$chemain/division$ts  #chemain de  création d un nouveau repertoire horodaté appelé division<dateheure>

 
   
if [ -e input.txt ]
then
#message de test
     #echo "Traitement de fichier input .txt ====> voir le resultat dans output.txt :$creation/output.txt"
	 mkdir  $creation
	 # test de condition sur  la valeur de la  2eme colone 
	 echo "************ Debut Execution divisionauto :  $te_debut ************ "$'\r'  $'\r'$'\r' >>  $logfile.log 
	 echo "Status  : Success"$'\r' >> $logfile.log
     awk '{if($2!=0){print $1, $2 ,$3=$1/$2;}else{print $1, $2 , "ERREUR" ;}}' input.txt >> $creation/output.txt
	  # creation et chargement du fichier log 
	 te_fin=`date -u`
	 echo "************ Fin   Execution divisionauto :  $te_fin ************ "$'\r'  $'\r'$'\r' >> $logfile.log
else 
#message de test     
     #echo "Traitement de fichier input .txt échoué : abscence de fichier (voir divisionauto.log :$creation/output.txt ) "
	 echo "************ Debut Execution divisionauto :  $te_debut ************ "$'\r'   >>  $logfile.log 
	  
	 echo "Status  : Failed ==> Pas de fichier input "$'\r' >> $logfile.log 
		     
	
     echo "************ Fin   Execution divisionauto :  $te_fin ************ "$'\r'   >> $logfile.log
     #awk '{if($exist!=0){print $1=$status, $2=$F ,$3=$des,$4=$mess;}else{print $1=$status, $2=$S ;}}' vide.txt.txt >> $logfile.log
	 
fi
   
   
