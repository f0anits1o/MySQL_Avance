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

