            -- Active: 1714359672949@@127.0.0.1@3306@fiompina
            USE Fiompina;

            # Dictionaire de Donnee aza adino fa tsy ao antin ity boky ity 


            -- I. MySQL et les bases du langage SQL
            -- ------------------------------------
                -- I.1. Introduction
                -- I.2. Installation de MySQL
                -- I.3. Les types de donnees
                -- I.4. Creation d'une base de donnees
                -- I.5. Creation de tables
                -- I.6. Modification d'une table
                -- I.7. Insertion de donnees
                -- I.8. Selection de donnees
                -- I.9. Elargir la possibilite de la clause WHERE
                -- I.10. Suppression et modification de donnees


                -- I.1. Introduction
                -- -----------------
                    -- I.1.1. Concept de base
                    -- I.1.2. Presentation succinte de MySQL
                    -- I.1.3. Presentation de ses Concurrents
                    -- I.1.4. Organisation d'une base de donnees


                    -- I.1.1. Concept de base
                    -- ----------------------
                        -- I.1.1.1. Base de donnees
                        -- I.1.1.2. SGBD
                            -- I.1.1.2.1. Le paradigme client-serveur
                        -- I.1.1.3. SGBDR
                        -- I.1.1.4. Le langage SQL


                        -- I.1.1.1. Base de donnees
                        -- ------------------------

                        # Une base de données informatique est
                        # un ensemble de données qui ont été stockées 
                        # sur un support informatique, et organisées
                        # et structurées de manière à pouvoir facilement
                        # consulter et modifier leur contenu.
                        

                        # Une base de données seule ne suffit donc pas,
                        # il est nécessaire d’avoir également :
                        # — un système permettant de gérer cette base;
                        # — un langage pour transmettre des instructions
                        # à la base de données (par l’intermédiaire du système de gestion).
                    
                    
                        -- I.1.1.2. SGBD
                        -- -------------
                            -- I.1.1.2.1. Le paradigme client-serveur
                            
                        # Un Système de Gestion de Base de Données
                        # (SGBD) est un logiciel (ou un ensemble de
                        # logiciels) permettant de manipuler les
                        # données d’une base de données.

                        # MySQL est un système de gestion de bases de données.


                            -- I.1.1.2.1. Le paradigme client-serveur
                            -- --------------------------------------

                            # La plupart des SGBD sont basés sur un modèle
                            # Client - Serveur. C’est-à-dire que la base de
                            # données se trouve sur un serveur qui ne sert 
                            # qu’à ça, et pour interagir avec cette base de données,
                            # il faut utiliser un logiciel ”client” qui va interroger
                            # le serveur et transmettre la réponse que le serveur 
                            # lui aura donnée.

                            # Le serveur peut être installé sur une machine
                            # différente du client ; c’est souvent le cas
                            # lorsque les bases de données sont importantes.

                            # Par conséquent, lorsque vous installez un SGBD basé
                            # sur ce modèle (c’est le cas de MySQL), vous installez 
                            # en réalité deux choses (au moins) : le serveur,
                            # et le client. Chaque requête
                            # (insertion/modification/lecture de données) est faite
                            # par l’intermédiaire du client. Jamais vous ne discuterez 
                            # directement avec le serveur (d’ailleurs, il ne 
                            # comprendrait rien à ce que vous diriez).
                            

                            # Vous avez donc besoin d’un langage pour discuter avec
                            # le client, pour lui donner les requêtes que vous souhaitez
                            # effectuer. Dans le cas de MySQL, ce langage est le SQL

                        
                        
                        -- I.1.1.3. SGBDR
                        -- --------------

                            # Le R de SGBDR signifie ”relationnel”. Un SGBDR est un SGBD
                            # qui implémente la théorie relationnelle.
                            # MySQL implémente la théorie relationnelle ; c’est donc un



                        -- I.1.1.4. Le langage SQL
                        -- -----------------------

                            # Le SQL (Structured Query Language) est un langage
                            # informatique qui permet d’interagir avec des bases
                            # de données relationnelles.


                    -- I.1.2. Presentation succinte de MySQL
                    -- -------------------------------------
                        -- I.1.2.1. Un peu d'histoire
                        -- I.1.2.2. Mise en garde

                        # MySQL est donc un Système de Gestion de Bases de Données
                        # Relationnelles, qui utilise le langage SQL.
                        # C’est un des SGBDR les plus utilisés. Sa popularité est 
                        # due en grande partie au fait qu’il s’agit d’un logiciel


                        # Le logo de MySQL est un dauphin, nommé Sakila suite au 
                        # concours Name the dolphin   


                        -- I.1.2.1. Un peu d'histoire
                        -- --------------------------

                        # Le développement de MySQL commence en 1994 par David Axmark
                        # et Michael Widenius


                        -- I.1.2.2. Mise en garde
                        -- ----------------------
                        # resabe tsy dia mankaiza



                    -- I.1.3. Presentation de ses Concurrents
                    -- --------------------------------------
                        -- I.1.3.1. Oracle database
                        -- I.1.3.2. PostgreSQL
                        -- I.1.3.3 MS Access
                        -- I.1.3.4 SQLite

                        -- Tsy dia ilaina firy ny fahalalana an'ireo


                    -- I.1.4. Organisation d'une base de donnees
                    -- -----------------------------------------
                        # (resabe ty mankaiza)

                        -- I.1.4.1. En resume
                        -- ------------------

                            # — MySQL est un Système de Gestion de Bases de Données 
                            #   Relationnelles (SGBDR) basé sur le modèle client-serveur.
                            # — Le langage SQL est utilisé pour communiquer entre le 
                            #   client et le serveur.
                            # — Dans une base de données relationnelle, les données sont 
                            #   représentées sous forme de tables.


                -- I.2. Installation de MySQL
                -- --------------------------
                    -- (Resa be dia tsy ilaiko)

                    -- I.2.5. Encodage, jeux de caracteres et interclassement
                    -- ------------------------------------------------------
                        -- I.2.5.1. La table ASCII
                        -- I.2.5.2. Jeux de caracteres
                        -- I.2.5.3. L'UTF-8


                        -- I.2.5.1. La table ASCII
                        -- -----------------------
                        
                        # Le processeur d’un ordinateur, c’est-à-dire le composant qui s’occupe de traiter les informations,
                        # exécuter les programmes, etc., ne comprend que les instructions formulées en binaire; il ne
                        # peut que lire une suite d’éléments pouvant être dans deux états : 0 ou 1.

                        # Donc, tous les programmes informatiques que vous pourriez écrire, toutes les instructions SQL,
                        # tous les fichiers, sont in fine traduits en code machine, donc une longue suite de 0 et de 1, pour
                        # pouvoir être lus ou exécutés. Chacun de ces 0 ou 1 est un bit. Ces bits sont regroupés par huit
                        # pour former un octet.

                        # L’ordinateur ne connaît donc pas la notion de caractères. Il ne sait pas ce qu’est un ”A”, ou
                        # un ”è”. Il a donc fallu créer une table de conversion pour traduire les caractères de la langue
                        # courante en une série de bits. La table ASCII était née !

                        # La table ASCII est donc une table de conversion, qui permet de traduire en code binaire
                        # 128 caractères, dont 33 caractères de contrôle (séparateur de fichier, saut de page, ...) et
                        # 95 caractères affichables. Les caractères affichables sont les 26 lettres de l’alphabet, en
                        # majuscules et en minuscules, les 10 chiffres arabes et toute une série de caractères
                        # spéciaux courants ( # , ; , ) , < , ...)



                        -- I.2.5.2. Jeux de caracteres
                        -- ---------------------------
                        # On s’est ensuite rendu compte que ces 128 caractères n’étaient pas suffisants. En effet, ils ne
                        # comprennent pas les caractères accentués (”é”, ”à”). Ils ne comprennent pas non plus tous
                        # les caractères cyrilliques, japonais,etc. On a alors commencé à utiliser le huitième bit. Ce qui
                        # permettait de représenter 128 caractères supplémentaires (donc 28 = 256 en tout). Mais avec
                        # 128 caractères supplémentaires, on n’a pas de quoi représenter tous les caractères qui n’existent
                        # pas dans la table ASCII. On a donc créé plusieurs jeux de caractères différents. Exemples :

                            # — l’ISO 8859-1 (ou latin1) : qui permet de couvrir une bonne partie des langues d’Europe
                            #   occidentale en ajoutant les lettres accentuées aux caractères ASCII de base (”å”, ”é”,
                            #   ”ô”, ”ñ”, ...)
                            # — l’ISO 8859-7 : qui permet de représenter les lettres grecques
                            # — l’ISO 8859-11 : qui contient une bonne partie des glyphes de la langue thaï
                            # — l’ISO 8859-15 : qui est une révision de l’ISO 8859-1, et qui remplace quelques caractères
                            #   peu utilisés par d’autres, plus nécessaires, comme l’euro (”€”)





                        -- I.2.5.3. L'UTF-8
                        -- ----------------

                        # Il restait un petit problème : comment faire des documents (ou autres) qui doivent utiliser
                        # plusieurs jeux de caractères différents ? On a donc créé un nouveau type d’encodage, permettant
                        # de représenter les caractères avec deux octets au lieu d’un. 16 bits donnent 216 = 65536
                        # possibilités. On peut donc, en utilisant deux octets, représenter plus de 65000 caractères. Cet
                        # encodage s’appelle l’UTF-8. Le désavantage d’un tel encodage est évidemment le coût en
                        # mémoire, deux octets prenant plus de place qu’un. Cependant, tous les caractères ne sont pas
                        # codés sur deux octets. S’il s’agit d’un caractère de base de la table ASCII, le 8e bit est à 0, ce
                        # qui indique qu’il n’est codé que sur un octet. Par contre, lorsque le 8e bit est à 1, cela indique
                        # qu’on a affaire à un caractère spécial et qu’il est codé sur deux octets. Donc, en UTF-8, un
                        # ”é” prendra plus de place qu’un ”e” (deux octets au lieu d’un).




                -- I.3. Les types de donnees
                -- -------------------------
                    -- I.3.1. Avertissement
                    -- I.3.2. Types numeriques
                    -- I.3.3. Types alphanumeriques
                    -- I.3.4. Types temporels

                
                    -- I.3.1. Avertissement
                    -- --------------------

                    # Il est important de bien comprendre les usages et particularités de chaque type de données, afin
                    # de choisir le meilleur type possible lorsque vous définissez les colonnes de vos tables. En
                    # effet, choisir un mauvais type de données pourrait entraîner :

                    # — un gaspillage de mémoire (ex. : si vous stockez de toutes petites données dans une colonne
                    #   faite pour stocker de grosses quantités de données) ;
                    # — des problèmes de performance (ex. : il est plus rapide de faire une recherche sur un
                    #   nombre que sur une chaîne de caractères) ;
                    # — un comportement contraire à celui attendu (ex. : trier sur un nombre stocké comme
                    #   tel, ou sur un nombre stocké comme une chaîne de caractères ne donnera pas le même
                    #   résultat) ;
                    # — l’impossibilité d’utiliser des fonctionnalités propres à un type de données (ex. : stocker
                    #   une date comme une chaîne de caractères vous prive des nombreuses fonctions temporelles
                    #   disponibles).
                    

                    -- I.3.2. Types numeriques
                    -- -----------------------
                        -- I.3.2.1. Nombres entiers
                        -- I.3.2.2. Nombres decimaux

                        -- I.3.2.1. Nombres entiers
                        -- ------------------------
                            -- I.3.2.1. L'attribut UNSIGNED
                            -- I.3.2.2. Limiter la taille d'affichage et l'attribut ZEROFILL

                            # TINYINT 2^8
                            # SMALLINT 2^16
                            # MEDIUMINT 2^24
                            # INT 2^32
                            # BIGINT 2^64


                            -- I.3.2.1. L'attribut UNSIGNED
                            -- ----------------------------

                                # Vous pouvez également préciser que vos colonnes sont UNSIGNED, c’est-à-dire qu’on ne précise
                                # pas s’il s’agit d’une valeur positive ou négative (on aura donc toujours une valeur positive).
                                # Dans ce cas, la longueur de l’intervalle reste la même, mais les valeurs possibles sont décalées, le
                                # minimum valant 0. Pour les TINYINT, on pourra par exemple aller de 0 à 255.


                            -- I.3.2.2. Limiter la taille d'affichage et l'attribut ZEROFILL
                            -- -------------------------------------------------------------

                                # Il est possible de préciser le nombre de chiffres minimum à l’affichage d’une colonne de type
                                # INT (ou un de ses dérivés). Il suffit alors de préciser ce nombre entre parenthèses : INT(x).
                                # Notez bien que cela ne change pas les capacités de stockage dans la colonne. Si vous déclarez
                                # un INT(2), vous pourrez toujours y stocker 45282 par exemple. Simplement, si vous stockez
                                # un nombre avec un nombre de chiffres inférieur au nombre défini, le caractère par défaut sera
                                # ajouté à gauche du chiffre, pour qu’il prenne la bonne taille. Sans précision, le caractère par
                                # défaut est l’espace.

                                ################################################################################################
                                #                                                                                              #
                                # Soyez prudents cependant. Si vous stockez des nombres dépassant la taille d’affichage        #
                                # définie, il est possible que vous ayez des problèmes lors de l’utilisation de ces nombres,   #
                                # notamment pour des jointures                                                                 #
                                #                                                                                              #
                                ################################################################################################

                                CREATE TABLE OHATRA(
                                    marika INT(4) ZEROFILL NOT NULL
                                )

                                INSERT INTO Ohatra VALUES (4), (50), (157), (3816);

                                SELECT * FROM Ohatra;

                        -- I.3.2.2. Nombres decimaux
                        -- -------------------------
                            -- I.3.2.2.1. NUMERIC et DECIMAL
                            -- I.3.2.2.2. FLOAT, DOUBLE et REAL
                            -- I.3.2.2.3. Valeurs exactes vs. valeurs approchees
                            
                            # DECIMAL
                            # NUMERIC
                            # FLOAT
                            # REAL
                            # DOUBLE (Double precission: Float sy Real mitambatra dia zakany)

                            -- I.3.2.2.1. NUMERIC et DECIMAL
                            -- -----------------------------

                                # NUMERIC et DECIMAL sont équivalents et acceptent deux paramètres : la précision et l’échelle.
                                    # — La précision définit le nombre de chiffres significatifs stockés, donc les 0 à gauche ne
                                    #   comptent pas. En effet 0024 est équivalent à 24. Il n’y a donc que deux chiffres significatifs
                                    #   dans 0024.
                                    # — L’échelle définit le nombre de chiffres après la virgule.

                                # Dans un champ DECIMAL(5,3), on peut donc stocker des nombres de 5 chiffres significatifs
                                # maximum, dont 3 chiffres sont après la virgule. Par exemple : 12.354, -54.258, 89.2 ou -56.
                                # DECIMAL(4) équivaut à écrire DECIMAL(4, 0) 


                            -- I.3.2.2.2. FLOAT, DOUBLE et REAL
                            -- --------------------------------

                                # Le mot-clé FLOAT peut s’utiliser sans paramètre, auquel cas quatre octets sont utilisés pour
                                # stocker les valeurs de la colonne. Il est cependant possible de spécifier une précision et une
                                # échelle, de la même manière que pour DECIMAL et NUMERIC.
                                # 
                                # Quant à REAL et DOUBLE, ils ne supportent pas de paramètres. DOUBLE est normalement plus
                                # précis que REAL (stockage dans 8 octets contre stockage dans 4 octets), mais ce n’est pas le
                                # cas avec MySQL qui utilise 8 octets dans les deux cas. Je vous conseille donc d’utiliser DOUBLE
                                # pour éviter les surprises en cas de changement de SGBDR.



                            -- I.3.2.2.3. Valeurs exactes vs. valeurs approchees
                            -- -------------------------------------------------

                                # Les nombres stockés en tant que NUMERIC ou DECIMAL sont stockés sous forme de chaînes de
                                # caractères. Par conséquent, c’est la valeur exacte qui est stockée. Par contre, les types FLOAT,
                                # DOUBLE et REAL sont stockés sous forme de nombres, et c’est une valeur approchée qui est
                                # stockée.
                                # 
                                # Cela signifie que si vous stockez par exemple 56,6789 dans une colonne de type FLOAT, en réalité,
                                # MySQL stockera une valeur qui se rapproche de 56,6789 (par exemple, 56,678900000000000001).
                                # Cela peut poser problème pour des comparaison notamment (56,678900000000000001 n’étant
                                # pas égal à 56,6789). S’il est nécessaire de conserver la précision exacte de vos données (l’exemple
                                # type est celui des données bancaires), il est donc conseillé d’utiliser un type numérique à valeur
                                # exacte (NUMERIC ou DECIMAL donc)


                    -- I.3.3. Types alphanumeriques
                    -- ----------------------------
                        -- I.3.3.1. Chaine de type texte
                        -- I.3.3.2. Chaine de type Binaire
                        -- I.3.3.3. SET et ENUM


                        -- I.3.3.1. Chaine de type texte
                        -- -----------------------------
                            -- I.3.3.1.1. CHAR et VARCHAR
                            -- I.3.3.1.2. TEXT


                            -- I.3.3.1.1. CHAR et VARCHAR
                            -- --------------------------

                                # Pour stocker un texte relativement court (moins de 255 octets), vous pouvez utiliser les types
                                # CHAR et VARCHAR. Ces deux types s’utilisent avec un paramètre qui précise la taille que peut
                                # prendre votre texte (entre 1 et 255). La différence entre CHAR et VARCHAR est la manière dont
                                # ils sont stockés en mémoire. Un CHAR(x) stockera toujours x octets, en remplissant si nécessaire
                                # le texte avec des espaces vides pour le compléter, tandis qu’un VARCHAR(x) stockera jusqu’à x
                                # octets (entre 0 et x), et stockera en plus en mémoire la taille du texte stocké.                
                    
                    
                            -- I.3.3.1.2. TEXT
                            -- ---------------
                                # TINYTEXT 2^8 octets (longueur maximale), Longueur de la chaîne + 1 octet (memoire occupee)
                                # TEXT 2^16 octets (longueur maximale), Longueur de la chaîne + 2 octets (memoire occupee)
                                # MEDIUMTEXT 2^24 octets (longueur maximale), Longueur de la chaîne + 3 octets (memoire occupee)
                                # LONGTEXT 2^32 octets (longueur maximale), Longueur de la chaîne + 4 octets (memoire occupee)
                    
                    
                        -- I.3.3.2. Chaine de type Binaire
                        -- -------------------------------

                            # Comme les chaînes de type texte que l’on vient de voir, une chaîne binaire n’est rien d’autre
                            # qu’une suite de caractères.
                            
                            # Cependant, si les textes sont affectés par l’encodage et l’interclassement, ce n’est pas le cas des
                            # chaînes binaires. Une chaîne binaire n’est rien d’autre qu’une suite d’octets. Aucune interprétation
                            # n’est faite sur ces octets. Ceci a deux conséquences principales.
                            
                            # — Une chaîne binaire traite directement l’octet, et pas le caractère que l’octet représente.
                            # Donc par exemple, une recherche sur une chaîne binaire sera toujours sensible à la casse,
                            # puisque ”A” (code binaire : 01000001) sera toujours différent de ”a” (code binaire :
                            # 01100001).
                            # — Tous les caractères sont utilisables, y compris les fameux caractères de contrôle non-
                            # affichables définis dans la table ASCII.
                            
                            # Par conséquent, les types binaires sont parfaits pour stocker des données ”brutes” comme des
                            # images par exemple, tandis que les chaînes de texte sont parfaites pour stocker...du texte !
                            
                            # Les types binaires sont définis de la même façon que les types de chaînes de texte. VARBINARY(x)
                            # et BINARY(x) permettent de stocker des chaînes binaires de x caractères maximum (avec une
                            # gestion de la mémoire identique à VARCHAR(x) et CHAR(x)). Pour les chaînes plus longues, il
                            # existe les types TINYBLOB, BLOB, MEDIUMBLOB et LONGBLOB, également avec les mêmes limites
                            # de stockage que les types TEXT.



                        -- I.3.3.3. SET et ENUM
                        -- --------------------
                            -- I.3.3.3.1. ENUM
                            -- I.3.3.3.2. SET
                            -- I.3.3.3.3. Avertissement


                            -- I.3.3.3.1. ENUM
                            -- ---------------
                                # Une colonne de type ENUM est une colonne pour laquelle on définit un certain nombre de valeurs
                                # autorisées, de type ”chaîne de caractère”. Par exemple, si l’on définit une colonne karazana (pour
                                # une espèce animale) de la manière suivante

                                CREATE TABLE BIBY( famantarana TINYINT NOT NULL AUTO_INCREMENT,
                                karazany ENUM('Piso', 'Amboa', 'Sokatra'),
                                PRIMARY KEY(famantarana));
                                
                                INSERT INTO Biby (karazany) VALUES ('Piso'), ('Sokatra'), ('Amboa'), ('Sokatra'), ('Amboa'), ('Piso');

                                SELECT * FROM Biby;

                                # La colonne karazany pourra alors contenir les chaînes ”Piso”, ”Sokatra” ou ”Amboa”, mais pas les
                                # chaînes ”Vorona” ou ”Trondro”.

                                INSERT INTO Biby (karazany) VALUES ('Vorona'), ('Trondro');

                                # En plus de ”Piso”, ”Sokatra” et ”Amboa”, la colonne karazany pourrait prendre deux autres valeurs :
                                # — si vous essayez d’introduire une chaîne non-autorisée, MySQL stockera une chaîne vide
                                # '' dans le champ ;
                                # — si vous autorisez le champ à ne pas contenir de valeur (vous verrez comment faire ça
                                # dans le chapitre sur la création des tables), le champ contiendra NULL, qui correspond à
                                # ”pas de valeur” en SQL (et dans beaucoup de langages informatiques).
                                
                                # Pour remplir un champ de type ENUM, deux possibilités s’offrent à vous :
                                # — soit remplir directement avec la valeur choisie (”Piso”, ”Sokatra” ou ”Amboa” dans notre
                                # exemple) ;

                                # — soit utiliser l’index de la valeur, c’est-à-dire le nombre associé par MySQL à la valeur. Ce
                                # nombre est compris entre 1 et le nombre de valeurs définies. L’index est attribué selon
                                # l’ordre dans lequel les valeurs ont été données lors de la création du champ. De plus, la
                                # chaîne vide (stockée en cas de valeur non-autorisée) correspond à l’index 0. Le tableau
                                # suivant reprend les valeurs d’index pour notre exemple précédent : le champ espece.

                                ALTER TABLE Biby ADD COLUMN toetra TINYTEXT ;
                                DESCRIBE Biby;

                                INSERT INTO Biby (toetra) VALUES ('manidina'), ("monina any anaty rano");

                                SELECT * FROM Biby;

                                INSERT INTO Biby (karazany, toetra) VALUES (2, 'Alika');

                                SELECT * FROM Biby;

                                ######################################################
                                #                                                    #
                                # Un ENUM peut avoir maximum 65535 valeurs possibles #
                                #                                                    #
                                ######################################################

                            
                            -- I.3.3.3.2. SET
                            -- --------------
                                # SET est fort semblable à ENUM. Une colonne SET est en effet une colonne qui permet de stocker
                                # une chaîne de caractères dont les valeurs possibles sont prédéfinies par l’utilisateur. La différence
                                # avec ENUM, c’est qu’on peut stocker dans la colonne entre 0 et x valeur(s), x étant le nombre de
                                # valeurs autorisées.
                                # Donc, si l’on définit une colonne de type SET de la manière suivante :

                                DROP TABLE Taranja;

                                CREATE TABLE Taranja (
                                    laharana TINYINT AUTO_INCREMENT,
                                    anarana SET('Matematika' , 'Fizika' , 'Filosofia' ),
                                    PRIMARY KEY(laharana)
                                );

                                INSERT INTO  Taranja (anarana) Values ('Matematika'), ('Fizika'), ('Filosofia');

                                # Vous remarquerez que lorsqu’on stocke plusieurs valeurs, il faut les séparer par une virgule, sans
                                # espace et entourer la totalité des valeurs par des guillemets (non pas chaque valeur séparément).
                                # Par conséquent, les valeurs autorisées d’une colonne SET ne peuvent pas contenir de virgule
                                # elles-mêmes.

                                INSERT INTO  Taranja (anarana) Values ('Matematika'), ('Matematika'), ('Matematika');

                                SELECT * FROM Taranja;


                                # On ne peut pas stocker la même valeur plusieurs fois dans un SET. ”chien,chien” par
                                # exemple, n’est donc pas valable.
                                
                                CREATE TABLE Taranja2 (
                                    laharana TINYINT AUTO_INCREMENT,
                                    anarana SET('Matematika' , 'Matematika' , 'Filosofia' ),
                                    PRIMARY KEY(laharana)
                                );

                                # Les colonnes SET utilisent également un système d’index, quoiqu’un peu plus complexe que pour
                                # le type ENUM. SET utilise en effet un système d’index binaire. Concrètement, la présence/absence
                                # des valeurs autorisées va être enregistrée sous forme de bits, mis à 1 si la valeur correspondante
                                # est présente, à 0 si la valeur correspondante est absente. Si l’on reprend notre exemple, on a
                                # donc :
                                # anarana SET('Matematika' , 'Fizika' , 'Filosofia' ),

                                # Trois valeurs sont autorisées. Il nous faut donc trois bits pour savoir quelles valeurs sont stockées
                                # dans le champ. Le premier, à droite, correspondra à ”Matematika”, le second (au milieu) à ”Fizika” et le
                                # dernier (à gauche) à ”Filosofia”.

                                # — 000 signifie qu’aucune valeur n’est présente.
                                # — 001 signifie que ’Matematika’ est présent.
                                # — 100 signifie que ’Fizika’ est présent.
                                # — 110 signifie que ’Filosofia’ et ’Fizika’ sont présents.
                                # — ...


                                # Puisque j’aime bien les tableaux, je vous en fais un, ce sera peut-être plus clair

                                #################################################
                                # Valeurs       # Binaire       # Decimal       #
                                #################################################
                                # 'Matematika'  # 001           # 1             #
                                # 'Fizika'      # 010           # 2             #
                                # 'Filosofia'   # 100           # 4             #
                                #################################################


                                # Pour stocker ’chat’ et ’tortue’ dans un champ, on peut donc utiliser ’chat,tortue’ ou 101 (addition
                                # des nombres binaires correspondants) ou 5 (addition des nombres décimaux correspondants).
                                
                                # Notez que cette utilisation des binaires a pour conséquence que l’ordre dans lequel vous rentrez
                                # vos valeurs n’a pas d’importance. Que vous écriviez ’chat,tortue’ ou ’tortue,chat’ ne fait aucune
                                # différence. Lorsque vous récupérerez votre champ, vous aurez ’chat,tortue’ (dans le même ordre
                                # que lors de la définition du champ).


                                ################################################################
                                #                                                              #
                                # Un champ de type SET peut avoir au plus 64 valeurs définies  #
                                #                                                              #
                                ################################################################



                            -- I.3.3.3.3. Avertissement
                            -- ------------------------
                                # SET et ENUM sont des types propres à MySQL. Ils sont donc à utiliser avec une grande
                                # prudence !


                                # Pourquoi avoir inventé ces types propres à MySQL ?

                                # La plupart des SGBD implémentent ce qu’on appelle des contraintes d’assertions, qui permettent
                                # de définir les valeurs que peuvent prendre une colonne (par exemple, on pourrait définir une
                                # contrainte pour une colonne contenant un âge, devant être compris entre 0 et 130).
                                
                                # MySQL n’implémente pas ce type de contrainte et a par conséquent créé deux types de données
                                # spécifiques (SET et ENUM), pour pallier en partie ce manque.



                                # Dans quelles situations faut-il utiliser ENUM ou SET?
                                
                                # La meilleure réponse à cette question est : jamais ! Je déconseille fortement l’utilisation des SET
                                # et des ENUM. Je vous ai présenté ces deux types par souci d’exhaustivité, mais il faut toujours
                                # éviter autant que possible les fonctionnalités propres à un seul SGBD. Ceci afin d’éviter les
                                # problèmes si un jour vous voulez en utiliser un autre.
                                
                                # Mais ce n’est pas la seule raison. Imaginez que vous vouliez utiliser un ENUM ou un SET pour un
                                # système de catégories. Vous avez donc des éléments qui peuvent appartenir à une catégorie (dans
                                # ce cas, vous utilisez une colonne ENUM pour la catégorie) ou appartenir à plusieurs catégories (et
                                # vous utilisez SET).


                    -- I.3.4. Types temporels
                    -- ----------------------
                        -- I.3.4.1. DATE, TIME et DATETIME
                        -- I.3.4.2. YEAR
                        -- I.3.4.3. TIMESTAMP
                        -- I.3.4.4. La date par defaut
                        -- I.3.4.5. En resume


                        # Pour les données temporelles, MySQL dispose de cinq types qui permettent, lorsqu’ils sont bien
                        # utilisés, de faire énormément de choses.
                        
                        # Avant d’entrer dans le vif du sujet, une petite remarque importante : lorsque vous stockez une
                        # date dans MySQL, certaines vérifications sont faites sur la validité de la date entrée. Cependant,
                        # ce sont des vérifications de base : le jour doit être compris entre 1 et 31 et le mois entre 1 et 12.
                        # Il vous est tout à fait possible d’entrer une date telle que le 31 février 2011. Soyez donc prudents
                        # avec les dates que vous entrez et récupérez.
                        
                        # Les cinq types temporels de MySQL sont DATE, DATETIME, TIME, TIMESTAMP et YEAR            


                        -- I.3.4.1. DATE, TIME et DATETIME
                        -- -------------------------------
                            -- I.3.4.1.1 DATE
                            -- I.3.4.1.2. DATETIME
                            -- I.3.4.1.3.TIME


                            -- I.3.4.1.1 DATE
                            -- --------------
                            # Pour entrer une date, l’ordre des données est la seule contrainte. Il faut donner d’abord l’année
                            # (deux ou quatre chiffres), ensuite le mois (deux chiffres) et pour finir, le jour (deux chiffres), sous
                            # forme de nombre ou de chaîne de caractères. S’il s’agit d’une chaîne de caractères, n’importe
                            # quelle ponctuation peut être utilisée pour délimiter les parties (ou aucune). Voici quelques
                            # exemples d’expressions correctes (A représente les années, M les mois et J les jours) :
                            
                            # — 'AAAA-MM-JJ' (c’est sous ce format-ci qu’une DATE est stockée dans MySQL)
                            # — 'AAMMJJ'
                            # — 'AAAA/MM/JJ'
                            # — 'AA+MM+JJ'
                            # — 'AAAA%MM%JJ'
                            # — AAAAMMJJ (nombre)
                            # — AAMMJJ (nombre)
                            
                            # L’année peut donc être donnée avec deux ou quatre chiffres. Dans ce cas, le siècle n’est pas
                            # précisé, et c’est MySQL qui va décider de ce qu’il utilisera, selon ces critères :
                            
                            # — si l’année donnée est entre 00 et 69, on utilisera le 21e siècle, on ira donc de 2000 à 2069 ;
                            # — par contre, si l’année est comprise entre 70 et 99, on utilisera le 20e siècle, donc entre
                            # 1970 et 1999.


            ################################################################
            #                                                              #
            # MySQL supporte des DATE allant de ’1001-01-01’ à ’9999-12-31 #
            #                                                              #
            ################################################################



                            -- I.3.4.1.2. DATETIME
                            -- -------------------

                            # Très proche de DATE, ce type permet de stocker une heure, en plus d’une date. Pour entrer
                            # un DATETIME, c’est le même principe que pour DATE : pour la date, année-mois-jour, et pour
                            # l’heure, il faut donner d’abord l’heure, ensuite les minutes, puis les secondes. Si on utilise une
                            # chaîne de caractères, il faut séparer la date et l’heure par une espace. Quelques exemples corrects
                            # (H représente les heures, M les minutes et S les secondes) :
                            
                            # — 'AAAA-MM-JJ HH:MM:SS' (c’est sous ce format-ci qu’un DATETIME est stocké dans
                            #    MySQL)
                            # — 'AA*MM*JJ HH+MM+SS'
                            # — AAAAMMJJHHMMSS (nombre)
                            

            #########################################################################################
            #                                                                                       #
            #   MySQL supporte des DATETIME allant de ’1001-01-01 00:00:00’ à ’9999-12-31 23:59:59’ #
            #                                                                                       #
            #########################################################################################



                            -- I.3.4.1.3.TIME
                            -- --------------

                            # Le type TIME est un peu plus compliqué, puisqu’il permet non seulement de stocker une heure
                            # précise, mais aussi un intervalle de temps. On n’est donc pas limité à 24 heures, et il est même
                            # possible de stocker un nombre de jours ou un intervalle négatif. Comme dans DATETIME, il faut
                            # d’abord donner l’heure, puis les minutes, puis les secondes, chaque partie pouvant être séparée
                            # des autres par le caractère : . Dans le cas où l’on précise également un nombre de jours, alors
                            # les jours sont en premier et séparés du reste par une espace. Exemples :
                            
                            # — 'HH:MM:SS'
                            # — 'HHH:MM:SS'
                            # — 'MM:SS'
                            # — 'J HH:MM:SS'
                            # — 'HHMMSS'
                            # — HHMMSS (nombre)

            #################################################################
            #                                                               #
            # MySQL supporte des TIME allant de ’-838:59:59’ à ’838:59:59’  #
            #                                                               #
            #################################################################



                        -- I.3.4.2. YEAR
                        -- -------------
                            # Si vous n’avez besoin de retenir que l’année, YEAR est un type intéressant car il ne prend qu’un
                            # seul octet en mémoire. Cependant, un octet ne pouvant contenir que 256 valeurs différentes,
                            # YEAR est fortement limité : on ne peut y stocker que des années entre 1901 et 2155. Ceci dit, ça
                            # devrait suffire à la majorité d’entre vous pour au moins les cent prochaines années.


                            # On peut entrer une donnée de type YEAR sous forme de chaîne de caractères ou d’entiers, avec 2
                            # ou 4 chiffres. Si l’on ne précise que deux chiffres, le siècle est ajouté par MySQL selon les mêmes
                            # critères que pour DATE et DATETIME, à une exception près : si l’on entre 00 (un entier donc),
                            # il sera interprété comme la valeur par défaut de YEAR 0000. Par contre, si l’on entre '00' (une
                            # chaîne de caractères), elle sera bien interprétée comme l’année 2000. Plus de précisions sur les
                            # valeurs par défaut des types temporels dans quelques instants




                        -- I.3.4.3. TIMESTAMP
                        -- ------------------
                            -- CURRENTTIMESTAMP

                            # Par définition, le timestamp d’une date est le nombre de secondes écoulées depuis le 1er janvier
                            # 1970, 0h0min0s (TUC) et la date en question. Les timestamps étant stockés sur 4 octets, il
                            # existe une limite supérieure : le 19 janvier 2038 à 3h14min7s. Par conséquent, vérifiez bien que
                            # vous êtes dans l’intervalle de validité avant d’utiliser un timestamp.
                            
                            # Le type TIMESTAMP de MySQL est cependant un peu particulier. Prenons par exemple le 4
                            # octobre 2011, à 21h05min51s. Entre cette date et le 1er janvier 1970, 0h0min0s, il s’est écoulé
                            # exactement 1317755151 secondes. Le nombre 1317755151 est donc, par définition, le timestamp
                            # de cette date du 4 octobre 2011, 21h05min51s. Pourtant, pour stocker cette date dans un
                            # TIMESTAMP SQL, ce n’est pas 1317755151 qu’on utilisera, mais 20111004210551. C’est-à-dire
                            # l’équivalent, au format numérique, du DATETIME '2011-10-04 21:05:51'. Le TIMESTAMP
                            # SQL n’a donc de timestamp que le nom. Il ne sert pas à stocker un nombre de secondes, mais
                            # bien une date sous format numérique AAAAMMJJHHMMSS (alors qu’un DATETIME est donc
                            # stocké sous forme de chaîne de caractères).
                            
                            # Il n’est donc pas possible de stocker un ”vrai” timestamp dans une colonne de type TIMESTAMP.
                            # C’est évidemment contre-intuitif, et source d’erreur. Notez que malgré cela, le TIMESTAMP SQL
                            # a les même limites qu’un vrai timestamp : il n’acceptera que des date entre le 1e janvier 1970 à
                            # 00h00min00s et le 19 janvier 2038 à 3h14min7s


                            -- CURRENTTIMESTAMP
                            -- ----------------
                            # Heure acctuelle



                        -- I.3.4.4. La date par defaut
                        -- ---------------------------

                            # Lorsque MySQL rencontre une date/heure incorrecte, ou qui n’est pas dans l’intervalle de
                            # validité du champ, la valeur par défaut est stockée à la place. Il s’agit de la valeur ”zéro” du
                            
                            
                            
                            # type. On peut se référer à cette valeur par défaut en utilisant '0' (caractère), 0 (nombre) ou la
                            
                            
                            
                            # représentation du ”zéro” correspondant au type de la colonne (voir tableau ci-dessous).


            ###########################################################
            # Type                  # Date par defaut ("zero")        #
            ###########################################################
            # DATE                  # '0000-00-00'                    #
            # DATETIME              # '0000-00-00 00:00:00'           #
            # TIME                  # '00:00:00'                      #
            # YEAR                  # '0000'                          #
            # TIMESTAMP             # '000000000000000' (15 NO ISANY) #
            ###########################################################



                        -- I.3.4.5. En resume
                        -- ------------------

                            # MySQL définit plusieurs types de données : des numériques entiers, des numériques
                            # décimaux, des textes alphanumériques, des chaînes binaires alphanumériques et des
                            # données temporelles.
                            # — Il est important de toujours utiliser le type de données adapté à la situation.
                            # — SET et ENUM sont des types de données qui n’existent que chez MySQL. Il vaut donc
                            # mieux éviter de les utiliser.
                            


                -- I.4. Creation d'une base de donnees
                -- -----------------------------------
                    -- I.4.1. Avant-propos: conseils et conventions
                    -- I.4.2. Creation et suppression d'une base de donnees

                    #Ça y est, le temps est venu d’écrire vos premières lignes de commande. Dans ce chapitre plutôt
                    #court, je vous donnerai pour commencer quelques conseils indispensables. Ensuite, je vous
                    #présenterai la problématique sur laquelle nous allons travailler tout au long de ce tutoriel : la
                    #base de données d’un élevage d’animaux. Pour finir, nous verrons comment créer et supprimer
                    #une base de données.
                    
                    #La partie purement théorique est donc bientôt finie. Gardez la tête et les mains à l’intérieur du
                    #véhicule. C’est parti !



                    -- I.4.1. Avant-propos: conseils et conventions
                    -- --------------------------------------------
                        -- I.4.1.1. Conseils
                        -- I.4.1.2. Conventions
                        -- I.4.1.3. Mise en situation


                        -- I.4.1.1. Conseils
                        -- -----------------
                            -- I.4.1.1.1. Noms de tables et de colonnes
                            -- I.4.1.1.2. Soyez coherents
                            

                            -- I.4.1.1.1. Noms de tables et de colonnes
                            -- ----------------------------------------
                            
                            # N’utilisez jamais, au grand jamais, d’espaces ou d’accents dans vos noms de bases, tables ou
                            # colonnes. Au lieu d’avoir une colonne ”date de naissance”, préférez ”date_de_naissance” ou
                            # ”date_naissance”. Et au lieu d’avoir une colonne ”prénom”, utilisez ”prenom”. Avouez que ça
                            # reste lisible, et ça vous évitera pas mal d’ennuis.
                            
                            # Évitez également d’utiliser des mots réservés comme nom de colonnes/tables/bases. Par ”mot
                            # réservé”, j’entends un mot-clé SQL, donc un mot qui sert à définir quelque chose dans le langage
                            # SQL. Vous trouverez une liste exhaustive des mots réservés dans la documentation officielle .
                            # Parmi les plus fréquents : date, text, type. Ajoutez donc une précision à vos noms dans ces
                            # cas-là (date_naissance, text_article ou type_personnage par exemple).
                            
                            # Notez que MySQL permet l’utilisation de mots-clés comme noms de tables ou de colonnes, à
                            # condition que ce nom soit entouré de ‘ (accent grave/backquote). Cependant, ceci est propre à
                            # MySQL et ne devrait pas être utilisé



                            -- I.4.1.1.2. Soyez coherents
                            -- --------------------------
                            
                            # Vous vous y retrouverez bien mieux si vous restez cohérents dans votre base. Par exemple, mettez
                            # tous vos noms de tables au singulier, ou au contraire au pluriel. Choisissez, mais tenez-vous-y.
                            # Même chose pour les noms de colonnes. Et lorsqu’un nom de table ou de colonne nécessite
                            # plusieurs mots, séparez les toujours avec ’_’ (ex : date_naissance) ou bien toujours avec une
                            # majuscule (ex : dateNaissance)


                            # Ce ne sont que quelques exemples de situations dans lesquelles vous devez décider d’une marche
                            # à suivre, et la garder tout au long de votre projet (voire pour tous vos projets futurs). Vous
                            # gagnerez énormément de temps en prenant de telles habitudes.



                        -- I.4.1.2. Conventions
                        -- --------------------
                            -- I.4.1.2.1. Mots-cles
                            -- I.4.1.2.2. Nom de bases, de tables et de colonnes
                            -- I.4.1.2.3. Options Facultatives


                            -- I.4.1.2.1. Mots-cles
                            -- --------------------

                                # Une convention largement répandue veut que les commandes et mots-clés SQL soient écrits
                                # complètement en majuscules. Je respecterai cette convention et vous encourage à le faire
                                # également. Il est plus facile de relire une commande de 5 lignes lorsqu’on peut différencier au
                                # premier coup d’œil les commandes SQL des noms de tables et de colonnes.


                            -- I.4.1.2.2. Nom de bases, de tables et de colonnes
                            -- -------------------------------------------------
                                
                                # Je viens de vous dire que les mots-clés SQL seront écrits en majuscule pour les différencier
                                # du reste, donc évidemment, les noms de bases, tables et colonnes seront écrits en minuscule.
                                # Toutefois, par habitude et parce que je trouve cela plus clair, je mettrai une majuscule à la
                                # première lettre de mes noms de tables (et uniquement pour les tables : ni pour la base de
                                # données ni pour les colonnes). Notez que MySQL n’est pas nécessairement sensible à la casse
                                # en ce qui concerne les noms de tables et de colonnes. En fait, il est très probable que si vous
                                # travaillez sous Windows, MySQL ne soit pas sensible à la casse pour les noms de tables et de
                                # colonnes. Sous Mac et Linux par contre, c’est le contraire qui est le plus probable. Quoi qu’il en
                                # soit, j’utiliserai des majuscules pour la première lettre de mes noms de tables. Libre à vous de
                                # me suivre ou non.


                            -- I.4.1.2.3. Options Facultatives
                            -- -------------------------------

                                # Lorsque je commencerai à vous montrer les commandes SQL à utiliser pour interagir avec votre
                                # base de données, vous verrez que certaines commandes ont des options facultatives. Dans ces
                                # cas-là, j’utiliserai des crochets [ ] pour indiquer ce qui est facultatif. La même convention est
                                # utilisée dans la documentation officielle MySQL (et dans beaucoup d’autres documentations
                                # d’ailleurs). La requête suivante signifie donc que vous pouvez commander votre glace vanille
                                # toute seule, ou avec du chocolat, ou avec de la chantilly, ou avec du chocolat ET de la chantilly.

                        
                        -- I.4.1.3. Mise en situation
                        -- --------------------------

                        # Histoire que nous soyons sur la même longueur d’onde, je vous propose de baser le cours sur
                        # une problématique bien précise. Nous allons créer une base de données qui permettra de gérer
                        # un élevage d’animaux. Pourquoi un élevage ? Tout simplement parce que j’ai dû moi-même créer
                        # une telle base pour le laboratoire de biologie pour lequel je travaillais. Par conséquent, j’ai une
                        # assez bonne idée des problèmes qu’on peut rencontrer avec ce type de bases, et je pourrai donc
                        # appuyer mes explications sur des problèmes réalistes, plutôt que d’essayer d’en inventer.
                        
                        # Nous nous occupons donc d’un élevage d’animaux. On travaille avec plusieurs espèces : chats,
                        # chiens, tortues entre autres (tiens, ça me rappelle quelque chose ). Dans la suite de cette
                        # partie, nous nous contenterons de créer une table Animal qui contiendra les caractéristiques
                        # principales des animaux présents dans l’élevage, mais dès le début de la deuxième partie, d’autres
                        # tables seront créées afin de pouvoir gérer un grand nombre de données complexes



                    -- I.4.2. Creation et suppression d'une base de donnees
                    -- ----------------------------------------------------
                        -- I.4.2.1. Creation
                        -- I.4.2.2. Suppression
                        -- I.4.2.3. Utilisation d'une base de donnees
                        -- I.4.2.4. En resume


                        -- I.4.2.1. Creation
                        -- -----------------

                        # Syntax
                        # CREATE DATABASE nom_base;

                        # CREATE DATABASE nom_base CHARACTER SET 'utf8'


                        -- I.4.2.2. Suppression
                        -- --------------------

                            # DROP DATABASE nom_base;

                            # DROP DATABASE IF EXISTS nom_base ;

                            # Pour afficher les warnings de MySQL, il faut utiliser la commande
                            # SHOW WARNINGS;


                        -- I.4.2.3. Utilisation d'une base de donnees
                        -- ------------------------------------------
                            # commande: USE, CONNECT
                            CONNECTION elevage; #any commande dos io mandeha

                            USE fiompina;

                        -- I.4.2.4. En resume
                        -- ------------------

                            # Pour créer une base de données, on utilise la commande CREATE DATABASE nom_base.
                            # — Pour supprimer une base de données : DROP DATABASE nom_base.
                            # — À chaque connexion à MySQL, il faut préciser avec quelle base on va travailler, avec USE
                            # nom_base


                -- I.5. Creation de tables
                -- -----------------------
                    -- I.5.1. Definition des colonnes
                    -- I.5.2. Introduction aux cles primaires
                    -- I.5.3. Les moteurs de tables
                    -- I.5.4. Syntaxe de CREATE TABLE
                    -- I.5.5. Suppression d'une table


                    -- I.5.1. Definition des colonnes
                    -- ------------------------------
                        -- I.5.1.1. Type de colonne
                        -- I.5.1.2. NULL or NOT NULL?
                        -- I.5.1.3. Recaputilatif


                        -- I.5.1.1. Type de colonne
                        -- ------------------------

                            # Avant de choisir le type des colonnes, il faut choisir les colonnes que l’on va définir. On va donc
                            # créer une table Animal. Qu’est-ce qui caractérise un animal ? Son espèce, son sexe, sa date de
                            # naissance. Quoi d’autre ? Une éventuelle colonne commentaires qui peut servir de fourre-tout.
                            # Dans le cas d’un élevage sentimental, on peut avoir donné un nom à nos bestioles. Disons que
                            # c’est tout pour le moment. Examinons donc les colonnes afin d’en choisir le type au mieux.
                            
                            # — Espèce : on a des chats, des chiens et des tortues pour l’instant. On peut donc caractériser
                            #           l’espèce par un ou plusieurs mots. Ce sera donc un champ de type alphanumérique. Les
                            #           noms d’espèces sont relativement courts, mais n’ont pas tous la même longueur. On
                            #           choisira donc un VARCHAR. Mais quelle longueur lui donner ? Beaucoup de noms d’espèces
                            #           ne contiennent qu’un mot, mais ”harfang des neiges”, par exemple, en contient trois, et
                            #           18 caractères. Histoire de ne prendre aucun risque, autant autoriser jusqu’à 40 caractères
                            #           pour l’espèce.
                            
                            # — Sexe : ici, deux choix possibles (mâle ou femelle). Le risque de voir un troisième sexe
                            #           apparaître est extrêmement faible. Par conséquent, il serait possible d’utiliser un ENUM.
                            #           Cependant, ENUM reste un type non standard. Pour cette raison, nous utiliserons plutôt
                            #           une colonne CHAR(1), contenant soit 'M' (mâle), soit 'F' (femelle).
                            
                            # — Date de naissance : pas besoin de réfléchir beaucoup ici. Il s’agit d’une date, donc soit
                            #                       un DATETIME, soit une DATE. L’heure de la naissance est-elle importante ? Disons que
                            #                       oui, du moins pour les soins lors des premiers jours. DATETIME donc !
                            
                            # — Commentaires : de nouveau un type alphanumérique évidemment, mais on a ici aucune
                            #                   idée de la longueur. Ce sera sans doute succinct mais il faut prévoir un minimum de
                            #                   place quand même. Ce sera donc un champ TEXT.
                            
                            # — Nom : plutôt facile à déterminer. On prendra simplement un VARCHAR(30). On ne
                            #         pourra pas appeler nos tortues ”Petite maison dans la prairie verdoyante”, mais c’est
                            #         amplement suffisant pour ”Rox” ou ”Roucky”            


                        -- I.5.1.2. NULL or NOT NULL?
                        -- --------------------------

                            # Il faut maintenant déterminer si l’on autorise les colonnes à ne pas stocker de valeur (ce qui est
                            # donc représenté par NULL).

                            # — Espèce : un éleveur digne de ce nom connaît l’espèce des animaux qu’il élève. On
                            #            n’autorisera donc pas la colonne espece à être NULL.
                            
                            # — Sexe : le sexe de certains animaux est très difficile à déterminer à la naissance. Il n’est
                            #          donc pas impossible qu’on doive attendre plusieurs semaines pour savoir si ”Rox” est en
                            # réalité ”Roxa”. Par conséquent, la colonne sexe peut contenir NULL.
                            
                            # — Date de naissance : pour garantir la pureté des races, on ne travaille qu’avec des
                            #                       individus dont on connaît la provenance (en cas d’apport extérieur), les parents, la date
                            #                       de naissance. Cette colonne ne peut donc pas être NULL.
                            
                            # — Commentaires : ce champ peut très bien ne rien contenir, si la bestiole concernée ne
                            #                  présente absolument aucune particularité.
                            
                            # — Nom : en cas de panne d’inspiration (ça a l’air facile comme ça mais, une chatte pouvant
                            #         avoir entre 1 et 8 petits d’un coup, il est parfois difficile d’inventer 8 noms originaux
                            #         comme ça !), il vaut mieux autoriser cette colonne à être NULL.



                        -- I.5.1.3. Recaputilatif
                        -- ----------------------
                            # Comme d habitude, un petit tableau pour recapituler tout ca:

                            ########################################################################
                            # caracteristique   # Nom de la colonne  # Type           #  Null ?    #
                            ########################################################################
                            # Espece            # epece              #  VARCHAR(40)   #  Non       #
                            # Sexe              # sexe               #  CHAR(1)       #  Oui       #
                            # Date de naissance # date_naissance     #  DATETIME      #  Non       #
                            # Commentaitres     # commentaires       #  TEXT          #  Oui       #
                            # Nom               # nom                #  VARCHAR(30)   #  Oui       #
                            ########################################################################




                    -- I.5.2. Introduction aux cles primaires
                    -- --------------------------------------
                        -- I.5.2.1. Identite
                        -- I.5.2.2. Cle primaire
                        -- I.5.2.3. Auto-incrementations


                        # On va donc définir cinq colonnes : espece, sexe, date_naissance, commentaires et nom. Ces
                        # colonnes permettront de caractériser nos animaux. Mais que se passe-t-il si deux animaux sont de
                        # la même espèce, du même sexe, sont nés exactement le même jour, et ont exactement les mêmes
                        # commentaires et le même nom ? Comment les différencier ? Évidemment, on pourrait s’arranger
                        # pour que deux animaux n’aient jamais le même nom. Mais imaginez la situation suivante : une
                        # chatte vient de donner naissance à sept petits. On ne peut pas encore définir leur sexe, on n’a
                        # pas encore trouvé de nom pour certains d’entre eux et il n’y a encore aucun commentaire à faire
                        # à leur propos. Ils auront donc exactement les mêmes caractéristiques. Pourtant, ce ne sont pas
                        # les mêmes individus. Il faut donc les différencier. Pour cela, on va ajouter une colonne à notre
                        # table.


                        -- I.5.2.1. Identite
                        -- -----------------

                            # Imaginez que quelqu’un ait le même nom de famille que vous, le même prénom, soit né dans
                            # la même ville et ait la même taille. En dehors de la photo et de la signature, quelle sera la
                            # différence entre vos deux cartes d’identité ? Son numéro !
                            
                            # Suivant le même principe, on va donner à chaque animal un numéro d’identité. La colonne
                            # qu’on ajoutera s’appellera donc id, et il s’agira d’un INT, toujours positif donc UNSIGNED. Selon
                            # la taille de l’élevage (la taille actuelle mais aussi la taille qu’on imagine qu’il pourrait avoir dans
                            # le futur !), il peut être plus intéressant d’utiliser un SMALLINT, voire un MEDIUMINT. Comme il
                            # est peu probable que l’on dépasse les 65000 animaux, on utilisera SMALLINT. Attention, il faut
                            # bien considérer tous les animaux qui entreront un jour dans la base, pas uniquement le nombre
                            # d’animaux présents en même temps dans l’élevage. En effet, si l’on supprime pour une raison ou
                            # une autre un animal de la base, il n’est pas question de réutiliser son numéro d’identité.
                            
                            # Ce champ ne pourra bien sûr pas être NULL, sinon il perdrait toute son utilité.               


                        -- I.5.2.2. Cle primaire
                        -- ---------------------

                            # La clé primaire d’une table est une contrainte d’unicité, composée d’une ou plusieurs colonnes.
                            # La clé primaire d’une ligne permet d’identifier de manière unique cette ligne dans la
                            # table. Si l’on parle de la ligne dont la clé primaire vaut x, il ne doit y avoir aucun doute quant à
                            # la ligne dont on parle. Lorsqu’une table possède une clé primaire (et il est extrêmement conseillé
                            # de définir une clé primaire pour chaque table créée), celle-ci doit être définie.
                            
                            # Cette définition correspond exactement au numéro d’identité dont nous venons de parler. Nous
                            # définirons donc id comme la clé primaire de la table Animal, en utilisant les mots-clés PRIMARY
                            # KEY(id).
                            
                            # Lorsque vous insérerez une nouvelle ligne dans la table, MySQL vérifiera que vous insérez bien un
                            # id, et que cet id n’existe pas encore dans la table. Si vous ne respectez pas ces deux contraintes,
                            # MySQL n’insérera pas la ligne et vous renverra une erreur.
                            # Par exemple, dans le cas où vous essayez d’insérer un id qui existe déjà, vous obtiendrez l’erreur
                            # suivante :

                            # ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

                            # Je n’en dirai pas plus pour l’instant sur les clés primaires mais j’y reviendrai de manière détaillée
                            # dans la seconde partie de ce cours.



                        -- I.5.2.3. Auto-incrementations
                        -- -----------------------------

                            # Il faut donc, pour chaque animal, décider d’une valeur pour id. Le plus simple, et le plus logique,
                            # est de donner le numéro 1 au premier individu enregistré, puis le numéro 2 au second, etc.
                            
                            # Mais si vous ne vous souvenez pas quel numéro vous avez utilisé en dernier, pour insérer un
                            # nouvel animal il faudra récupérer cette information dans la base, ensuite seulement vous pourrez
                            # ajouter une ligne en lui donnant comme id le dernierid utilisé + 1. C’est bien sûr faisable, mais
                            # c’est fastidieux... Heureusement, il est possible de demander à MySQL de faire tout ça pour
                            # nous !

                            # Comment ? En utilisant l’auto-incrémentation des colonnes. Incrémenter veut dire ”ajouter
                            # une valeur fixée”. Donc, si l’on déclare qu’une colonne doit s’auto-incrémenter (grâce au mot-
                            # clé AUTO_INCREMENT), plus besoin de chercher quelle valeur on va mettre dedans lors de la
                            # prochaine insertion. MySQL va chercher ça tout seul comme un grand en prenant la dernière
                            # valeur insérée et en l’incrémentant de 1.




                    -- I.5.3. Les moteurs de tables
                    -- ----------------------------
                        -- I.5.3.0.1. MyISAM
                        -- I.5.3.0.2. InnoDB
                        -- I.5.3.1. Preciser un moteurs lors de la creation de la table


                            # Les moteurs de tables sont une spécificité de MySQL. Ce sont des moteurs de stockage. Cela
                            # permet de gérer différemment les tables selon l’utilité qu’on en a. Je ne vais pas vous détailler
                            # tous les moteurs de tables existant. Si vous voulez plus d’informations, je vous renvoie à la
                            # documentation officielle (http://dev.mysql.com/doc/refman/5.5/en/storage-engines.html) . Les deux moteurs les plus connus sont MyISAM et InnoDB.


                        -- I.5.3.0.1. MyISAM
                        -- -----------------

                            # C’est le moteur par défaut. Les commandes d’insertion et sélection de données sont particulière-
                            # ment rapides sur les tables utilisant ce moteur. Cependant, il ne gère pas certaines fonctionnalités
                            # importantes comme les clés étrangères, qui permettent de vérifier l’intégrité d’une référence d’une
                            # table à une autre table (voir la deuxième partie du cours) ou les transactions, qui permettent de
                            # réaliser des séries de modifications ”en bloc” ou au contraire d’annuler ces modifications (voir la
                            # cinquième partie du cours).


                        -- I.5.3.0.2. InnoDB
                        -- -----------------

                            # Plus lent et plus gourmand en ressources que MyISAM, ce moteur gère les clés étrangères et les
                            # transactions. Étant donné que nous nous servirons des clés étrangères dès la deuxième partie,
                            # c’est celui-là que nous allons utiliser. De plus, en cas de crash du serveur, il possède un système
                            # de récupération automatique des données.



                        -- I.5.3.1. Preciser un moteurs lors de la creation de la table
                        -- ------------------------------------------------------------
                            
                            # Pour qu’une table utilise le moteur de notre choix, il suffit d’ajouter ceci à la fin de la commande
                            # de création :

                            # ENGINE = moteur;

                            # En remplaçant bien sûr ”moteur” par le nom du moteur que nous voulons utiliser, ici InnoDB:

                            # ENGINE = INNODB;

                        
                    -- I.5.4. Syntaxe de CREATE TABLE
                    -- ------------------------------
                        -- I.5.4.1. Syntaxe 
                        -- I.5.4.2. Application: creation de Animal
                        -- I.5.4.3. Verifications


                            # Avant de voir la syntaxe permettant de créer une table, résumons un peu. Nous voulons donc
                            # créer une table Animal avec six colonnes telles que décrites dans le tableau suivant:

                            ########################################################################
                            # caracteristique   # Nom du champ       # Type           #  Null ?    #
                            ########################################################################
                            # Numero d identite #  id                #  SMALLINT      #  Non       #
                            # Espece            # epece              #  VARCHAR(40)   #  Non       #
                            # Sexe              # sexe               #  CHAR(1)       #  Oui       #
                            # Date de naissance # date_naissance     #  DATETIME      #  Non       #
                            # Commentaitres     # commentaires       #  TEXT          #  Oui       #
                            # Nom               # nom                #  VARCHAR(30)   #  Oui       #
                            ########################################################################


                        -- I.5.4.1. Syntaxe
                        -- ----------------
                            -- I.5.4.1.1. Creation de la table
                            -- I.5.4.1.2. Definition des colonnes

                                # Par souci de clarté, je vais diviser l’explication de la syntaxe de CREATE TABLE en deux. La
                                # première partie vous donne la syntaxe globale de la commande, et la deuxième partie s’attarde
                                # sur la description des colonnes créées dans la table


                            -- I.5.4.1.1. Creation de la table
                            -- -------------------------------

                                # CREATE TABLE [IF NOT EXISTS] Nom_table (
                                #     colonne1 description_colonne1,
                                #     [colonne2 description_colonne2, 
                                #     colonne3 description_colonne3, ...,]
                                #     [PRIMARY KEY (colonne_clé_primaire)] )
                                #     [ENGINE=moteur];

                                # Le IF NOT EXISTS est facultatif (d’où l’utilisation de crochets [ ]), et a le même rôle que dans
                                # la commande CREATE DATABASE : si une table de ce nom existe déjà dans la base de données,
                                # la requête renverra un warning plutôt qu’une erreur si IF NOT EXISTS est spécifié. Ce n’est pas
                                # non plus une erreur de ne pas préciser la clé primaire directement à la création de la table. Il
                                # est tout à fait possible de l’ajouter par la suite. Nous verrons comment un peu plus tard.


                            -- I.5.4.1.2. Definition des colonnes
                            -- ----------------------------------
                                # Pour définir une colonne, il faut donc donner son nom en premier, puis sa description. La
                                # description est constituée au minimum du type de la colonne. Exemple :
                                
                                # 1 nom VARCHAR(30),
                                # 2 sexe CHAR(1)
                                
                                # C’est aussi dans la description que l’on précise si la colonne peut contenir NULL ou pas (par
                                # défaut, NULL est autorisé). Exemple :
                                
                                # 1 espece VARCHAR(40) NOT NULL,
                                # 2 date_naissance DATETIME NOT NULL
                                
                                # L’auto-incrémentation se définit également à cet endroit. Notez qu’il est également possible
                                # de définir une colonne comme étant la clé primaire dans sa description. Il ne faut alors plus
                                # l’indiquer après la définition de toutes les colonnes. Je vous conseille néanmoins de ne pas
                                # l’indiquer à cet endroit, nous verrons plus tard pourquoi.
                                
                                # 1 id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT [PRIMARY KEY]
                                
                                # Enfin, on peut donner une valeur par défaut au champ. Si lorsque l’on insère une ligne, aucune
                                # valeur n’est précisée pour le champ, c’est la valeur par défaut qui sera utilisée. Notez que si une
                                # colonne est autorisée à contenir NULL et qu’on ne précise pas de valeur par défaut, alors NULL
                                # est implicitement considéré comme valeur par défaut.
                                
                                # Exemple :
                                # 1 espece VARCHAR(40) NOT NULL DEFAULT 'chien'
                                
                                # Une valeur par défaut DOIT être une constante. Ce ne peut pas être une fonction (comme
                                # par exemple la fonction NOW() qui renvoie la date et l’heure courante).




                        -- I.5.4.2. Application: creation de Animal
                        -- ----------------------------------------

                            CREATE TABLE Animal (
                            id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                            espece VARCHAR(40) NOT NULL,
                            sex CHAR(1),
                            date_naissance DATETIME NOT NULL,
                            nom VARCHAR(30),
                            commentaires TEXT,
                            PRIMARY KEY(id)
                            )
                            ENGINE = INNODB;


                        -- I.5.4.3. Verifications
                        -- ----------------------

                            SHOW TABLES;  -- liste les tables de la base de données

                            DESCRIBE Animal; -- liste les colonnes de la table avec leurs caractéristiques

                            DESC animal; -- DESC is a short for describe





                    -- I.5.5. Suppression d'une table
                    -- ------------------------------
                        -- I.5.5.1. En resume

                        # La commande pour supprimer une table est la même que celle pour supprimer une base de
                        # données. Elle est, bien sûr, à utiliser avec prudence, car irréversible.
                        # 1 DROP TABLE Animal


                        -- I.5.5.1. En resume
                        -- ------------------

                            # — Avant de créer une table, il faut définir ses colonnes. Pour cela, il faut donc déterminer
                            #     le type de chacune des colonnes et décider si elles peuvent ou non contenir NULL (c’est-à-
                            #     dire ne contenir aucune donnée).
                            # — Chaque table créée doit définir une clé primaire, donc une colonne qui permettra
                            #     d’identifier chaque ligne de manière unique.
                            # — Le moteur d’une table définit la manière dont elle est gérée. Nous utiliserons le moteur
                            #     InnoDB, qui permet notamment de définir des relations entre plusieurs tables.




                -- I.6. Modification d'une table
                -- -----------------------------
                    -- I.6.1. Syntaxe de la requete
                    -- I.6.2. Ajout et suppression d'une colonne
                    -- I.6.3. Modification de colonne

                    # La création et la suppression de tables étant acquises, parlons maintenant des requêtes permettant
                    # de modifier une table. Plus précisément, ce chapitre portera sur la modification des colonnes
                    # d’une table (ajout d’une colonne, modification, suppression de colonnes). Il est possible de
                    # modifier d’autres éléments (des contraintes, ou des index par exemple), mais cela nécessite des
                    # notions que vous ne possédez pas encore, aussi n’en parlerai-je pas ici.
                    
                    # Notez qu’idéalement, il faut penser à l’avance à la structure de votre base et créer toutes vos
                    # tables directement et proprement, de manière à ne les modifier qu’exceptionnellement.


                    -- I.6.1. Syntaxe de la requete
                    -- ----------------------------
                        -- I.6.1.0.1. Creons une table pour faire joujou

                        # Lorsque l’on modifie une table, on peut vouloir lui ajouter, retirer ou modifier quelque chose.
                        # Dans les trois cas, c’est la commande ALTER TABLE qui sera utilisée, une variante existant pour
                        # chacune des opérations :

                        # ALTER TABLE nom_table ADD ... -- permet d'ajouter quelque chose (une colonne par exemple)
                        # ALTER TABLE nom_table DROP ... -- permet de retirer quelque chose
                        # ALTER TABLE nom_table CHANGE ...
                        # ALTER TABLE nom_table MODIFY ... -- permettent de modifier une colonne


                        -- I.6.1.0.1. Creons une table pour faire joujou
                        -- ---------------------------------------------

                            # Dans la seconde partie de ce tutoriel, nous devrons faire quelques modifications sur notre table
                            # Animal, mais en attendant, je vous propose d’utiliser la table suivante, si vous avez envie de
                            # tester les différentes possibilités d’ALTER TABLE :

                            CREATE TABLE Test_tuto (
                                id INT NOT NULL,
                                nom VARCHAR(10) NOT NULL,
                                PRIMARY KEY(id));



                    -- I.6.2. Ajout et suppression d'une colonne
                    -- -----------------------------------------
                        -- I.6.2.1. Ajout
                        -- I.6.2.2. Suppression


                        -- I.6.2.1. Ajout
                        -- --------------
                            # Syntaxe

                            # ALTER TABLE nom_table
                            # ADD [COLUMN] nom_colonne description_colonne;

                            # Le [COLUMN] est facultatif, donc si à la suite de ADD vous ne précisez pas ce que vous voulez
                            # ajouter, MySQL considérera qu’il s’agit d’une colonne. description_colonne correspond à
                            # la même chose que lorsque l’on crée une table. Il contient le type de donnée et éventuellement
                            # NULL ou NOT NULL, etc.
                            # Ajoutons une colonne date_insertion à notre table de test. Il s’agit d’une date, donc une colonne
                            # de type DATE convient parfaitement. Disons que cette colonne ne peut pas être NULL (si c’est
                            # dans la table, ça a forcément été inséré). Cela nous donne :
                        
                            ALTER TABLE test_tuto ADD COLUMN date_insertion DATE NOT NULL AFTER id ;

                            DESCRIBE test_tuto;

                            ALTER TABLE test_tuto ADD COLUMN adresse VARCHAR(50)  UNIQUE FIRST;
                        
                        
                        
                        -- I.6.2.2. Suppression
                        -- --------------------

                            # Syntaxe
                            # ALTER TABLE nom_table
                            # DROP [COLUMN] nom_colonne;

                            #Comme pour les ajouts, le mot COLUMN est facultatif. Par défaut, MySQL considérera que vous
                            #parlez d’une colonne.
                            #Exemple : nous allons supprimer la colonne date_insertion, que nous remercions pour son
                            #passage éclair dans le cours.
                            
                            ALTER TABLE Test_tuto
                            DROP COLUMN date_insertion; -- Suppression de la colonne date_insertion




                    -- I.6.3. Modification de colonne
                    -- ------------------------------
                        -- I.6.3.1. Changement du nom de les colonnes
                        -- I.6.3.2. Changement du type de donnees
                        -- I.6.3.3. En resume


                        -- I.6.3.1. Changement du nom de les colonnes
                        -- ------------------------------------------
                            # Syntaxe 

                            # ALTER TABLE nom_table 
                            # CHANGE ancien_nom nouveau_nom description_colonne;

                            # Par exemple, pour renommer la colonne nom en prenom, vous pouvez écrire
                            
                            ALTER TABLE Test_tuto 
                            CHANGE nom prenom VARCHAR(10) NOT NULL;

                            DESC Test_tuto;


                        -- I.6.3.2. Changement du type de donnees
                        -- --------------------------------------

                            # Les mots-clés CHANGE et MODIFY peuvent être utilisés pour changer le type de donnée de la
                            # colonne, mais aussi changer la valeur par défaut ou ajouter/supprimer une propriété AUTO_IN
                            # CREMENT. Si vous utilisez CHANGE, vous pouvez, comme on vient de le voir, renommer la colonne
                            # en même temps. Si vous ne désirez pas la renommer, il suffit d’indiquer deux fois le même nom.
                            
                            # Voici les syntaxes possibles :
                            
                            # ALTER TABLE nom_table 
                            # CHANGE ancien_nom nouveau_nom nouvelle_description;
                            
                            # ALTER TABLE nom_table 
                            # MODIFY nom_colonne nouvelle_description

                            # Des exemples pour illustrer :

                            ALTER TABLE Test_tuto 
                            CHANGE prenom nom VARCHAR(30) NOT NULL; -- Changement du type + changement du nom 
                            
                            ALTER TABLE Test_tuto
                            CHANGE id id BIGINT NOT NULL; -- Changement du type sans renommer

                            DESC Test_tuto;

                            ALTER TABLE Test_tuto 
                            MODIFY id BIGINT NOT NULL AUTO_INCREMENT; 
                            -- Ajout de l auto-incrémentation910 

                            ALTER TABLE Test_tuto 
                            MODIFY nom VARCHAR(30) NOT NULL DEFAULT 'Blabla'; 
                            -- Changement de la description (même type mais ajout d'une valeur par défau

                            DESC Test_tuto;


                            # Il existe pas mal d’autres possibilités et combinaisons pour la commande ALTER TABLE mais
                            # en faire la liste complète ne rentre pas dans le cadre de ce cours. Si vous ne trouvez pas votre
                            # bonheur ici, je vous conseille de le chercher dans la documentation officielle
                            # (http://dev.mysql.com/doc/refman/5.5/en/alter-table.html).


                        -- I.6.3.3. En resume
                        -- ------------------

                            # La commande ALTER TABLE permet de modifier une table
                            # — Lorsque l’on ajoute ou modifie une colonne, il faut toujours préciser sa (nouvelle) des-
                            #   cription complète (type, valeur par défaut, auto-incrément éventuel)




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
                                SOURCE C:\Users\PERSONNE\Desktop\informatique\Mysql\MySqlVsCodeGit\revision\st_tb.sql

                                DESC Student;

                                LOAD DATA LOCAL infile "C:/Users/PERSONNE/Desktop/informatique/Mysql/MySqlVsCodeGit/revision/data.txt" 
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

                                SELECT * FROM ex6csv limit 1000;


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

                



                -- I.8. Selection de donnees
                -- -------------------------
                    -- I.8.1. Syntaxe de SELECT
                    -- I.8.2. La clause WHERE
                    -- I.8.3. Tri des donnees
                    -- I.8.4. Eliminer les doublons
                    -- I.8.5. Restreindre les resultats


                    # Comme son nom l’indique, ce chapitre traitera de la sélection et de l’affichage de données.
                    # Au menu :
                    
                    # — syntaxe de la requête SELECT (que vous avez déjà croisée il y a quelque temps) ;
                    
                    # — sélection de données répondant à certaines conditions ;
                    
                    # — tri des données ;
                    
                    # — élimination des données en double ;
                    
                    # — récupération de seulement une partie des données (uniquement les 10 premières lignes,
                    #   par exemple).
                    
                    # Motivés ? Alors c’est parti !!!


                    -- I.8.1. Syntaxe de SELECT
                    -- ------------------------
                        -- I.8.1.1. Selectionner toutes les colonnes

                        # La requête qui permet de sélectionner et afficher des données s’appelle SELECT. Nous l’avons
                        # déjà un peu utilisée dans le chapitre d’installation, ainsi que pour afficher tout le contenu de la
                        # table Animal.
                        
                        # SELECT permet donc d’afficher des données directement. Des chaînes de caractères, des résultats
                        # de calculs, etc.
                        
                        # Exemple
                        SELECT 'Salama Tompoko !';
                        SELECT 3+2;

                        # SELECT permet également de sélectionner des données à partir d’une table. Pour cela, il faut
                        # ajouter une clause à la commande SELECT : la clause FROM, qui définit de quelle structure (dans
                        # notre cas, une table) viennent les données.            

                        # SELECT colonne1, colonne2, ... 
                        # FROM nom_table;

                        # Par exemple, si l’on veut sélectionner l’espèce, le nom et le sexe des animaux présents dans la
                        # table Animal, on utilisera :



                        -- I.8.1.1. Selectionner toutes les colonnes
                        -- -----------------------------------------
                        
                            # Si vous désirez sélectionner toutes les colonnes, vous pouvez utiliser le caractère * dans votre
                            # requête:

                    
                            SELECT *
                            FROM Animal;

                            # Il est cependant déconseillé d’utiliser SELECT * trop souvent. Donner explicitement le nom des
                            # colonnes dont vous avez besoin présente deux avantages :

                            # — d’une part, vous êtes certains de ce que vous récupérez ;
                            # — d’autre part, vous récupérez uniquement ce dont vous avez vraiment besoin, ce qui permet
                            # d’économiser des ressources.

                            # Le désavantage est bien sûr que vous avez plus à écrire, mais le jeu en vaut la chandelle.

                            # Comme vous avez pu le constater, les requêtes SELECT faites jusqu’à présent sélectionnent toutes
                            # les lignes de la table. Or, bien souvent, on ne veut qu’une partie des données. Dans la suite de
                            # ce chapitre, nous allons voir ce que nous pouvons ajouter à cette requête SELECT pour faire des
                            # sélections à l’aide de critères.            



                    -- I.8.2. La clause WHERE
                    -- ----------------------
                        -- I.8.2.1. Les operateurs de comparaison
                        -- I.8.2.2. Combinaisons de criteres

                        # La clause WHERE (”où” en anglais) permet de restreindre les résultats selon des critères de
                        # recherche. On peut par exemple vouloir ne sélectionner que les chiens :

                        SELECT *
                        FROM Animal
                        WHERE espece='chien';

                        # Comme ’chien’ est une chaîne de caractères, je dois bien sûr l’entourer de guillemets


                        -- I.8.2.1. Les operateurs de comparaison
                        -- --------------------------------------
                            
                            # Les opérateurs de comparaison sont les symboles que l’ont utilise pour définir les critères de
                            # recherche (le = dans notre exemple précédent). Huit opérateurs simples peuvent être utilisés.


                            ##################################################
                            # operateur    # Signification                   #
                            ##################################################
                            # =            # egal                            #
                            # <            # inferieur                       #
                            # <=           # inferieur ou egal               #
                            # >            # superieur                       #
                            # >=           # superieur ou egal               #
                            # <> ou !=     # differents                      #
                            # <=>          # egale (valable pour NULL aussi) #
                            ##################################################


                            SELECT *
                            FROM Animal 
                            WHERE date_naissance < '2008-01-01'; 
                            -- Animaux nés avant 2008

                            SELECT *
                            FROM Animal
                            WHERE espece <> 'chat'; 
                            -- Tous les animaux sauf les chats


                        -- I.8.2.2. Combinaisons de criteres
                        -- ---------------------------------
                            -- I.8.2.2.1. AND
                            -- I.8.2.2.2. OR
                            -- I.8.2.2.3. NOT
                            -- I.8.2.2.4. XOR
                            -- I.8.2.2.5. Selection complexe
                            -- I.8.2.2.6. Exercice/Exemple
                            -- I.8.2.2.6. Exercice/Exemple




                            # Tout ça c’est bien beau, mais comment faire si on veut les chats et les chiens par exemple ?
                            # Faut-il faire deux requêtes ? Non bien sûr, il suffit de combiner les critères. Pour cela, il faut des
                            # opérateurs logiques, qui sont au nombre de quatre :


                            ########################################
                            # operateur # Symbole # Signification  #
                            ########################################
                            # AND       # &&      # Et             #
                            # OR        # ||      # OU             #
                            # XOR       #         # OU exclusif    #
                            # NOT       # !       # Non            #
                            ########################################


                            -- I.8.2.2.1. AND
                            -- --------------
                            
                                # Je veux sélectionner toutes les chattes. Je veux donc sélectionner les animaux qui sont à la fois
                                # des chats ET des femelles. J’utilise l’opérateur AND :

                                SELECT *
                                FROM Animal
                                WHERE espece='chat' 
                                AND sexe='F'; 

                                -- OU

                                SELECT * 
                                FROM Animal 
                                WHERE espece='chat'
                                && sexe='F';


                            -- I.8.2.2.2. OR
                            -- -------------

                                # Sélection des tortues et des perroquets. Je désire donc obtenir les animaux qui sont des tortues
                                # OU des perroquets :

                                SELECT * 
                                FROM Animal 
                                WHERE espece='tortue' 
                                OR espece='perroquet';

                                -- OU 

                                SELECT * 
                                FROM Animal 
                                WHERE espece='tortue' 
                                || espece='perroquet';


                                # Je vous conseille d’utiliser plutôt OR que ||, car dans la majorité des SGBDR (et dans la
                                # norme SQL), l’opérateur || sert à la concaténation. C’est-à-dire à rassembler plusieurs
                                # chaînes de caractères en une seule. Il vaut donc mieux prendre l’habitude d’utiliser OR, au
                                # cas où vous changeriez un jour de SGBDR (ou tout simplement parce que c’est une bonne
                                # habitude).

                            
                            -- I.8.2.2.3. NOT
                            -- --------------
                                # Sélection de tous les animaux femelles sauf les chiennes.

                                SELECT *
                                FROM Animal 
                                WHERE sexe='F' 
                                AND NOT espece='chien';
                                
                                # Tsy mandeha intsony io syntaxe io.
                                # SELECT *
                                # FROM Animal 
                                # WHERE sexe='F' 
                                # AND ! espece='chien';

                                # mysql> SELECT * FROM Animal WHERE sexe='F' AND !espece='chien';
                                # Empty set, 15 warnings (0.00 sec)
                                # 
                                # mysql> SHOW WARNINGS;
                                # +---------+------+-----------------------------------------------------------------------------------+
                                # | Level   | Code | Message                                                                           |
                                # +---------+------+-----------------------------------------------------------------------------------+
                                # | Warning | 1287 | '!' is deprecated and will be removed in a future release. Please use NOT instead |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chat'                                          |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'tortue'                                        |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'tortue'                                        |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # | Warning | 1292 | Truncated incorrect DOUBLE value: 'chien'                                         |
                                # +---------+------+-----------------------------------------------------------------------------------+
                                # 15 rows in set (0.04 sec)



                            -- I.8.2.2.4. XOR
                            -- --------------

                                # Sélection des animaux qui sont soit des mâles, soit des perroquets (mais pas les deux) :
                                SELECT * 
                                FROM Animal 
                                WHERE sexe='M' 
                                XOR espece='chien';

                            
                            -- I.8.2.2.5. Selection complexe
                            -- -----------------------------

                                # Lorsque vous utilisez plusieurs critères, et que vous devez donc combiner plusieurs opérateurs
                                # logiques, il est extrêmement important de bien structurer la requête. En particulier, il faut placer
                                # des parenthèses au bon endroit. En effet, cela n’a pas de sens de mettre plusieurs opérateurs
                                # logiques différents sur un même niveau.

                                # Petit exemple simple :
                                # Critères : rouge AND vert OR bleu

                                # Qu’accepte-t-on ?
                                # — Ce qui est rouge et vert, et ce qui est bleu ?
                                # — Ou ce qui est rouge et, soit vert soit bleu ?

                                # Dans le premier cas, [rouge, vert] et [bleu] seraient acceptés. Dans le deuxième, c’est [rouge,
                                # vert] et [rouge, bleu] qui seront acceptés, et non [bleu].

                                # En fait, le premier cas correspond à (rouge AND vert) OR bleu, et le deuxième cas à rouge AND
                                # (vert OR bleu).

                                # Avec des parenthèses, pas moyen de se tromper sur ce qu’on désire sélectionner !


                            -- I.8.2.2.6. Exercice/Exemple
                            -- ---------------------------

                                # Alors, imaginons une requête bien tordue...
                                
                                # Je voudrais les animaux qui sont, soit nés après 2009, soit des chats mâles ou femelles, mais
                                # dans le cas des femelles, elles doivent être nées avant juin 2007.
                                
                                # Je vous conseille d’essayer d’écrire cette requête tout seuls. Si vous n’y arrivez pas, voici une
                                # petite aide : l’astuce, c’est de penser en niveaux. Je vais donc découper ma requête.
                                # Je cherche :
                                
                                # — les animaux nés après 2009 ;
                                # — les chats mâles et femelles (uniquement nées avant juin 2007 pour les femelles).
                                
                                # C’est mon premier niveau. L’opérateur logique sera OR puisqu’il faut que les animaux répondent
                                # à un seul des deux critères pour être sélectionnés.
                                
                                # On continue à découper. Le premier critère ne peut plus être subdivisé, contrairement au
                                # deuxième. Je cherche :
                                
                                # — les animaux nés après 2009 ;
                                # — les chats :
                                # — mâles ;
                                # — et femelles nées avant juin 2007.
                                
                                # Et voilà, vous avez bien défini les différents niveaux, il n’y a plus qu’à écrire la requête avec les
                                # bons opérateurs logiques !

                                # Reponse

                                SELECT * 
                                FROM Animal 
                                WHERE date_naissance > '2009-12-31' 
                                    OR
                                    ( espece='chat' 
                                        AND
                                        ( sexe='M' 
                                            OR
                                            ( sexe='F' AND date_naissance < '2007-06-01' )
                                        )
                                    );



                            -- I.8.2.2.7. Le cas de NULL
                            -- -------------------------

                                # Vous vous souvenez sans doute de la liste des opérateurs de comparaison que je vous ai présentée
                                # (sinon, retournez au début de la partie sur la clause WHERE). Vous avez probablement été un peu
                                # étonnés de voir dans cette liste l’opérateur <=> : égal (valable aussi pour NULL). D’autant plus
                                # que j’ai fait un peu semblant de rien et ne vous ai pas donné d’explication sur cette mystérieuse
                                # précision ”aussi valable pour NULL” . Mais je vais me rattraper maintenant ! En fait, c’est
                                # très simple, le marqueur NULL (qui représente donc ”pas de valeur”) est un peu particulier. En
                                # effet, vous ne pouvez pas tester directement colonne = NULL. Essayons donc :

                                SELECT *
                                FROM Animal 
                                WHERE nom = NULL; -- sélection des animaux sans nom

                                SELECT *
                                FROM Animal 
                                WHERE commentaires <> NULL; # Tsy mahasolo not io operateur different io (<>)
                                
                                SELECT *
                                FROM Animal 
                                WHERE commentaires IS NOT NULL;

                                # Comme vous pouvez vous en douter après ma petite introduction, ces deux requêtes ne renvoient
                                # pas les résultats que l’on pourrait espérer. En fait, elles ne renvoient aucun résultat. C’est donc
                                # ici qu’intervient notre opérateur de comparaison un peu spécial <=> qui permet de reconnaître
                                # NULL. Une autre possibilité est d’utiliser les mots-clés IS NULL, et si l’on veut exclure les NULL :
                                # IS NOT NULL. Nous pouvons donc réécrire nos requêtes, correctement cette fois-ci :

                                SELECT *
                                FROM Animal 
                                WHERE nom <=> NULL; 
                                -- sélection des animaux sans nom

                                -- OU 

                                SELECT * 
                                FROM Animal 
                                WHERE nom IS NULL;

                                SELECT * 
                                FROM Animal 
                                WHERE commentaires IS NOT NULL; 
                        
                                -- sélection des animaux pour lesquels un commentaire existe

                    -- I.8.3. Tri des donnees
                    -- ----------------------
                        -- I.8.3.1. Tri ascendant ou descendant
                        -- I.8.3.2. Trier sur plusieurs colonnes

                        # Lorsque vous faites un SELECT, les données sont récupérées dans un ordre défini par MySQL,
                        # mais qui n’a aucun sens pour vous. Vous avez sans doute l’impression que MySQL renvoie tout
                        # simplement les lignes dans l’ordre dans lequel elles ont été insérées, mais ce n’est pas exactement
                        # le cas. En effet, si vous supprimez des lignes, puis en ajoutez de nouvelles, les nouvelles lignes
                        # viendront remplacer les anciennes dans l’ordre de MySQL. Or, bien souvent, vous voudrez trier
                        # à votre manière. Par date de naissance par exemple, ou bien par espèce, ou par sexe, etc.
                        
                        # Pour trier vos données, c’est très simple, il suffit d’ajouter ORDER BY tri à votre requête (après
                        # les critères de sélection de WHERE s’il y en a) et de remplacer ”tri” par la colonne sur laquelle
                        # vous voulez trier vos données bien sûr.
                        
                        # Par exemple, pour trier par date de naissance :
                        
                        SELECT * 
                        FROM Animal 
                        WHERE espece='chien' 
                        ORDER BY date_naissance;

                        

                        -- I.8.3.1. Tri ascendant ou descendant
                        -- ------------------------------------
                    
                            # Et hop ! Vos données sont triées, les plus vieux chiens sont récupérés en premier, les jeunes à la
                            # fin.
                            
                            # Tout ça c’est bien beau, j’ai mes chiens triés du plus vieux au plus jeune. Et si je veux le
                            # contraire ? Pour déterminer le sens du tri effectué, SQL possède deux mots-clés : ASC pour
                            # ascendant, et DESC pour descendant. Par défaut, si vous ne précisez rien, c’est un tri ascendant
                            # qui est effectué : du plus petit nombre au plus grand, de la date la plus ancienne à la plus
                            # récente, et pour les chaînes de caractères et les textes, c’est l’ordre alphabétique normal qui est
                            # utilisé. Si par contre vous utilisez le mot DESC, l’ordre est inversé : plus grand nombre d’abord,
                            # date la plus récente d’abord, et ordre anti-alphabétique pour les caractères.

                            # Petit cas particulier : les ENUM sont des chaînes de caractères, mais sont triés selon l’ordre
                            # dans lequel les possibilités ont été définies. Si par exemple on définit une colonne exemple
                            # ENUM('a', 'd', 'c', 'b'), l’ordre ASC sera ’a’, ’d’, ’c’ puis ’b’ et l’ordre DESC ’b’, ’c’,
                            # ’d’ suivi de ’a’.

                            SELECT *
                            FROM Animal 
                            WHERE espece='chien' 
                                AND nom IS NOT NULL
                            ORDER BY nom DESC;


                        -- I.8.3.2. Trier sur plusieurs colonnes
                        -- -------------------------------------
                            # Il est également possible de trier sur plusieurs colonnes. Par exemple, si vous voulez que les
                            # résultats soient triés par espèce et, dans chaque espèce, triés par date de naissance, il suffit de
                            # donner les deux colonnes correspondantes à ORDER BY :

                            SELECT * 
                            FROM Animal 
                            ORDER BY espece, date_naissance;

                            # L’ordre dans lequel vous donnez les colonnes est important, le tri se fera d’abord sur la
                            # première colonne donnée, puis sur la seconde, etc.


                    -- I.8.4. Eliminer les doublons
                    -- ----------------------------

                        # Il peut arriver que MySQL vous donne plusieurs fois le même résultat. Non pas parce que
                        # MySQL fait des bêtises, mais tout simplement parce que certaines informations sont présentes
                        # plusieurs fois dans la table.
                        # Petit exemple très parlant : vous voulez savoir quelles sont les espèces que vous possédez dans
                        # votre élevage. Facile, une petite requête :

                        SELECT espece 
                        FROM Animal;

                        # En effet, vous allez bien récupérer toutes les espèces que vous possédez, mais si vous avez 500
                        # chiens, vous allez récupérer 500 lignes ’chien’. Un peu embêtant lorsque la table devient bien
                        # remplie.
                        
                        # Heureusement, il y a une solution : le mot-clé DISTINCT. Ce mot-clé se place juste après SELECT
                        # et permet d’éliminer les doublons.

                        SELECT DISTINCT espece 
                        FROM Animal;

                        # Ceci devrait gentiment vous ramener quatre lignes avec les quatre espèces qui se trouvent dans
                        # la table. C’est quand même plus clair non ?
                        # Attention cependant, pour éliminer un doublon, il faut que toute la ligne sélectionnée soit
                        # égale à une autre ligne du jeu de résultats. Ça peut paraître logique, mais cela en perd plus d’un.

                        # Ne seront donc prises en compte que les colonnes que vous avez précisées dans votre SELECT.
                        # Uniquement espece donc, dans notre exemple.



                    -- I.8.5. Restreindre les resultats
                    -- --------------------------------
                        -- I.8.5.1. Syntaxe
                        -- I.8.5.2. Syntaxe alternative
                        -- I.8.5.3. En resumee

                        # En plus de restreindre une recherche en lui donnant des critères grâce à la clause WHERE, il est
                        # possible de restreindre le nombre de lignes récupérées. Cela se fait grâce à la clause LIMIT.


                        -- I.8.5.1. Syntaxe
                        -- ----------------

                            # LIMIT s’utilise avec deux paramètres.
                            # — Le nombre de lignes que l’on veut récupérer.
                            # — Le décalage, introduit par le mot-clé OFFSET et qui indique à partir de quelle ligne on
                            # récupère les résultats. Ce paramètre est facultatif. S’il n’est pas précisé, il est mis à 0.

                            # LIMIT nombre_de_lignes [OFFSET decalage];

                            SELECT * 
                            FROM animal 
                                ORDER BY id 
                                    LIMIT 6; -- PAR DEFAUT OFFSET = 0

                            SELECT * 
                            FROM animal 
                                ORDER BY id 
                                    LIMIT 6 OFFSET 0;

                            SELECT * 
                            FROM animal 
                                ORDER BY id 
                                    LIMIT 6 OFFSET 3;

                            SELECT *  
                            FROM animal WHERE 
                                date_naissance > '2009-12-31'
                                OR 
                                (espece='chat' AND 
                                                (sexe='M' 
                                                OR 
                                                (sexe='F' AND date_naissance <'2007-06-01') 
                                                )
                                );


                            # Avec la première et la deuxieme requête, vous devriez obtenir six lignes, les six plus petits id puisque nous
                            # n’avons demandé aucun décalage (OFFSET 0).


                        -- I.8.5.2. Syntaxe alternative
                        -- ----------------------------

                            # MySQL accepte une autre syntaxe pour la clause LIMIT. Ce n’est cependant pas la norme SQL
                            # donc idéalement vous devriez toujours utiliser la syntaxe officielle. Vous vous apercevrez toutefois
                            # que cette syntaxe est énormément usitée, je ne pouvais donc pas ne pas la mentionner.

                            # Any amin ny commande dos io requette io ambany io mandeha tsara:
                            SELECT * 
                            FROM Animal 
                            ORDER BY id
                            LIMIT 10, 6;

                            # SELECT * 
                            # FROM Animal 
                            # ORDER BY id
                            # LIMIT [decalage, ]nombre_de_lignes;

                            # Tout comme pour la syntaxe officielle, le décalage n’est pas obligatoire, et vaudra 0 par défaut.
                            # Si vous le précisez, n’oubliez pas la virgule entre le décalage et le nombre de lignes désirées.


                            # mysql> SELECT *
                            #     -> FROM Animal
                            #     -> ORDER BY id
                            #     -> LIMIT 10, 6;
                            # +----+--------+------+---------------------+----------+--------------+
                            # | id | espece | sexe | date_naissance      | nom      | commentaires |
                            # +----+--------+------+---------------------+----------+--------------+
                            # | 39 | chien  | F    | 2008-02-20 15:45:00 | Canaille | NULL         |
                            # | 40 | chien  | F    | 2009-05-26 08:54:00 | Cali     | NULL         |
                            # | 41 | chien  | F    | 2007-04-24 12:54:00 | Rouquine | NULL         |
                            # | 42 | chien  | F    | 2009-05-26 08:56:00 | Fila     | NULL         |
                            # | 43 | chien  | F    | 2008-02-20 15:47:00 | Anya     | NULL         |
                            # | 44 | chien  | F    | 2009-05-26 08:50:00 | Louya    | NULL         |
                            # +----+--------+------+---------------------+----------+--------------+
                            # 6 rows in set (0.00 sec)


                        -- I.8.5.3. En resumee
                        -- -------------------

                            # — La commande SELECT permet d’afficher des données.
                            # — La clause WHERE permet de préciser des critères de sélection.
                            # — Il est possible de trier les données grâce à ORDER BY, selon un ordre ascendant (ASC) ou
                            # descendant (DESC).
                            # — Pour éliminer les doublons, on utilise le mot-clé DISTINCT, juste après SELECT.
                            # — LIMIT nb_lignes OFFSET decalage permet de sélectionner uniquement nb_lignes de
                            # résultats, avec un certain décalage.



                -- I.9. Elargir la possibilite de la clause WHERE
                -- ----------------------------------------------
                    -- I.9.1. Recherche approximative
                    -- I.9.2. Recherche dans un intervalle
                    -- I.9.3. Set de criteres


                    # Dans le chapitre précédent, vous avez découvert la commande SELECT, ainsi que plusieurs
                    # clauses permettant de restreindre et d’ordonner les résultats selon différents critères. Nous
                    # allons maintenant revenir plus particulièrement sur la clause WHERE. Jusqu’ici, les conditions
                    # permises par WHERE étaient très basiques. Mais cette clause offre bien d’autres possibilités parmi
                    # lesquelles:
                    
                    # — la comparaison avec une valeur incomplète (chercher les animaux dont le nom commence
                    # par une certaine lettre par exemple) ;
                    # — la comparaison avec un intervalle de valeurs (entre 2 et 5 par exemple) ;
                    # — la comparaison avec un ensemble de valeurs (comparaison avec 5, 6, 10 ou 12 par exemple)
                    
                    
                    
                    -- I.9.1. Recherche approximative
                    -- ------------------------------
                        -- I.9.1.0.1. Rechercher '%' ou 'ou'
                        -- I.9.1.0.2. Exclure une chaine de caracteres
                        -- I.9.1.1. Sensibilite a la casse
                        -- I.9.1.2. Recherche dans le numeriques




                            # Pour l’instant, nous avons vu huit opérateurs de comparaison :

                            ##################################################
                            # operateur    # Signification                   #
                            ##################################################
                            # =            # egal                            #
                            # <            # inferieur                       #
                            # <=           # inferieur ou egal               #
                            # >            # superieur                       #
                            # >=           # superieur ou egal               #
                            # <> ou !=     # differents                      #
                            # <=>          # egale (valable pour NULL aussi) #
                            ##################################################

                            # À l’exception de <=> qui est un peu particulier, ce sont les opérateurs classiques, que vous
                            # retrouverez dans tous les langages informatiques. Cependant, il arrive que ces opérateurs ne
                            # soient pas suffisants. En particulier pour des recherches sur des chaînes de caractères. En effet,
                            # comment faire lorsqu’on ne sait pas si le mot que l’on recherche est au singulier ou au pluriel
                            # par exemple ? Ou si l’on cherche toutes les lignes dont le champ ”commentaires” contient un
                            # mot particulier ?

                            # Pour ce genre de recherches, l’opérateur LIKE est très utile, car il permet de faire des recherches
                            # en utilisant des ”jokers”, c’est-à-dire des caractères qui représentent n’importe quel caractère.

                            # Deux jokers existent pour LIKE :
                            # — '%' : qui représente n’importe quelle chaîne de caractères, quelle que soit sa longueur (y
                            #         compris une chaîne de longueur 0) ;
                            # — '_' : qui représente un seul caractère (ou aucun).


                            # Quelques exemples :

                            # — 'b%' cherchera toutes les chaînes de caractères commençant par 'b' ('brocoli',
                            #   'bouli', 'b')
                            # — 'B_' cherchera toutes les chaînes de caractères contenant une ou deux lettres dont la
                            #    première est 'b' ('ba', 'bf', 'b')
                            # — '%ch%ne' cherchera toutes les chaînes de caractères contenant 'ch' et finissant par
                            #    'ne' ('chne', 'chine', 'échine', 'le pays le plus peuplé du monde est la
                            #     Chine')                
                            # — '_ch_ne' cherchera toutes les chaînes de caractères commençant par 'ch', éventuelle-
                            #     ment précédées d’une seule lettre, suivies de zéro ou d’un caractère au choix et enfin se
                            #     terminant par 'ne' ('chine', 'chne', 'echine').



                            
                        -- I.9.1.0.1. Rechercher '%' ou 'ou'
                        -- ---------------------------------

                            # Comment faire si vous cherchez une chaîne de caractères contenant ’%’ ou ’’ ? Évidemment, si
                            # vous écrivez LIKE '%' ou ‘LIKE ’’, MySQL vous donnera absolument toutes les chaînes
                            # de caractères dans le premier cas, et toutes les chaînes de 0 ou 1 caractère dans
                            # le deuxième. Il faut donc signaler à MySQL que vous ne désirez pas utiliser ||%||
                            # ou ||_|| en tant que joker, mais bien en tant que caractère de recherche. Pour
                            -- ça, il suffit de mettre le caractère d'échappement ||\||, dont je vous ai déjà
                            # parlé, devant le ’%’ou le’_’‘.


                            INSERT INTO Animal VALUE 
                            (35, 'chat', 'F', '2008-04-20 03:20:00',
                            'bibla', 'Sourde de l\'oreille droite 80%') ; -- '
                                
                            SELECT *
                            FROM Animal 
                            WHERE commentaires LIKE '%\%%';


                        -- I.9.1.0.2. Exclure une chaine de caracteres
                        -- -------------------------------------------

                            # C’est logique, mais je précise quand même (et puis ça fait un petit rappel) : l’opérateur logique
                            # NOT est utilisable avec LIKE. Si l’on veut rechercher les animaux dont le nom ne contient pas la
                            # lettre a , on peut donc écrire :
                            
                            SELECT * 
                            FROM Animal 
                            WHERE nom NOT LIKE '%a%';



                        -- I.9.1.1. Sensibilite a la casse
                        -- -------------------------------
                        
                            # Vous l’aurez peut-être remarqué en faisant des essais, LIKE 'chaîne de caractères' n’est
                            # pas sensible à la casse (donc aux différences majuscules-minuscules). Pour rappel, ceci est dû à
                            # l’interclassement. Nous avons gardé l’interclassement par défaut du jeu de caractère UTF-8, qui
                            # n’est pas sensible à la casse. Si vous désirez faire une recherche sensible à la casse, vous pouvez
                            # définir votre chaîne de recherche comme une chaîne de type binaire, et non plus comme une
                            # simple chaîne de caractères :

                            SELECT * 
                            FROM Animal 
                            WHERE nom LIKE '%Ou%'; -- insensible à la casse 
                            
                            SELECT * 
                            FROM Animal 
                            WHERE nom LIKE BINARY '%Ou%'; -- sensible à la casse




                        -- I.9.1.2. Recherche dans le numeriques
                        -- -------------------------------------

                            # Nous pouvez bien entendu utiliser des chiffres dans une chaîne de caractères. Après tout, ce
                            # sont des caractères comme les autres. Par contre, utiliser LIKE sur un type numérique (INT par
                            # exemple), c’est déjà plus étonnant. Et pourtant, MySQL le permet. Attention cependant, il
                            # s’agit bien d’une particularité MySQL, qui prend souvent un malin plaisir à étendre la norme
                            # SQL pure.
                            
                            # LIKE '1%' sur une colonne de type numérique trouvera donc des nombres comme 10, 1000,
                            # 153

                            SELECT * 
                            FROM Animal 
                            WHERE id LIKE '1%';
                            



                    -- I.9.2. Recherche dans un intervalle
                    -- -----------------------------------

                        # Il est possible de faire une recherche sur un intervalle à l’aide uniquement des opérateurs de
                        # comparaison >= et <=. Par exemple, on peut rechercher les animaux qui sont nés entre le 5
                        # janvier 2008 et le 23 mars 2009 de la manière suivante :

                        SELECT * 
                        FROM Animal
                        WHERE date_naissance <= '2009-03-23' 
                            AND date_naissance >= '2008-01-05';


                        # Ça fonctionne très bien. Cependant, SQL dispose d’un opérateur spécifique pour les intervalles,
                        # qui pourrait vous éviter les erreurs d’inattention classiques (< au lieu de > par exemple) en
                        # plus de rendre votre requête plus lisible et plus performante : BETWEEN minimum AND maximum
                        # (between signifie ”entre” en anglais). La requête précédente peut donc s’écrire :

                        SELECT * 
                        FROM Animal 
                        WHERE date_naissance BETWEEN '2008-01-05' AND '2009-03-23';

                        # BETWEEN peut s’utiliser avec des dates, mais aussi avec des nombres (BETWEEN 0 AND 100) ou
                        # avec des chaînes de caractères (BETWEEN 'a' AND 'd') auquel cas c’est l’ordre alphabétique
                        # qui sera utilisé (toujours insensible à la casse sauf si l’on utilise des chaînes binaires : BETWEEN
                        # BINARY 'a' AND BINARY 'd'). Bien évidemment, on peut aussi exclure un intervalle avec NOT
                        # BETWEEN.


                    -- I.9.3. Set de criteres
                    -- ----------------------
                        -- I.9.3.1. En resume

                        # Le dernier opérateur à utiliser dans la clause WHERE que nous verrons dans ce chapitre est IN. Ce
                        # petit mot de deux lettres, bien souvent méconnu des débutants, va probablement vous permettre
                        # d’économiser du temps et des lignes.
                        # Imaginons que vous vouliez récupérer les informations des animaux répondant aux doux noms
                        # de Moka, Bilba, Tortilla, Balou, Dana, Redbul et Gingko. Jusqu’à maintenant, vous auriez sans
                        # doute fait quelque chose comme ça :

                        SELECT * 
                        FROM Animal WHERE nom = 'Moka'
                            OR nom = 'Bilba'    
                            OR nom = 'Tortilla'  
                            OR nom = 'Balou'     
                            OR nom = 'Dana'      
                            OR nom = 'Redbul'    
                            OR nom = 'Gingko'   ;


                        # Un peu fastidieux non ? Eh bien réjouissez-vous, car IN est dans la place ! Cet opérateur vous
                        # permet de faire des recherches parmi une liste de valeurs. Parfait pour nous donc, qui voulons
                        # rechercher les animaux correspondant à une liste de noms. Voici la manière d’utiliser IN:

                        SELECT * 
                        FROM Animal WHERE nom IN ('Bilba',    
                                                    'Tortilla', 
                                                    'Balou',    
                                                    'Dana',     
                                                    'Redbul',   
                                                    'Gingko',
                                                    'Moka'
                                                );


                        -- I.9.3.1. En resume
                        -- ------------------

                                — L’opérateur LIKE permet de faire des recherches approximatives, grâce aux deux caractères
                                ”joker” : '%' (qui représente 0 ou plusieurs caractères) et '_' (qui représente 0 ou 1
                                caractère).

                                — L’opérateur BETWEEN permet de faire une recherche sur un intervalle. WHERE colonne
                                BETWEEN a AND b étant équivalent à WHERE colonne >= a AND colonne <= b.

                                — Enfin, l’opérateur IN permet de faire une recherche sur une liste de valeurs.




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
