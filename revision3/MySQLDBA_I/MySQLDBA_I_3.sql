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
                                );

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
                     