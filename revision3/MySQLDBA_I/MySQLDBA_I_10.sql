-- I.10. Suppression et modification de donnees
                -- --------------------------------------------
                    -- I.10.1. Sauvegarde d'une base de donnees
                    -- I.10.2. Suppression
                    -- I.10.3. Modification


                    # Vous savez comment insérer des données, vous savez comment les sélectionner et les ordonner
                    # selon les critères de votre choix, il est temps maintenant d’apprendre à les supprimer et les
                    # modifier ! Avant cela, un petit détour par le client mysqldump, qui vous permet de sauvegarder
                    # vos bases de données. Je ne voudrais en effet pas vous lâcher dans le chapitre de suppression de
                    # données sans que vous n’ayez la possibilité de faire un backup de votre base. Je vous connais,
                    # vous allez faire des bêtises, et vous direz encore que c’est de ma faute...



                    -- I.10.1. Sauvegarde d'une base de donnees
                    -- ----------------------------------------

                        # Il est bien utile de pouvoir sauvegarder facilement sa base de données, et très important de la
                # sauvegarder régulièrement. Une mauvaise manipulation (ou un méchant pirate s’il s’agit d’un
                # site web) et toutes les données peuvent disparaître. MySQL dispose donc d’un outil spécialement
                # dédié à la sauvegarde des données sous forme de fichiers texte : mysqldump.
                
                # Cette fonction de sauvegarde s’utilise à partir de la console. Vous devez donc être déconnectés
                # de MySQL pour la lancer. Si c’est votre cas, tapez simplement exit
                
                # Vous êtes maintenant dans la console Windows (ou Mac, ou Linux). La manière classique de
                # faire une sauvegarde d’une base de données est de taper la commande suivante :


                #######################################################################
                #                                                                     #
                #               SYNTAXE: exportation base de donnees                  #
                #                                                                     #
                #     mysqldump -u user -p --opt nom_de_la_base > sauvegarde.sqL      #
                #                                                                     #
                #######################################################################

                # — mysqldump : il s’agit du client permettant de sauvegarder les bases. Rien de spécial à
                #   signaler.

                # — --opt : c’est une option de mysqldump qui lance la commande avec une série de
                #   paramètres qui font que la commande s’effectue très rapidement.

                # — nom_de_la_base : vous l’avez sans doute deviné, c’est ici qu’il faut indiquer le nom de
                #   la base qu’on veut sauvegarder.

                # — > sauvegarde.sql : le signe > indique que l’on va donner la destination de ce qui
                #   va être généré par la commande : sauvegarde.sql. Il s’agit du nom du fichier qui
                #   contiendra la sauvegarde de notre base. Vous pouvez bien sûr l’appeler comme bon vous
                #   semble.



                ############
                #          #
                #   CODE   #
                #          #
                ############


                # C:\wamp64\bin\mysql\mysql8.0.31\bin>mysql -u root -p
                # Enter password: *********
                # Welcome to the MySQL monitor.  Commands end with ; or \g.
                # Your MySQL connection id is 55
                # Server version: 8.0.32 MySQL Community Server - GPL
                # 
                # Copyright (c) 2000, 2022, Oracle and/or its affiliates.
                # 
                # Oracle is a registered trademark of Oracle Corporation and/or its
                # affiliates. Other names may be trademarks of their respective
                # owners.
                # 
                # Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


                # mysql> CREATE DATABASE Ex6csv;
                # Query OK, 1 row affected (0.06 sec)
                
                # mysql> connect Ex6csv;
                # Connection id:    49
                # Current database: Ex6csv
                
                # mysql> source C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\table_ex6csv.sql
                # Query OK, 0 rows affected (0.10 sec)

                # mysql> exit;
                # Bye


                -- C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p nom_base_de_donnee > path + nom_fichier.sql
                -- Enter password: *********


                # C:\wamp64\bin\mysql\mysql8.0.31\bin>mysqldump  -u root -p ex6csv >  C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\ex6csv.sql
                # Enter password: *********

                # C:\wamp64\bin\mysql\mysql8.0.31\bin>mysqldump  -u root -p ex6csv >  C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\fiompina.sql
                # Enter password: *********






                ##########################################################
                #                                                        #
                #          SYNTAXE: Importation base de donnees          #
                #                                                        #
                #    mysql nom_base < chemin_fichier_de_sauvegarde.sq    #
                #                                                        #
                ##########################################################


                # La base de données est donc sauvegardée. Notez que la commande pour créer la base elle-même
                # n’est pas sauvée. Donc, si vous effacez votre base par mégarde, il vous faut d’abord recréer
                # la base de données (avec CREATE DATABASE nom_base), puis exécuter la commande suivante
                # (dans la console):

                # mysql> DROP DATABASE ex6csv;
                # Query OK, 1 row affected (0.62 sec)

                # mysql nom_base < chemin_fichier_de_sauvegarde.sql

                # mysql> CREATE DATABASE Ex6csv;
                # Query OK, 1 row affected (0.06 sec)
                
                # mysql> exit;
                # Bye

                # C:\wamp64\bin\mysql\mysql8.0.31\bin>mysql -u root -p  ex6csv < C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\ex6csv.sql
                # Enter password: *********
                

                ######################
                #                    #
                #    VERIFICATION    #
                #                    #
                ######################

                SHOW DATABASES;

                USE ex6csv;

                SHOW TABLES;

                SELECT * FROM ex6csv limit 100000;




            -- I.10.2. Suppression
            -- -------------------

            # La commande utilisée pour supprimer des données est DELETE. Cette opération est irréversible,
            # soyez très prudents ! On utilise la clause WHERE de la même manière qu’avec la commande
            # SELECT pour préciser quelles lignes doivent être supprimées.


            ##############################################
            #                                            #
            #         SYNTAXE SUPPRESSION:               #
            #                                            #
            #    DELETE FROM nom_table WHERE critères;   #
            #                                            #
            ##############################################


            # Par exemple : Zoulou est mort, paix à son âme ... Nous allons donc le retirer de la base de
            # données.

            USE fiompina;

            SELECT *     
            FROM nimal 
            WHERE nom = 'Zoulou';

            DELETE 
            FROM Animal 
            WHERE nom = 'Zoulou';


            
            -- I.10.3. Modification
            -- --------------------

                # La modification des données se fait grâce à la commande UPDATE, dont la syntaxe est la
                # suivante :

            
                ########################################################################
                #                                                                      #
                #                   SYNTAXE MODIFICATION:                              #
                #                                                                      #
                # UPDATE nom_table SET coll = val1 [, col2 = val2, ...] [ WHERE .... ];#
                #                                                                      #
                ########################################################################


                # Par exemple, vous étiez persuadés que ce petit Pataud était un mâle mais, quelques semaines
                # plus tard, vous vous rendez compte de votre erreur. Il vous faut donc modifier son sexe, mais
                # aussi son nom. Voici la requête qui va vous le permettre :


                UPDATE Animal
                SET sexe = 'F', nom = 'Pataude'
                WHERE id = 49;
            
                SELECT *
                FROM Animal
                WHERE id = 49;

            
            -- I.10.3.1. En resume
            -- -------------------

              # — Le client mysqldump est un programme qui permet de sauvegarder facilement ses bases
              #     de données.
              # — La commande DELETE permet de supprimer des données.
              # — La commande UPDATE permet de modifier des données.