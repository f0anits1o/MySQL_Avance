-- V.6. Gestion d'erreurs, curseurs et utilisations avancees:
-- ----------------------------------------------------------

    -- V.6.1. Gestion des erreurs
    -- V.6.2. Curseurs
    -- V.6.3. Utilisation avancees des blocs d'instructions

    
    -- V.6.1. Gestion des erreurs
    -- --------------------------
        -- V.6.1.1. Creation d'un gestionnaire d'erreure
        -- V.6.1.2. Definition de l'erreur geree
        -- V.6.1.3. Declarer plusieurs gestionnaires, gerer plusieurs erreurs par gestionnaire
        
            DELIMITER |
            CREATE PROCEDURE ajouter_adoption(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
            BEGIN
                DECLARE v_prix DECIMAL(7,2);

                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                LEFT JOIN Race ON Race.id = Animal.race_id
                WHERE Animal.id = p_animal_id;

                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);


                SELECT 'Adoption correctement ajoutée' AS message;
            END;
            DELIMITER ;

            # Plusieurs erreurs sont susceptibles de se déclencher selon les paramètres passés à cette procédure

            # Exemple 1 : le client n’existe pas.
            SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;

            CALL ajouter_adoption(18, 6, @date_adoption, 1);


            # Exemple 2 : l’animal a déjà été adopté.
            CALL ajouter_adoption(12, 21, @date_adoption, 1);


            # Exemple 3 : l’animal n’existe pas, v_prix est donc NULL
            CALL ajouter_adoption(12, 102, @date_adoption, 1);

#####################################################################################################
#                                                                                                   #
#               Pour empêcher ces erreurs intempestives, deux solutions :                           #
#                                                                                                   #
#    — vérifier chaque paramètre pouvant poser problème (p_animal_id et p_client_id ne sont         #
#    pas NULL et correspondent à quelque chose dans les tables Animal et Client, p_animal_id        #
#    ne correspond pas à un animal déjà adopté, etc.) ;                                             #
#                                                                                                   #
#    — utiliser un gestionnaire d’erreur : c’est ce que nous allons apprendre à faire ici           #
#                                                                                                   #
#####################################################################################################


        -- V.6.1.1. Creation d'un gestionnaire d'erreure
        -- ---------------------------------------------
            -- Syntaxe:
                DECLARE { EXIT | CONTINUE } HANDLER FOR { numero_erreur | {
                            SQLSTATE identifiant_erreur } | condition }
                instruction -- ou bloc d'instructions

######################################################################################################
#                                                                                                    #
#   — Un gestionnaire d’erreur définit une instruction (une seule !), ou un bloc d’instructions      #
#       (BEGIN ... END;), qui va être exécuté en cas d’erreur correspondant au gestionnaire.         #
#   — Tous les gestionnaires d’erreur doivent être déclarés au même endroit : après la déclaration   #
#       des variables locales, mais avant les instructions de la procédure.                          #
#   — Un gestionnaire peut, soit provoquer l’arrêt de la procédure (EXIT), soit faire reprendre      #
#       la procédure après avoir géré l’erreur (CONTINUE).                                           #
#   — On peut identifier le type d’erreur que le gestionnaire va reconnaître de trois manières       #
#       différentes : un numéro d’erreur, un identifiant, ou une CONDITION.                          #
#   — Un gestionnaire étant défini grâce au mot-clé DECLARE, comme les variables locales, il a       #
#       exactement la même portée que celles-ci.                                                     #
#                                                                                                    #
######################################################################################################


            -- Exemples : ces deux procédures enregistrent une adoption en gérant les erreurs, l’une arrêtant
            -- la procédure, l’autre relançant celle-ci :

                DELIMITER |
                CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                BEGIN
                    DECLARE v_prix DECIMAL(7,2);
                    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
                        BEGIN
                            SELECT 'Une erreur est survenue...';
                            SELECT 'Arrêt prématuré de la procédure';
                        END;

                        SELECT 'Début procédure';

                            SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                            FROM Animal
                            INNER JOIN Espece ON Espece.id = Animal.espece_id
                            LEFT JOIN Race ON Race.id = Animal.race_id
                            WHERE Animal.id = p_animal_id;

                            INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                            VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                        SELECT 'Fin procédure' AS message;
                END;

                
                CREATE PROCEDURE ajouter_adoption_continue(IN p_client_id INT, IN
                p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)

                BEGIN
                    DECLARE v_prix DECIMAL(7,2);
                    DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Une erreur est survenue...';

                        SELECT 'Début procédure';

                            SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                            FROM Animal
                            INNER JOIN Espece ON Espece.id = Animal.espece_id
                            LEFT JOIN Race ON Race.id = Animal.race_id
                            WHERE Animal.id = p_animal_id;

                            INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                            VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                        SELECT 'Fin procédure';
                END;
                DELIMITER ;

                SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;               
                CALL ajouter_adoption_exit(18, 6, @date_adoption, 1);
                CALL ajouter_adoption_continue(18, 6, @date_adoption, 1);



        -- V.6.1.2. Definition de l'erreur geree
        -- -------------------------------------
            -- V.6.1.2.1. Identifiant ou numéro MySQL de l’erreur
            -- V.6.1.2.2. Utilisation d’une CONDITION
            -- V.6.1.2.3. Conditions prédéfinies


            -- V.6.1.2.1. Identifiant ou numéro MySQL de l’erreur
            -- --------------------------------------------------
                DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Une erreur est survenue...';

#####################################################################################################
#                                                                                                   #
#              Le message d’erreur est constitué de trois éléments importants :                     #
#                                                                                                   #
#       — 1062 : le numéro d’erreur MySQL (un nombre entier) ;                                      #
#       — 23000 : l’identifiant de l’état SQL (une chaîne de 5 caractères) ;                        #
#       — Duplicate entry ’21’ for key ’ind_uni_animal_id’ : un message donnant le détail de        #
#           l’erreur.                                                                               #
#                                                                                                   #
#   Identifiant de l’état SQL:                                                                      #
#   Dans la procédure ajouter_adoption_continue(), c’est l’identifiant de l’état SQL ('23000')      #
#   qui a été utilisé. Il s’agit d’une chaîne de 5 caractères, renvoyée par le serveur au client    # 
#   pour informer de la réussite ou de l’échec d’une instruction. Un identifiant commençant par     #
#   '00' par exemple, signifie que l’instruction a réussi.                                          #
#                                                                                                   #
#   '23000' est l’identifiant renvoyé lorsqu’une erreur concernant une contrainte                   #
#   (NOT NULL, unicité, clé primaire ou secondaire,…) a été déclenchée.                             #
#   Pour utiliser cet identifiant dans un gestionnaire d’erreur, il faut le faire précéder          #
#   de SQLSTATE                                                                                     #
#                                                                                                   #
#    Numéro d’erreur MySQL                                                                          #
#    Pour utiliser le numéro d’erreur SQL, par contre, il suffit de l’indiquer, comme un nombre     #
#    entier                                                                                       #
#                                                                                                   #
#####################################################################################################

                DECLARE CONTINUE HANDLER FOR 1062 SELECT 'Une erreur est survenue...';


                -- V.6.1.2.2. Utilisation d’une CONDITION
                -- --------------------------------------
                    -- Syntaxe:
                    DECLARE nom_erreur CONDITION FOR { SQLSTATE identifiant_SQL |numero_erreur_MySQL };
    
                    -- Exemple : réécrivons la procédure ajouter_adoption_exit() en nommant l’erreur 
    
                    DROP PROCEDURE ajouter_adoption_exit;
                    DELIMITER |
                    CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                    BEGIN
                        DECLARE v_prix DECIMAL(7,2);
    
                        DECLARE violation_contrainte CONDITION FOR SQLSTATE '23000'; -- On nomme l'erreur dont l'identifiant est 23000 "violation_contrainte"
    
                        DECLARE EXIT HANDLER FOR violation_contrainte -- Le gestionnaire sert donc à intercepter
                            BEGIN -- les erreurs de type "violation_contrainte"
                                SELECT 'Une erreur est survenue...';
                                SELECT 'Arrêt prématuré de la procédure';
                            END;
    
                            SELECT 'Début procédure';
    
                                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                                FROM Animal
                                INNER JOIN Espece ON Espece.id = Animal.espece_id
                                LEFT JOIN Race ON Race.id = Animal.race_id
                                WHERE Animal.id = p_animal_id;
    
                                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);
    
                            SELECT 'Fin procédure';
                    END;
                    DELIMITER ;  
    
    
                -- V.6.1.2.3. Conditions prédéfinies:
                -- ----------------------------------

######################################################################################################## 
#                                                                                                      #
#                       Il existe trois conditions prédéfinies dans MySQL :                            #
#                                                                                                      #
#     — SQLWARNING : tous les identifiants SQL commençant par ’01’, c’est-à-dire les avertissements    #
#                    et les notes ;                                                                    #
#     — NOT FOUND : tous les identifiants SQL commençant par ’02’, et que nous verrons plus en         #
#                   détail avec les curseurs ;                                                         #
#     — SQLEXCEPTION : tous les identifiants SQL ne commençant ni par ’00’, ni par ’01’, ni par        #
#                      ’02’, donc les erreurs.                                                         #
#                                                                                                      #
######################################################################################################## 

                    -- Exemple : réécriture de la procédure ajouter_adoption_exit(), de façon à ce que le gestionnaire
                    --           intercepte toutes les erreurs SQL.

                    DROP PROCEDURE ajouter_adoption_exit;
                    DELIMITER |
                    CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                    BEGIN
                        DECLARE v_prix DECIMAL(7,2);

                        DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                            BEGIN -- les erreurs de type "violation_contrainte"
                                SELECT 'Une erreur est survenue...';
                                SELECT 'Arrêt prématuré de la procédure';
                            END;

                            SELECT 'Début procédure';

                                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                                FROM Animal
                                INNER JOIN Espece ON Espece.id = Animal.espece_id
                                LEFT JOIN Race ON Race.id = Animal.race_id
                                WHERE Animal.id = p_animal_id;

                                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                            SELECT 'Fin procédure';
                    END;
                    DELIMITER ;


        -- V.6.1.3. Declarer plusieurs gestionnaires, gerer plusieurs erreurs par gestionnaire
        -- -----------------------------------------------------------------------------------
            # Exemple : toujours avec la procédure ajouter_adoption_exit(). On peut l’écrire en détaillant
            # différentes erreurs possibles, puis en ajoutant un gestionnaire général qui reconnaîtra les SQLEX
            # CEPTION et les SQLWARNING, pour tous les cas qu’on ne traite pas dans les autres gestionnaires.
            # Ce qui donne:

        DROP PROCEDURE ajouter_adoption_exit;
        DELIMITER |
        CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
        BEGIN
            DECLARE v_prix DECIMAL(7,2);

            DECLARE violation_cle_etrangere CONDITION FOR 1452; -- Déclaration des CONDITIONS
            DECLARE violation_unicite CONDITION FOR 1062;

            DECLARE EXIT HANDLER FOR violation_cle_etrangere -- Déclaration du gestionnaire pour
                BEGIN -- les erreurs de clés étrangères
                    SELECT 'Erreur : violation de clé étrangère.';
                END;

                DECLARE EXIT HANDLER FOR violation_unicite -- Déclaration du gestionnaire pour
                BEGIN -- les erreurs d'index unique
                    SELECT 'Erreur : violation de contrainte d''unicité.';
                END;

                DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING -- Déclaration du gestionnaire pour
                BEGIN -- toutes les autres erreurs ou avertissements
                    SELECT 'Une erreur est survenue...';
                END;

                SELECT 'Début procédure';

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                SELECT 'Fin procédure';
        END;
        DELIMITER ;

        SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;

        CALL ajouter_adoption_exit(12, 3, @date_adoption, 1); -- Violation unicité (animal 3 est déjà adopté)
        
        CALL ajouter_adoption_exit(133, 6, @date_adoption, 1); -- Violation clé étrangère (client 133 n'existe pas)
        
        CALL ajouter_adoption_exit(NULL, 6, @date_adoption, 1); -- Violation de contrainte NOT NULL


    -- V.6.2. Curseurs
    -- ---------------
        -- V.6.2.1. Syntaxe
        -- V.6.2.2. Restrictions
        -- V.6.2.3. Parcourir intelligement tous les resultats d'un curseur

#########################################################################################
#                                                                                       #
#               Quatre étapes sont nécessaires pour utiliser un curseur.                #
#                                                                                       #
#    — Déclaration du curseur : avec une instruction DECLARE.                           #
#    — Ouverture du curseur : on exécute la requête SELECT du curseur et on stocke      #
#        le résultat dans celui-ci.                                                     #
#                                                                                       #
#    — Parcours du curseur : on parcourt une à une les lignes.                          #
#    — Fermeture du curseur.                                                            #
#                                                                                       #
#########################################################################################




        -- V.6.2.1. Syntaxe
        -- ----------------
            -- V.6.2.1.1. Déclaration du curseur
            -- V.6.2.1.2. Ouverture et fermeture du curseur
            -- V.6.2.1.3. Parcours du curseur

            -- V.6.2.1.1. Déclaration du curseur:
            -- ---------------------------------
                DECLARE nom_curseur CURSOR FOR requete_select;

                -- Exemple :
                DECLARE curseur_client CURSOR
                FOR SELECT *
                FROM Client;


            -- V.6.2.1.2. Ouverture et fermeture du curseur
            -- --------------------------------------------
                OPEN nom_curseur;
                -- Parcours du curseur et instructions diverses
                CLOSE nom_curseur;


            -- V.6.2.1.3. Parcours du curseur
            -- ------------------------------
                FETCH nom_curseur INTO variable(s);

                -- Exemple : la procédure suivante parcourt les deux premières lignes de la table Client
                -- avec un curseur.
                
                DELIMITER |
                CREATE PROCEDURE parcours_deux_clients()
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);

                    DECLARE curs_clients CURSOR
                    FOR SELECT nom, prenom -- Le SELECT récupère deux colonnes
                    FROM Client
                    ORDER BY nom, prenom; -- On trie les clients par ordre alphabétique

                    OPEN curs_clients; -- Ouverture du curseur

                        FETCH curs_clients INTO v_nom, v_prenom; -- On récupère la première ligne et on assigne les valeur               récupérées à nos variables locales
                        SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Premier client';

                        FETCH curs_clients INTO v_nom, v_prenom; -- On récupère la seconde ligne et on assigne les valeur               -- récupérées à nos variables locales
                        SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Second client';

                    CLOSE curs_clients; -- Fermeture du curseur
                END;
                DELIMITER ;

                CALL parcours_deux_clients();



        -- V.6.2.2. Restrictions:
        -- ---------------------
            # jereo ny lesona fa faibless MySQL io.



        -- V.6.2.3. Parcourir intelligement tous les resultats d'un curseur
        -- ----------------------------------------------------------------

            -- V.6.2.3.1. Condition d’arrêt
            -- V.6.2.3.2. Le cas des booléens chez MySQL
            

            -- V.6.2.3.1. Condition d’arrêt
            -- ----------------------------
                 DELIMITER |
                CREATE PROCEDURE test_condition(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    OPEN curs_clients;

                        LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;
                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;

                CALL test_condition('Houtsiplou');

                # Exemple : la procédure test_condition2() ci-dessous fait la même chose que test_condition(),
                # mais inclut le gestionnaire d’erreur et le IF nécessaires pour stopper la boucle dès que toutes les
                # lignes sélectionnées ont été parcourues :             DELIMITER |
                
                Delimiter |
                CREATE PROCEDURE test_condition2(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);
                    DECLARE fin TINYINT DEFAULT 0; -- Variable locale utilisée pour stopper la boucle

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1; -- Gestionnaire d'erreur pour la condition NOT FOUND

                    OPEN curs_clients;

                        loop_curseur: LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;

                            IF fin = 1 THEN -- Structure IF pour quitter la boucle à la fin des résultats
                                LEAVE loop_curseur;
                            END IF;

                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;

                CALL test_condition2('Houtsiplou');
                CALL test_condition2('Bruxelles');



            -- V.6.2.3.2. Le cas des booléens chez MySQL
            -- -----------------------------------------
                SELECT 1 = 1, 1 = 2; -- 1 = 1 est vrai, bien sûr. Contrairement à 1 = 2 (si si !                DROP PROCEDURE test_condition2;
                

                DROP PROCEDURE test_condition2;

                DELIMITER |
                CREATE PROCEDURE test_condition2(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);
                    DECLARE fin BOOLEAN DEFAULT FALSE; -- On déclare fin comme un BOOLEAN, avec FALSE pour défaut

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE; -- On utilise TRUE au lieu de 1

                    OPEN curs_clients;

                        loop_curseur: LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;

                            IF fin THEN -- Plus besoin de "= 1"
                            LEAVE loop_curseur;
                            END IF;

                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;



    -- V.6.3. Utilisation avancees des blocs d'instructions
    -- ----------------------------------------------------
        -- V.6.3.1. Utiliser des variables utilisateur dans un bloc d'instructions
        -- V.6.3.2. Utiliser un procedure dans un bloc
        -- V.6.3.3. Transactions et gestion d'erreurs
        -- V.6.3.4. Preparer une requete dans un bloc d'instructions
        -- V.6.3.5. En resumee


        -- V.6.3.1. Utiliser des variables utilisateur dans un bloc d'instructions
        -- -----------------------------------------------------------------------
        DELIMITER |
        CREATE PROCEDURE test_vu()
        BEGIN
            SET @var = 15;
        END;
        DELIMITER ;

        SELECT @var; -- @var n'existe pas encore, on ne l'a pas définie
        CALL test_vu(); -- On exécute la procédure
        SELECT @var; -- @var vaut maintenant 15, même en dehors de la procédure, puisqu'elle est définie partout dans la session

        SET @var = 'Bonjour';
        CALL test_vu();
        SELECT @var; -- Donne 15 !  


        -- V.6.3.2. Utiliser un procedure dans un bloc
        -- -------------------------------------------

            DELIMITER |
            CREATE PROCEDURE carre(INOUT p_nb FLOAT) SET p_nb = p_nb * p_nb;
                    CREATE PROCEDURE surface_cercle(IN p_rayon FLOAT, OUT p_surface FLOAT)
            BEGIN
                CALL carre(p_rayon);
                        SET p_surface = p_rayon * PI();
            END;
            DELIMITER ;
                    CALL surface_cercle(1, @surface); -- Donne environ pi (3,14...)
            SELECT @surface;
            CALL surface_cercle(2, @surface); -- Donne environ 12,57...
            SELECT @surface;


        -- V.6.3.3. Transactions et gestion d'erreurs
        -- ----------------------------------------                  
            DELIMITER |
            
            CREATE PROCEDURE adoption_deux_ou_rien(p_client_id INT, p_animal_id_1 INT, p_animal_id_2 INT)
            BEGIN
                DECLARE v_prix DECIMAL(7,2);

                DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK; -- Gestionnaire qui annule la transaction et termine la procédure

                START TRANSACTION;

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id_1;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id_1, p_client_id, CURRENT_DATE(), CURRENT_DATE(), v_prix, TRUE);

                    SELECT 'Adoption animal 1 réussie' AS message;

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id_2;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id_2, p_client_id, CURRENT_DATE(), CURRENT_DATE(), v_prix, TRUE);

                    SELECT 'Adoption animal 2 réussie' AS message;

                COMMIT;
            END;
            DELIMITER ;

            CALL adoption_deux_ou_rien(2, 43, 55); -- L'animal 55 a déjà été adopté


        -- V.6.3.4. Preparer une requete dans un bloc d'instructions
        -- ---------------------------------------------------------

            -- Exemple : la procédure suivante ajoute la ou les clauses que l’on veut à une simple requête
            DELIMITER |
            CREATE PROCEDURE select_race_dynamique(p_clause VARCHAR(255))
            BEGIN
                SET @sql = CONCAT('SELECT nom, description FROM Race ', p_clause);

                PREPARE requete FROM @sql;
                EXECUTE requete;
            END;
            DELIMITER ;

            CALL select_race_dynamique('WHERE espece_id = 2'); -- Affichera les races de chats
            CALL select_race_dynamique('ORDER BY nom LIMIT 2'); -- Affichera les deux premières races par ordre alphabétique de leur nom
