-- v.3 Requetes prepares
-- ---------------------

    -- V.3.1 Variable Utilisateur
    -- V.3.2 Principe et syntaxe des requetes prepares
    -- V.3.3 Usage et utilite


    -- V.3.1 Variable Utilisateur
    -- ---------------------------

        -- V.3.1.1 Definitions
        -- V.3.1.2 Creer et modifier une variable utilisateur
        -- V.3.1.3 Utilisation d'une variable utilisateur
        -- V.3.2.4 Portee des variables utilisateurs


        -- V.3.1.1 Definitions
        -- -------------------

            -- Une variable utilisateur est une variable, définie par l’utilisateur. Les variables utilisateur
            -- MySQL doivent toujours être précédées du signe @.

        
        -- V.3.1.2 Creer et modifier une variable utilisateur
        -- --------------------------------------------------
            -- V.3.1.2.1. SET
            -- V.3.1.2.2. Opérateur d’assignation

            -- V.3.1.2.1. SET
            -- ---------------
                SET @age = 24;

                SET @salut = 'Hello World !', @poids = 7.8; 
                -- On peut créer plusieurs variables en même temps

                SELECT @age, @poids, @salut;

            -- V.3.1.2.2. Opérateur d’assignation
            -- ----------------------------------

                -- Il est également possible d’assigner une valeur à une variable utilisateur directement dans
                --  une requête, en utilisant l’opérateur d’assignation := (n’oubliez pas les : , sinon il s’agit de
                -- l’opérateur de comparaison de valeurs)

                SELECT @age := 32, @poids := 48.15, @perroquet := 4;

        
        -- V.3.1.3 Utilisation d'une variable utilisateur
        -- ----------------------------------------------
            -- V.3.1.3.1. Ce qu’on peut faire
            -- V.3.1.3.2. Ce qu’on ne peut pas faire

            -- V.3.1.3.1. Ce qu’on peut faire
            -- ------------------------------
                SELECT id, sexe, nom, commentaires, espece_id
                FROM Animal
                WHERE espece_id = @perroquet; -- On sélectionne les perroquets 
                
                SET @conversionDollar = 1.31564; -- On crée une variable contenant le taux de conversion des euros en dollars
                
                SELECT prix AS prix_en_euros, -- On sélectionne le prix des races, en euros et en dollars.
                ROUND(prix * @conversionDollar, 2) AS prix_en_dollars, -- En arrondissant à deux décimales
                nom FROM Race;

            -- V.3.1.3.2. Ce qu’on ne peut pas faire
            -- -------------------------------------
                SET @table_clients = 'Client';
                SELECT * FROM @table_clients;

                SET @colonnes = 'id, nom, description';
                
                SELECT @colonnes FROM Race WHERE espece_id = 1;

                -- session 1
                SET @essai = 3;

                -- session 2
                SELECT @essai;


    -- V.3.2 Principe et syntaxe des requetes prepares
    -- -----------------------------------------------
        -- V.3.2.1 Principe
        -- V.3.2.2 Syntaxe

        -- V.3.2.1 Principe
        -- ----------------
            -- V.3.2.1. Principe
            -- V.3.2.2. Syntaxe

            -- V.3.2.1. Principe
            -- ------------------
                SELECT * FROM Client WHERE email = 'truc@email.com';
                SELECT * FROM Client WHERE email = 'machin@email.com';
                SELECT * FROM Client WHERE email = 'bazar@email.com';
                SELECT * FROM Client WHERE email = 'brol@email.com';
                
                -- exemple de syntaxe
                SELECT * FROM Client WHERE email = ? ;
                
                -- V.3.2.1.1. Portée

            -- V.3.2.2. Syntaxe
            -- ----------------
                -- V.3.2.2.1. Préparation d’une requête
                -- V.3.2.2.2. Exécution d’une requête préparée
                -- V.3.2.2.3. Suppression d’une requête préparée

                -- V.3.2.2.1. Préparation d’une requête
                -- ------------------------------------

                    -- Syntaxe
                    PREPARE nom_requete
                    FROM 'requete_preparable';
                    -- fin syntaxe

                    -- Exemple
                    -- Sans paramètre
                    PREPARE select_race
                    FROM 'SELECT * FROM Race';

                    -- Avec un paramètre
                    PREPARE select_client
                    FROM 
                    'SELECT * FROM Client WHERE email = ?';

                    -- Avec deux paramètres
                    PREPARE select_adoption 
                    FROM
                    'SELECT * FROM Adoption WHERE client_id = ? AND animal_id = ?';

                    SET @req = 'SELECT * FROM Race';

                    PREPARE select_race
                    FROM @req;

                    SET @colonne = 'nom';

                    SET @req_animal = CONCAT('SELECT ', @colonne,
                    ' FROM Animal WHERE id = ?');

                    PREPARE select_col_animal
                    FROM @req_animal;

                -- V.3.2.2.2. Exécution d’une requête préparée
                -- -------------------------------------------

                    -- Syntaxe
                    EXECUTE nom_requete [USING @parametre1, @parametre2, ...];
                    -- fin Syntaxe

                    EXECUTE select_race;

                    SET @id = 3;
                    EXECUTE select_col_animal USING @id;

                    SET @client = 2;
                    EXECUTE select_adoption USING @client, @id;

                    SET @email = 'jean.dupont@email.com';

                    EXECUTE select_client USING @email;

                    SET @email = 'marie.boudur@email.com';

                    EXECUTE select_client USING @email;

                    SET @email = 'fleurtrachon@email.com';
                    EXECUTE select_client USING @email;

                    SET @email = 'jeanvp@email.com';
                    EXECUTE select_client USING @email;

                    SET @email = 'johanetpirlouit@email.com';
                    EXECUTE select_client USING @email;
                
                -- V.3.2.2.3. Suppression d’une requête préparée
                -- ---------------------------------------------
                
                    -- Syntaxe
                    DEALLOCATE PREPARE select_race;
                    -- fin syntaxe

    -- V.3.3 Usage et utilite
    -- ----------------------

        -- V.3.3.1. Usage
        -- V.3.3.2. Utilité
        -- V.3.3.3. En résumé

        -- lesona theorie be
