-- V.7. Trigers
-- ------------
    -- V.7.1. Principe et usage
    -- V.7.2. Creation des triggers
    -- V.7.3. Suppression des triggers
    -- V.7.4. Exemples
    -- V.7.5. Restrictions


    -- V.7.1. Principe et usage
    -- ------------------------
        -- V.7.1.1. Qu'est-ce qu'un trigget?
        -- V.7.1.2. A quoi sert un trigger?

    
    -- V.7.2. Creation des triggers
        -- V.7.2.1. Syntaxe
        -- V.7.2.2. Regle et convention
        -- V.7.2.3. OLD et NEW
        -- V.7.2.4. Erreur declenchee pendant un TRIGGER


        -- V.7.2.1. Syntaxe
        -- ----------------
            CREATE TRIGGER nom_trigger moment_trigger evenement_trigger
            ON nom_table FOR EACH ROW
            corps_trigger;

            #— CREATE TRIGGER nom_trigger : les triggers ont donc un nom.
            #— moment_trigger evenement_trigger : servent à définir quand et comment le trigger est déclenché.
            #— ON nom_table : c’est là qu’on définit à quelle table le trigger est attaché.
            #— FOR EACH ROW : signifie littéralement ”pour chaque ligne”, sous-entendu ”pour chaque
            #                ligne insérée/supprimée/modifiée” selon ce qui a déclenché le trigger.
            #— corps_trigger : c’est le contenu du trigger. Comme pour les procédures stockées, il
            #               peut s’agir soit d’une seule instruction, soit d’un bloc d’instructions.

        -- V.7.2.1.3. Exemple

            CREATE TRIGGER after_insert_animal AFTER INSERT
            ON Animal FOR EACH ROW
            corps_trigger ;


        -- V.7.2.3. OLD et NEW

            # — OLD : représente les valeurs des colonnes de la ligne traitée avant qu’elle ne soit modifiée par l’événement déclencheur. Ces valeurs peuvent être lues, mais pas modifiées.
            # — NEW : représente les valeurs des colonnes de la ligne traitée après qu’elle a été modifiée
            #         par l’événement déclencheur. Ces valeurs peuvent être lues et modifiées.

            INSERT INTO Adoption (client_id, animal_id, date_reservation, prix, paye)
            VALUES (12, 15, NOW(), 200.00, FALSE);

            UPDATE Adoption
            SET paye = TRUE
            WHERE client_id = 12 AND animal_id = 15;



    -- V.7.3. Suppression des triggers
        DROP TRIGGER nom_trigger;



    -- V.7.4. Exemples
        -- V.7.4.1. Contraintes et verification des donnees
        -- V.7.4.2. Mise a jour d'informations dependant d'autres donnees
        -- V.7.4.3. Historisation


        -- V.7.4.1. Contraintes et verification des donnees
        -- ------------------------------------------------
            -- V.7.4.1.1. Verification du sexe des animaux
            -- -------------------------------------------
                -- Trigger déclenché par l'insertion
                    DELIMITER |
                    CREATE TRIGGER before_insert_animal BEFORE INSERT
                        ON Animal FOR EACH ROW
                    BEGIN
                    -- Instructions
                    END ;

                    -- Trigger déclenché par la modification
                    CREATE TRIGGER before_update_animal BEFORE UPDATE
                    ON Animal FOR EACH ROW
                    BEGIN
                    -- Instructions
                    END ;
                    DELIMITER ;

                    DROP TRIGGER before_update_animal;

                    DELIMITER |
                    CREATE TRIGGER before_update_animal BEFORE UPDATE
                        ON Animal FOR EACH ROW
                        BEGIN
                        IF NEW.sexe IS NOT NULL -- le sexe n'est ni NULL
                            AND NEW.sexe != 'M' -- ni "M"
                            AND NEW.sexe != 'F' -- ni "F"
                        THEN
                            SET NEW.sexe = NULL;
                        END IF;
                    END ;
                    DELIMITER ;

                    # Test
                    UPDATE Animal
                    SET sexe = 'A'
                    WHERE id = 20; -- l'animal 20 est Balou, un mâle
                    
                    SELECT id, sexe, date_naissance, nom
                    FROM Animal
                    WHERE id = 20;
    -- V.7.5. Restrictions
        -- V.7.5.1. En resume