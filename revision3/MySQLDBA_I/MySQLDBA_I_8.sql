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
