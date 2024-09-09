 -- I.7. Insertion de donnees
-- -------------------------
    -- I.7.1. Syntaxe de INSERT
    -- I.7.2. Syntaxe alternative de MySQL
    -- I.7.3. Utilisation de fichiers externes
    -- I.7.4. Remplissage de la base

            # Ce chapitre est consacré à l’insertion de données dans une table. Rien de bien compliqué, mais
            # c’est évidemment crucial. En effet, que serait une base de données sans données ?
            # Nous verrons entre autres :
                        
            # — comment insérer une ligne dans une table ;
            # — comment insérer plusieurs lignes dans une table ;
            # — comment exécuter des requêtes SQL écrites dans un fichier (requêtes d’insertion ou
            #   autres) ;
            # — comment insérer dans une table des lignes définies dans un fichier de format particulier.
            #   Et pour terminer, nous peuplerons notre table Animal d’une soixantaine de petites bestioles sur
            #   lesquelles nous pourrons tester toutes sortes de tortures requêtes dans la suite de ce tutoriel


    -- I.7.1. Syntaxe de INSERT
    -- ------------------------
        -- I.7.1.1. Insertion sans preciser les colonnes
        -- I.7.1.2. Insertion en precisant les colonnes
        -- I.7.1.3. Insertion multiple

            # Deux possibilités s’offrent à nous lorsque l’on veut insérer une ligne dans une table : soit donner
            # une valeur pour chaque colonne de la ligne, soit ne donner les valeurs que de certaines colonnes,
            # auquel cas il faut bien sûr préciser de quelles colonnes il s’agit


        -- I.7.1.1. Insertion sans preciser les colonnes
        -- ---------------------------------------------

            # Je rappelle pour les distraits que notre table Animal est composée de six colonnes : id, espece,
            # sex, date_naissance, nom et commentaires.
                            
            # Voici donc la syntaxe à utiliser pour insérer une ligne dans Animal, sans renseigner les colonnes
            # pour lesquelles on donne une valeur (implicitement, MySQL considère que l’on donne une valeur
            # pour chaque colonne de la table)

                            ALTER TABLE animal CHANGE sex sexe CHAR(1);

                            INSERT INTO Animal
                            VALUES (2, 'chat', NULL, '2010-03-24 02:23:00', 'Roucky', NULL);


                            # Deuxième exemple : cette fois-ci, on ne connaît pas le sexe et on n’a aucun commentaire à
                            # faire sur la bestiole :
                            
                            INSERT INTO Animal 
                            VALUES (1, 'chien', 'M', '2010-04-05 13:43:00', 'Rox',
                            'Mordille beaucoup');


                            # Troisième et dernier exemple : on donne NULL comme valeur d’id, ce qui en principe est
                            # impossible puisque id est défini comme NOT NULL et comme clé primaire. Cependant, l’auto-
                            # incrémentation fait que MySQL va calculer tout seul comme un grand quel id il faut donner à
                            # la ligne (ici : 3).

                            INSERT INTO Animal
                            VALUES (NULL , 'chat', 'F', '2010-09-13 15:02:00',
                            'Schtroumpfette', NULL);

                            SELECT * FROM Animal;


                            # Deux choses importantes à retenir ici.
                            
                            # — id est un nombre, on ne met donc pas de guillemets autour. Par contre, l’espèce, le nom,
                            #   la date de naissance et le sexe sont donnés sous forme de chaînes de caractères. Les
                            #   guillemets sont donc indispensables. Quant à NULL, il s’agit d’un marqueur SQL qui, je
                            #   rappelle, signifie ”pas de valeur”. Pas de guillemets donc.
                            
                            # — Les valeurs des colonnes sont données dans le bon ordre (donc dans l’ordre donné lors
                            #   de la création de la table). C’est indispensable évidemment. Si vous échangez le nom et
                            #   l’espèce par exemple, comment MySQL pourrait-il le savoir ?



                        -- I.7.1.2. Insertion en precisant les colonnes
                        -- --------------------------------------------

                            # Dans la requête, nous allons donc écrire explicitement à quelle(s) colonne(s) nous donnons une
                            # valeur. Ceci va permettre deux choses.
                            
                            # — On ne doit plus donner les valeurs dans l’ordre de création des colonnes, mais dans l’ordre
                            # précisé par la requête.
                            
                            # — On n’est plus obligé de donner une valeur à chaque colonne ; plus besoin de NULL lorsqu’on
                            # n’a pas de valeur à mettre.
                            
                            # Quelques exemple:


                            INSERT INTO Animal (espece, sexe, date_naissance)
                            VALUES ('tortue', 'F', '2009-08-03 05:12:00');
                            
                            INSERT INTO Animal (nom, commentaires, date_naissance, espece)
                            VALUES ('Choupi', 'Né sans oreille gauche',
                            '2010-10-03 16:44:00', 'chat');
                            
                            INSERT INTO Animal (espece, date_naissance, commentaires, nom,
                            sexe)
                            VALUES ('tortue', '2009-06-13 08:17:00', 'Carapace bizarre',
                            'Bobosse', 'F');


                            SELECT * FROM Animal;

                            SELECT COUNT(espece) FROM Animal;
                        
                            DELETE FROM Animal where id = 7;



                        -- I.7.1.3. Insertion multiple
                        -- ---------------------------

                            # Si vous avez plusieurs lignes à introduire, il est possible de le faire en une seule requête de la
                            # manière suivante:

                            INSERT INTO Animal 
                            (espece, sexe, date_naissance, nom)
                            VALUES 
                            ('chien', 'F', '2008-12-06 05:18:00', 'Caroline'),
                            ('chat', 'M', '2008-09-11 15:38:00', 'Bagherra'),
                            ('tortue', NULL, '2010-08-23 05:18:00', NULL);


                            SELECT * FROM Animal;

                    -- I.7.2. Syntaxe alternative de MySQL
                    -- -----------------------------------

                        # MySQL propose une syntaxe alternative à INSERT INTO ... VALUES ... pour insérer des
                        # données dans une table.

                        INSERT INTO Animal 
                        SET nom='Bobo', espece='chien', sexe='M',
                        date_naissance='2010-07-21 15:41:00';

                        # Cette syntaxe présente deux avantages:
                        
                        # — Le fait d’avoir l’un à côté de l’autre la colonne et la valeur qu’on lui attribue (nom =
                        #   'Bobo') rend la syntaxe plus lisible et plus facile à manipuler. En effet, ici il n’y a que
                        #   six colonnes, mais imaginez une table avec 20, voire 100 colonnes. Difficile d’être sûrs
                        #   que l’ordre dans lequel on a déclaré les colonnes est bien le même que l’ordre des valeurs
                        #   qu’on leur donne...
                        
                        # — Elle est très semblable à la syntaxe de UPDATE, que nous verrons plus tard et qui permet
                        #   de modifier des données existantes. C’est donc moins de choses à retenir (mais bon, une
                        #   requête de plus ou de moins, ce n’est pas non plus énorme...)


            ################################################################################################
            #                                                                                              #
            # Cependant, cette syntaxe alternative présente également des défauts, qui pour moi sont       #
            # plus importants que les avantages apportés. C’est pourquoi je vous déconseille de l’utiliser.#
            # Je vous la montre surtout pour que vous ne soyez pas surpris si vous la rencontrez quelque   #
            # part.                                                                                        #
            #                                                                                              #
            ################################################################################################


                        # En effet, cette syntaxe présente deux défauts majeurs.
                        
                        # — Elle est propre à MySQL. Ce n’est pas du SQL pur. De ce fait, si vous décidez un jour de
                        #   migrer votre base vers un autre SGBDR, vous devrez réécrire toutes les requêtes INSERT
                        #   utilisant cette syntaxe.
                    
                        # — Elle ne permet pas l’insertion multiple.


                    -- I.7.3. Utilisation de fichiers externes
                    -- ---------------------------------------
                        -- I.7.3.1. Executer des commandes SQL a partir d'un fichier
                        -- I.7.3.2. Inserer des donnees a partir d'un fichier formate
                    

                        -- I.7.3.1. Executer des commandes SQL a partir d'un fichier
                        -- ---------------------------------------------------------

                            SOURCE C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\remplissageAnimal.sql
                            # Any commande dos (cmd) io mandeha

                            SELECT * FROM Animal;



                        -- I.7.3.2. Inserer des donnees a partir d'un fichier formate
                        -- ----------------------------------------------------------
                            -- I.7.3.2.1. Fichier txt
                            -- I.7.3.2.2. Fichier csv


                                # ny code manaraka rehetra eto dia MANDEHA NA AMIN NY EDITEUR TEXT na any amin ny commande dos no mandeha:

                                # VOALOHANY mampiditra parametre local_infile rehefa hiditra mysql

                                # C:\wamp64\bin\mysql\mysql8.0.31\bin>mysql --local_infile=1 -u root -p
                                # Enter password: ********* (mot passe cahe io * fa sao dia misy mieritreritra hoe io ny mot passeko :) 


                                # FAHAROA miactive commande local_infile far par defaut izy io desactive par raison de securite;
                                # raha mila fanazavana misimisy koakoa dia midira any site Web MySQL.

                                SHOW GLOBAL VARIABLES LIKE 'local_infile';

                                # OFF ny local_infile raha desactiver dia ON kosa raha active 

                                # mysql> set global local_infile=1; -- 1 ~ activer , 0 ~ desactiver

                                set global local_infile=1
                                
                                # Query OK, 0 rows affected (0.07 sec)



                            -- I.7.3.2.1. Fichier format txt
                            -- -----------------------------

                                # Creation table;
                                SOURCE C:\Users\FUJITSU\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\st_tb.sql

                                DESC Student;

                                LOAD DATA LOCAL infile "C:/Users/FUJITSU/Desktop/informatique/Mysql/MySqlVsCodeGit/revision/data.txt" 
                                INTO TABLE Student;

                                SELECT * FROM Student;


                            -- I.7.3.2.2. Fichier format csv
                            -- -----------------------------

                                # Creation table;

                                CREATE TABLE  LoadCsvExa(
                                stname VARCHAR(20),
                                rollno INT(3),
                                subject VARCHAR(255));

                                LOAD DATA LOCAL infile "C:/db/Stdata.csv" 
                                INTO TABLE loadCsvExa FIELDS TERMINATED BY ";" 
                                OPTIONALLY ENCLOSED BY '"' 
                                LINES TERMINATED BY '\r\n' 
                                IGNORE 1 LINES;

                                SELECT * FROM LoadCsvExa;


                                CREATE TABLE EX6CSV(
                                one DECIMAL(15,13),
                                two DECIMAL(15,13),
                                three DECIMAL(15,13),
                                four DECIMAL(15,13),
                                cle VARCHAR(1));

                                # Insertion des donnee de 10 000 lignes et 5 colonnes.

                                LOAD DATA LOCAL infile "C:/Users/PERSONNE/Desktop/informatique/Python Data Analysis/data/pydata-book-3rd-edition/examples/ex6.csv"   
                                INTO TABLE ex6csv FIELDS TERMINATED BY "," 
                                OPTIONALLY ENCLOSED BY '"' 
                                LINES TERMINATED BY '\n' # nesorina ny r satria tsy mandeha ny insertion raha misy an iny
                                IGNORE 1 LINES;

                                SELECT * FROM ex6csv limit 10000;


                                # Syntaxe

                                # LOAD DATA [LOCAL] INFILE 'Path + nom_fichier'
                                # INTO TABLE nom_table
                                # [FIELDS
                                #     [TERMINATED BY '\t']
                                #     [ENCLOSED BY '']
                                #     [ESCAPED BY '\\' ]
                                # ]
                                # [LINES
                                #     [STARTING BY '']
                                #     [TERMINATED BY '\n']
                                # ]
                                # [IGNORE nombre LINES]
                                # [(nom_colonne,...)];
                                

                                # Le mot-clé LOCAL sert à spécifier si le fichier se trouve côté client (dans ce cas, on utilise LOCAL)
                                # ou côté serveur (auquel cas, on ne met pas LOCAL dans la commande). Si le fichier se trouve
                                # du côté serveur, il est obligatoire, pour des raisons de sécurité, qu’il soit dans le répertoire de
                                # la base de données, c’est-à-dire dans le répertoire créé par MySQL à la création de la base de
                                # données, et qui contient les fichiers dans lesquels sont stockées les données de la base. Pour
                                # ma part, j’utiliserai toujours LOCAL, afin de pouvoir mettre simplement mes fichiers dans mon
                                # dossier de travail.
                                
                                # Les clauses FIELDS et LINES permettent de définir le format de fichier utilisé. FIELDS se
                                # rapporte aux colonnes, et LINES aux lignes (si si ). Ces deux clauses sont facultatives. Les
                                # valeurs que j’ai mises ci-dessus sont les valeurs par défaut.
                                
                                # Si vous précisez une clause FIELDS, il faut lui donner au moins une des trois ”sous-clauses”.
                                
                                # — TERMINATED BY, qui définit le caractère séparant les colonnes, entre guillemets bien sûr.
                                #   '\t' correspond à une tabulation. C’est le caractère par défaut.
                                
                                # — ENCLOSED BY, qui définit le caractère entourant les valeurs dans chaque colonne (vide
                                #   par défaut).
                                
                                # — ESCAPED BY, qui définit le caractère d’échappement pour les caractères spéciaux. Si par
                                #   exemple vous définissez vos valeurs comme entourées d’apostrophes, mais que certaines
                                #   valeurs contiennent des apostrophes, il faut échapper ces apostrophes ”internes” afin
                                #   qu’elles ne soient pas considérées comme un début ou une fin de valeur. Par défaut, il
                                #   s’agit du \ habituel. Remarquez qu’il faut lui-même l’échapper dans la clause.
                                
                                # De même pour LINES, si vous l’utilisez, il faut lui donner une ou deux sous-clauses.
                                
                                # — STARTING BY, qui définit le caractère de début de ligne (vide par défaut).
                                
                                # — TERMINATED BY, qui définit le caractère de fin de ligne ('\n' par défaut, mais attention :
                                #   les fichiers générés sous Windows ont souvent '\r\n' comme caractère de fin de ligne).
                                
                                
                                # La clause IGNORE nombre LINES permet... d’ignorer un certain nombre de lignes. Par exemple,
                                #   si la première ligne de votre fichier contient les noms des colonnes, vous ne voulez pas l’insérer
                                #   dans votre table. Il suffit alors d’utiliser IGNORE 1 LINES.
                                
                                # Enfin, vous pouvez préciser le nom des colonnes présentes dans votre fichier. Attention évidem-
                                #   ment à ce que les colonnes absentes acceptent NULL ou soient auto-incrémentées.
                                #   Si je reprends mon exemple, en imaginant que nous ayons une table Personne contenant les
                                #   colonnes id (clé primaire auto-incrémentée), nom, prenom, date_naissance et adresse (qui peut
                                #   être NULL).
                                
                                # tsy mandeha io (problem fichier , syntaxe ok)
                                LOAD DATA LOCAL infile "C:/Users/PERSONNE/Desktop/informatique/Mysql/MySqlVsCodeGit/revision/animal11.csv" 
                                INTO TABLE Animal FIELDS TERMINATED BY "," 
                                OPTIONALLY ENCLOSED BY '"' 
                                LINES TERMINATED BY '\r\n'
                                (espece, sexe, date_naissance, nom, commentaires);

                                SELECT * FROM Animal;
                                
                                desc animal;
                    

                    -- I.7.4. Remplissage de la base
                    -- -----------------------------
                        -- I.7.4.1. Execution de commandes SQL
                        -- I.7.4.2. LOAD DATA INFILE
                        -- I.7.4.3. En resume

                        # efa ireo ambony ireo ilay izy fa aza miasa saina be.
