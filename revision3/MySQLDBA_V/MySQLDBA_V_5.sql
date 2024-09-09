-- V.5. STRUCTURER SES INSTRUCTIONS
-- --------------------------------

    -- v.5.1. Bloc d'instructions et variable
    -- V.5.2. Structures conditionnelles
    -- V.5.3. Boucles


    -- v.5.1. Bloc d'instructions et variable
    -- ---------------------------------------
        -- V.5.1.1 Blocks d'instructions
        -- V.5.1.2 Variables LOCALes
    
        -- V.5.1.1 Blocks d'instructions
        -- -----------------------------
            -- Syntaxe: structure imbriquer
            BEGIN
                SELECT 'Bloc d''instructions principal';

                BEGIN
                    SELECT
                        'Bloc d''instructions 2, imbriqué dans le bloc principal';
                    BEGIN
                        SELECT
                            'Bloc d''instructions 3, imbriqué dans le bloc d''instructions 2';
                    END;
                END;

                BEGIN
                    SELECT
                    'Bloc d''instructions 4, imbriqué dans le bloc principal';
                END;
            END;

        -- V.5.1.2 Variables LOCALes
        -- -------------------------
            -- V.5.1.2.1. Déclaration d’une variable locale
            -- V.5.1.2.2. Portée des variables locales dans un bloc d’instruction


            -- V.5.1.2.1. Déclaration d’une variable locale
                -- Syntaxe:
                DECLARE nom_variable type_variable [DEFAULT valeur_defaut];

                -- La déclaration d’une variable locale se fait avec l’instruction DECLARE.

                -- Exemple : voici une procédure stockée qui donne la date d’aujourd’hui et de demain

                DELIMITER |
                CREATE PROCEDURE aujourdhui_demain ()
                BEGIN
                    DECLARE v_date DATE DEFAULT CURRENT_DATE(); 
                    -- On déclare une variable locale et on lui met une valeur par défaut
                    

                    SELECT DATE_FORMAT(v_date, '%W %e %M %Y') AS Aujourdhui;

                    SET v_date = v_date + INTERVAL 1 DAY; -- On change la valeur de la variable locale
                    SELECT DATE_FORMAT(v_date, '%W %e %M %Y') AS Demain;
                END;
                DELIMITER ;

                SET lc_time_names = 'fr_FR';
                CALL aujourdhui_demain();


            -- V.5.1.2.2. Portée des variables locales dans un bloc d’instruction
            -- ------------------------------------------------------------------

            -- Les variables locales n’existent que dans le bloc d’instructions dans lequel elles ont été déclarées.
            -- Dès que le mot-clé END est atteint, toutes les variables locales du bloc sont détruites.


            -- Exemple 1 porte variables:

            DELIMITER |
            CREATE PROCEDURE test_portee1()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                SELECT 'Principal' AS Bloc;
                SELECT v_test1, v_test2;

            END;
            DELIMITER ;

            CALL test_portee1();
            

            DELIMITER |
            CREATE PROCEDURE test_portee12()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                SELECT 'Principal' AS Bloc;
                SELECT v_test1;--, v_test2;

            END;
            DELIMITER ;

            CALL test_portee12();


            -- Exemple 2 porte variables:
            DELIMITER |
            CREATE PROCEDURE test_portee2()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                BEGIN
                    SELECT 'Principal' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

            END;
            DELIMITER ;

            CALL test_portee2();

            -- À nouveau, v_test1, déclarée dans le bloc principal,
            -- existe dans les deux blocs imbriqués. 
            -- Par contre, v_test2 n’existe que dans le bloc imbriqué
            -- dans lequel elle est déclarée.

            -- Exemple 3 porte variables:
            DELIMITER |
            CREATE PROCEDURE test_portee3()
            BEGIN
                DECLARE v_test INT DEFAULT 1;

                SELECT v_test AS 'Bloc principal';

                BEGIN
                    DECLARE v_test INT DEFAULT 0;

                    SELECT v_test AS 'Bloc imbriqué';
                    SET v_test = 2;
                    SELECT v_test AS 'Bloc imbriqué après modification';
                END;

                SELECT v_test AS 'Bloc principal';
            END ;
            DELIMITER ;

            CALL test_portee3();
            
    -- V.5.2. Structures conditionnelles
    -- ---------------------------------
        -- V.5.2.1. La structure IF
        -- V.5.2.2. La structure CASE
        -- V.5.2.3. Utiliser une structure conditionnelle directement dans une requetep


        -- V.5.2.1. La structure IF
        -- ------------------------
            -- V.5.2.1.1. Le cas le plus simple : si la condition est vraie, alors on exécute ces instructions
            -- V.5.2.1.2.  Deuxième cas : si ... alors, sinon
            -- V.5.2.1.3. Troisième et dernier cas : plusieurs conditions alternatives

            -- Syntaxe:
            IF condition THEN instructions
                [ELSEIF autre_condition THEN instructions
                [ELSEIF ...]]
                [ELSE instructions]
            END IF;
            -- Fin Syntaxe

            -- V.5.2.1.1. Le cas le plus simple : si la condition est vraie, alors on exécute ces instructions
            -- -----------------------------------------------------------------------------------------------
                IF condition THEN
                    instructions
                END IF;

                -- Exemple:
                DELIMITER |
                CREATE PROCEDURE est_adopte(IN p_animal_id INT)
                BEGIN
                    DECLARE v_nb INT DEFAULT 0; -- On crée une variable locale

                    SELECT COUNT(*) INTO v_nb -- On met le nombre de lignes correspondant à l'animal
                    FROM Adoption -- dans Adoption dans notre variable locale
                    WHERE animal_id = p_animal_id;

                    IF v_nb > 0 THEN -- On teste si v_nb est supérieur à 0 (donc si l'animal a été adopté)
                    SELECT 'J''ai déjà été adopté !';
                    END IF; -- Et on n'oublie surtout pas le END IF et le ; final
                END ;
                DELIMITER ;

                CALL est_adopte(3);
                CALL est_adopte(28);

                -- Seul le premier appel à la procédure va afficher 'J''ai déjà été adopté !', puisque l’animal
                -- 3 est présent dans la table Adoption, contrairement à l’animal 28.


            -- V.5.2.1.2.  Deuxième cas : si ... alors, sinon
            -- ----------------------------------------------

            -- exemple:  la procédure suivante affiche 'Je suis né avant 2010' ou 'Je suis né après
            -- 2010', selon la date de naissance de l’animal transmis en paramètre.

            DELIMITER |
            CREATE PROCEDURE avant_apres_2010(IN p_animal_id INT)
            BEGIN
                DECLARE v_annee INT;

                SELECT YEAR(date_naissance) INTO v_annee
                FROM Animal
                WHERE id = p_animal_id;

                IF v_annee < 2010 THEN
                    SELECT 'Je suis né avant 2010' AS naissance;
                ELSE -- Pas de THEN
                    SELECT 'Je suis né après 2010' AS naissance;
                END IF; -- Toujours obligatoire

            END ;
            DELIMITER ;

            CALL avant_apres_2010(34); -- Né le 20/04/2008
            CALL avant_apres_2010(62); --  Né le 13/02/2012

            -- Tandremo: ELSE ne doit pas être suivi de THEN.


            -- V.5.2.1.3. Troisième et dernier cas : plusieurs conditions alternatives
            -- -----------------------------------------------------------------------
             DELIMITER |
            CREATE PROCEDURE message_sexe(IN p_animal_id INT)
            BEGIN
                DECLARE v_sexe VARCHAR(10);

                SELECT sexe INTO v_sexe
                FROM Animal
                WHERE id = p_animal_id;

                IF (v_sexe = 'F') THEN -- Première possibilité
                SELECT 'Je suis une femelle !' AS sexe;
                ELSEIF (v_sexe = 'M') THEN -- Deuxième possibilité
                SELECT 'Je suis un mâle !' AS sexe;
                ELSE -- Défaut
                SELECT 'Je suis en plein questionnement existentiel...' AS sexe;
                END IF;
            END;
            DELIMITER ;

            CALL message_sexe(8); -- Mâle
            CALL message_sexe(6); -- Femelle

            CALL message_sexe(9); -- Ni l'un ni l'autre
            

        -- V.5.2.2. La structure CASE
        -- --------------------------
            -- V.5.2.2.1. Première syntaxe : conditions d’égalité
            -- V.5.2.2.2. Seconde syntaxe : toutes conditions
            

            # Deux syntaxes sont possibles pour utiliser CASE.

            -- V.5.2.2.1. Première syntaxe : conditions d’égalité
            -- --------------------------------------------------

                CASE valeur_a_comparer
                    WHEN possibilite1 THEN instructions
                    [WHEN possibilite2 THEN instructions] ...
                    [ELSE instructions]
                END CASE;

                -- Exemple:
                DELIMITER |
                CREATE PROCEDURE message_sexe2(IN p_animal_id INT)
                BEGIN
                    DECLARE v_sexe VARCHAR(10);

                    SELECT sexe INTO v_sexe
                    FROM Animal
                    WHERE id = p_animal_id;

                    CASE v_sexe
                        WHEN 'F' THEN -- Première possibilité
                            SELECT 'Je suis une femelle !' AS sexe;
                        WHEN 'M' THEN -- Deuxième possibilité
                            SELECT 'Je suis un mâle !' AS sexe;
                        ELSE -- Défaut
                            SELECT 'Je suis en plein questionnement existentiel...' AS sexe;
                    END CASE;
                END;
                DELIMITER ;

                CALL message_sexe2(8); -- Mâle
                CALL message_sexe2(6); -- Femelle

                CALL message_sexe2(9);


            -- V.5.2.2.2. Seconde syntaxe : toutes conditions
            -- ----------------------------------------------

                CASE
                    WHEN condition THEN instructions
                    [WHEN condition THEN instructions] ...
                    [ELSE instructions]
                END CASE


                -- Exemple : on reprend la procédure avant_apres_2010(), qu’on réécrit avec CASE, et en donnant
                -- une possibilité en plus. De plus, on passe le message en paramètre OUT pour changer un peu.

                DELIMITER |
                CREATE PROCEDURE avant_apres_2010_case (IN p_animal_id INT, OUT p_message VARCHAR(100))
                BEGIN
                    DECLARE v_annee INT;

                    SELECT YEAR(date_naissance) INTO v_annee
                    FROM Animal
                    WHERE id = p_animal_id;

                    CASE
                        WHEN v_annee < 2010 THEN
                            SET p_message = 'Je suis né avant 2010.';
                        WHEN v_annee = 2010 THEN
                            SET p_message = 'Je suis né en 2010.';
                        ELSE
                        SET p_message = 'Je suis né après 2010.';
                    END CASE;
                END ;
                DELIMITER ;

                CALL avant_apres_2010_case(59, @message);
                SELECT @message;

                CALL avant_apres_2010_case(62, @message);
                SELECT @message;

                CALL avant_apres_2010_case(63, @message);
                SELECT @message;


        -- V.5.2.3. Utiliser une structure conditionnelle directement dans une requete 
        -- ---------------------------------------------------------------------------

        # exemple 1:
            SELECT id, nom, CASE
                WHEN sexe = 'M' THEN 'Je suis un mâle !'
                WHEN sexe = 'F' THEN 'Je suis une femelle !'
                ELSE 'Je suis en plein questionnement existentiel...'
                END AS message
            FROM Animal
            WHERE id IN (9, 8, 6);

        # exemple 2:
            SELECT nom, IF(sexe = 'M', 'Je suis un mâle', 'Je ne suis pas un mâle') AS sexe
            FROM Animal # exemple 2:
            WHERE espece_id = 5;



    -- V.5.3. Boucles
    -- --------------
        -- V.5.3.1. La boucle WHILE
        -- V.5.3.2. La boucle REPEAT
        -- V.5.3.3. Donner une label a  une boucle
        -- V.5.3.4. Les instructions LEAVES et ITERATES
        -- V.5.3.5. La boucle LOOP
        -- V.5.3.6. En resumee
        
        # Une boucle est une structure qui permet de répéter plusieurs fois une série d’instructions. Il
        # existe trois types de boucles en MySQL : WHILE, LOOP et REPEAT.

        
        -- V.5.3.1. La boucle WHILE
        -- ------------------------
            -- Syntaxe
            WHILE condition DO -- Attention de ne pas oublier le DO, erreur classique
                instructions
            END WHILE

            -- Exemple : la procédure suivante affiche les nombres entiers de 1 à p_nombre (passé en
            -- paramètre).

            DELIMITER |
            CREATE PROCEDURE compter_jusque_while(IN p_nombre INT)
            BEGIN
                DECLARE v_i INT DEFAULT 1;

                WHILE v_i <= p_nombre DO
                    SELECT v_i AS nombre;

                    SET v_i = v_i + 1; -- À ne surtout pas oublier, sinon la condition restera vraie
                END WHILE;
            END ;
            DELIMITER ;    

            CALL compter_jusque_while(3);


        -- V.5.3.2. La boucle REPEAT
        -- -------------------------
            # La boucle REPEAT travaille en quelque sorte de manière opposée à WHILE, puisqu’elle exécute
            # des instructions de la boucle jusqu’à ce que la condition donnée devienne vraie.


            # Exemple : voici la même procédure écrite avec une boucle REPEAT

            DELIMITER |
            CREATE PROCEDURE compter_jusque_repeat(IN p_nombre INT)
            BEGIN       
                DECLARE v_i INT DEFAULT 1;

                REPEAT
                    SELECT v_i AS nombre;

                    SET v_i = v_i + 1; -- À ne surtout pas oublier, sinon la condition restera vraie
                UNTIL v_i > p_nombre END REPEAT;
            END ;
            DELIMITER ;

            CALL compter_jusque_repeat(3);


            -- Condition fausse dès le départ, on ne rentre pas dans la boucle
            CALL compter_jusque_while(0);

            -- Condition fausse dès le départ, on rentre quand même une fois dans la boucle
            CALL compter_jusque_repeat(0);


        -- V.5.3.3. Donner une label a  une boucle
        -- ---------------------------------------
            
            -- Syntaxe

            -- Boucle WHILE
            -- ------------
            super_while: WHILE condition DO -- La boucle a pour label "super_while"
            instructions
            END WHILE super_while; -- On ferme en donnant le label de la boucle (facultatif)

            -- Boucle REPEAT
            -- -------------
            repeat_genial: REPEAT -- La boucle s'appelle "repeat_genial"
            instructions
            UNTIL condition END REPEAT; -- Cette fois, on choisit de ne pas faire référence au label lors de la fermeture
            
            -- Bloc d'instructions
            -- -------------------
            bloc_extra: BEGIN -- Le bloc a pour label "bloc_extra"
            instructions
            END bloc_extra;

            #####################################################################################################
            #                                                                                                   #
            #                               Mais en quoi cela peut-il être utile ?                              #   
            #                                                                                                   #
            # D’une part, cela peut permettre de clarifier le code lorsqu’il y a beaucoup de boucles et de      #
            # blocs d’instructions imbriqués. D’autre part, il est nécessaire de donner un label aux boucles et #
            #aux blocs d’instructions pour lesquels on veut pouvoir utiliser les instructions ITERATE et LEAVE. #
            #                                                                                                   #
            #####################################################################################################



        -- V.5.3.4. Les instructions LEAVES et ITERATES
        -- --------------------------------------------

            -- V.5.3.4.1. LEAVE : quitter la boucle ou le bloc d’instructions
            -- V.5.3.4.2. ITERATE : déclencher une nouvelle itération de la boucle


            -- V.5.3.4.1. LEAVE : quitter la boucle ou le bloc d’instructions
            -- --------------------------------------------------------------

                -- Syntaxe:
                LEAVE label_structure;

                -- Exemple : cette procédure incrémente de 1, et affiche, un nombre entier passé en paramètre.
                -- Et cela, 4 fois maximum. Mais si l’on trouve un multiple de 10, la boucle s’arrête.

                DELIMITER |
                CREATE PROCEDURE test_leave1(IN p_nombre INT)
                BEGIN

                    DECLARE v_i INT DEFAULT 4;

                    SELECT 'Avant la boucle WHILE';

                    while1: WHILE v_i > 0 DO

                        SET p_nombre = p_nombre + 1; -- On incrémente le nombre de 1

                        IF p_nombre%10 = 0 THEN -- Si p_nombre est divisible par 10,
                            SELECT 'Stop !' AS 'Multiple de 10';
                            LEAVE while1; -- On quitte la boucle WHILE.
                        END IF;

                        SELECT p_nombre; -- On affiche p_nombre
                        SET v_i = v_i - 1; -- Attention de ne pas l'oublier

                END WHILE while1;

                SELECT 'Après la boucle WHILE';
                END;
                DELIMITER ;

                CALL test_leave1(3); -- La boucle s'exécutera 4 fois

                CALL test_leave1(8); -- La boucle s'arrêtera dès qu'on atteint 10


                # Exemple : voici la même procédure. Cette fois-ci un multiple de 10 provoque l’arrêt de toute
                # la procédure, pas seulement de la boucle WHILE.

                DELIMITER |
                CREATE PROCEDURE test_leave2(IN p_nombre INT)
                corps_procedure: BEGIN -- On donne un label au bloc d'instructions principal
                    DECLARE v_i INT DEFAULT 4;

                    SELECT 'Avant la boucle WHILE';
                    while1: WHILE v_i > 0 DO
                        SET p_nombre = p_nombre + 1; -- On incrémente le nombre de 1
                            IF p_nombre%10 = 0 THEN -- Si p_nombre est divisible par 10,
                            SELECT 'Stop !' AS 'Multiple de 10';
                        LEAVE corps_procedure; -- je quitte la procédure.
                        END IF;

                        SELECT p_nombre; -- On affiche p_nombre
                        SET v_i = v_i - 1; -- Attention de ne pas l'oublier
                    END WHILE while1;

                    SELECT 'Après la boucle WHILE';
                    END;
                DELIMITER ;

                CALL test_leave2(8);


                # Exemple : la procédure suivante affiche les nombres de 4 à 1, en précisant s’ils sont pairs. Sauf
                # pour le nombre 2, pour lequel une instruction LEAVE empêche l’affichage habituel.


                DELIMITER |
                CREATE PROCEDURE test_leave3()
                BEGIN
                DECLARE v_i INT DEFAULT 4;

                WHILE v_i > 0 DO

                    IF v_i%2 = 0 THEN
                        if_pair: BEGIN
                            IF v_i = 2 THEN -- Si v_i vaut 2
                                LEAVE if_pair; -- On quitte le bloc "if_pair", ce qui revient à quitter la structure IF v_i%2 = 0
                            END IF;
                            SELECT CONCAT(v_i, ' est pair') AS message;
                        END if_pair;
                    ELSE
                        if_impair: BEGIN
                            SELECT CONCAT(v_i, ' est impair') AS message;
                        END if_impair;
                    END IF;

                    SET v_i = v_i - 1;
                END WHILE;
                END;
                DELIMITER ;

                CALL test_leave3();


            -- V.5.3.4.2. ITERATE : déclencher une nouvelle itération de la boucle
            -- -------------------------------------------------------------------

                # Exemple : la procédure suivante affiche les nombres de 1 à 3, avec un message avant le IF et
                # après le IF. Sauf pour le nombre 2, qui relance une itération de la boucle dans le IF.

                DELIMITER |
                CREATE PROCEDURE test_iterate()
                BEGIN
                 DECLARE v_i INT DEFAULT 0;

                 boucle_while: WHILE v_i < 3 DO
                    SET v_i = v_i + 1;
                    SELECT v_i, 'Avant IF' AS message;

                    IF v_i = 2 THEN
                    ITERATE boucle_while;

                    END IF;
                    SELECT v_i, 'Après IF' AS message; -- Ne sera pas exécuté pour v_i = 2
                 END WHILE;
                END ;
                DELIMITER ;

                CALL test_iterate();


        -- V.5.3.5. La boucle LOOP
        -- -----------------------

            -- Syntaxe
            [label:] LOOP
            instructions
            END LOOP [label]

            # Exemple : à nouveau une procédure qui affiche les nombres entiers de 1 à p_nombre.

            DELIMITER |
            CREATE PROCEDURE compter_jusque_loop(IN p_nombre INT)
            BEGIN
                DECLARE v_i INT DEFAULT 1;

                boucle_loop: LOOP
                    SELECT v_i AS nombre;
    
                    SET v_i = v_i + 1;
    
                    IF v_i > p_nombre THEN
                    LEAVE boucle_loop;
                    END IF;
                END LOOP;
            END ;
            DELIMITER ;

            CALL compter_jusque_loop(3);
