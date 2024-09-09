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
