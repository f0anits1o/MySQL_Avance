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
