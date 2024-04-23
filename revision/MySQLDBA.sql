-- Active: 1713782639576@@127.0.0.1@3306@fiompina
USE Fiompina;

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



26




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




        -- I.3.4. Types temporels
        -- ----------------------
            -- I.3.4.1. DATE, TIME et DATETIME
            -- I.3.4.2. YEAR
            -- I.3.4.3. TIMESTAMP
            -- I.3.4.4. La date par defaut
            -- I.3.4.5. En resume



    -- I.4. Creation d'une base de donnees
    -- -----------------------------------
        -- I.4.1. Avant-propos: conseils et conventions
        -- I.4.2. Creation et suppression d'une base de donnees


        -- I.4.1. Avant-propos: conseils et conventions
        -- --------------------------------------------
            -- I.4.1.1. Conseils
            -- I.4.1.2. Conventions
            -- I.4.1.3. Mise en situation


        -- I.4.2. Creation et suppression d'une base de donnees
        -- ----------------------------------------------------
            -- I.4.2.1. Creation
            -- I.4.2.2. Suppression
            -- I.4.2.3. Utilisation d'une base de donnees
            -- I.4.2.4. En resume


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




        -- I.5.2. Introduction aux cles primaires
        -- --------------------------------------
            -- I.5.2.1. Identite
            -- I.5.2.2. Cle primaire
            -- I.5.2.3. Auto-incrementations





        -- I.5.3. Les moteurs de tables
        -- ----------------------------
            -- I.5.3.1. Preciser un moteurs lors de la creation de la table





        -- I.5.4. Syntaxe de CREATE TABLE
        -- ------------------------------
            -- I.5.4.1. Syntaxe 
            -- I.5.4.2. Application: creation de Animal
            -- I.5.4.3. Verifications



        -- I.5.5. Suppression d'une table
        -- ------------------------------
            -- I.5.5.1. En resume


    -- I.6. Modification d'une table
    -- -----------------------------
        -- I.6.1. Syntaxe de la requete
        -- I.6.2. Ajout et suppression d'une colonne
        -- I.6.3. Modification de colonne


        -- I.6.1. Syntaxe de la requete
        -- ----------------------------



        -- I.6.2. Ajout et suppression d'une colonne
        -- -----------------------------------------
            -- I.6.2.1. Ajout
            -- I.6.2.2. Suppression



        -- I.6.3. Modification de colonne
        -- ------------------------------
            -- I.6.3.1. Changement du nom de les colonnes
            -- I.6.3.2. Changement du type de donnees
            -- I.6.3.3. En resume




    -- I.7. Insertion de donnees
    -- -------------------------
        -- I.7.1. Syntaxe de INSERT
        -- I.7.2. Syntaxe alternative de MySQL
        -- I.7.3. Utilisation de fichiers externes
        -- I.7.4. Remplissage de la base


        -- I.7.1. Syntaxe de INSERT
        -- ------------------------
            -- I.7.1.1. Insertion sans preciser les colonnes
            -- I.7.1.2. Insertion en precisant les colonnes
            -- I.7.1.3. Insertion multiple



        -- I.7.2. Syntaxe alternative de MySQL
        -- -----------------------------------
            



        -- I.7.3. Utilisation de fichiers externes
        -- ---------------------------------------
            -- I.7.3.1. Executer des commandes SQL a partir d'un fichier
            -- I.7.3.2. Inserer des donnees a partir d'un fichier formate
        



        -- I.7.4. Remplissage de la base
        -- -----------------------------
            -- I.7.4.1. Execution de commandes SQL
            -- I.7.4.2. LOAD DATA INFILE
            -- I.7.4.3. En resume

    





    -- I.8. Selection de donnees
    -- -------------------------
        -- I.8.1. Syntaxe de SELECT
        -- I.8.2. La clause WHERE
        -- I.8.3. Tri des donnees
        -- I.8.4. Eliminer les doublons
        -- I.8.5. Restreindre les resultats




    
    -- I.9. Elargir la possibilite de la clause WHERE
    -- ----------------------------------------------
        -- I.9.1. Recherche approximative
        -- I.9.2. Recherche dans un intervalle
        -- I.9.3. Set de criteres


        -- I.9.1. Recherche approximative
        -- ------------------------------
            -- I.9.1.1. Sensibilite a la casse
            -- I.9.1.2. Recherche dans le numeriques


        -- I.9.2. Recherche dans un intervalle
        -- -----------------------------------


        -- I.9.3. Set de criteres
        -- ----------------------
            -- I.9.3.1. En resume


    -- I.10. Suppression et modification de donnees
    -- --------------------------------------------
        -- I.10.1. Sauvegarde d'une base de donnees
        -- I.10.2. Suppression
        -- I.10.3. Modification










    