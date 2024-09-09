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
