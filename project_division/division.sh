#########################################################################################################
# Calcultrice de DIVISION de 2 nombres
# Auteur  : ACH
# Date    : 18/10/2022
# Version : 0.4
# Modication :
#  WCH 18/10/2022 :  Ajout d'une boucle d'exécution
#  ACH 19/10/2022 :  gestion des messages d'erreurs
#  ACH 20/10/2022 :  ajout d'un  paramete a notre script
#
#########################################################################################################

#################################################################
 #les arguments du scrip : 
#echo "Nombre d'arguments ... :  "$#
#echo "Les arguments sont ... :  "$*
#echo "Le second argument est :  "$2
nbs=$#           # un seul argument demander dans cet exercice 
tys=$*           # l argument doit etre un entier (integer)  
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
#boucle selon la valeur du marametre du scrip 
f=$1+1
#variables erreur


# truc de creation d un fichier log avec une date  et en plus pour determiner la tete de tout les  erreur dans le fichier log
ts=`date '+%Y%m%d%H%M%S'`
logfile="division.log.$ts"
#################################################################
#date de lerreur

### pour rendre le chemain du script dynamique a lentete du fichier log
SCRIPTNAME=`basename "$0"`
arbre=`pwd`
echo " *************$arbre/$SCRIPTNAME *************" $'\r' >> $logfile.log

#################################################################
# variable de suivie des erreurs 
erreur="*"
#################################################################
qs=" Voulez vous continuer "
#################################################################
# variable date des erreurs 
te=`date -u`
#################################################################
   
   
   # test des arguments du script
if  [[ nbs="1" ]] && [[ $tys = +([0-9]) ]] && [[ $tys != 0 ]]


  then
     echo "******Bienvenue dans Division de 2 nombres entiers*******"
     echo "----------------------------------------------------------------"


               while  [[ $rep = "o" ]] && [[ $f > 1 ]]
                  do 
				    echo "Donner N1 :"
                    read N1
                    echo "Donner N2 :"
                    read N2 
  # Test N1
  # N1 not numeric
                          if [[ $N1 != +([0-9]) ]]
                            then
                             erreur="$te ========>Erreur : N1 doit être un nombre !"
	                         echo $erreur
	                         echo $erreur $'\r' >> $logfile.log
                         
	 # N1 numeric
                          else
  # N1 numeric mais N2 not numeric
                              if [[ $N2 != +([0-9]) ]] 
                               then
                                erreur="$te ========>Erreur : N2 doit être un nombre !"
	                            echo $erreur
	                            echo $erreur $'\r' >> $logfile.log
	                      
  # N1 et  N2 numeric , en passe au test si N2 = ou non a 0
                              else 
                                   if [[ $N2 = 0 ]] 
                                    then
  	                                   erreur="$te ========>Erreur : N2 doit être pas ZERO !"
	                                   echo $erreur
	                                   echo $erreur  $'\r'  >> $logfile.log
	                    
 	# toutee les condition de la division sont juste
                                   else
         #command awk pour faire la division en float de deux nombre                   
                                       echo "la division de $N1 par $N2 est =  [  `RES= awk "BEGIN {print $N1/$N2}"`  ]"
						    
	                                fi
                               fi
                          fi				
				
				#instruction d incrementation 
                                let  "f--"

  
                                         if  [[ $rep = "n" ]]
									       then 
										       [[ f="1" ]]                                                													   
											 else  
								          #echo "$f"
								                    while [[ $f > 0 ]] && [[ $rep = "o" ]]
									                   do
                                                          if [ $f = 1 ]
										                   then 
										                      break									                      
										                    else 
										                      echo " $qs "
										                      read rep
										                   fi  
											   
										      
											                 while [[ $rep != "o" ]] && [[ $rep != "n" ]]
											                  do 
											                  echo " Saisie invalide : tapez o/n "
											                  read rep
											                  done
										             break  
											   
                                                    
										            done	
                                          fi

    done										
													
else 
 echo " parametre du script incorrect "

fi 