-- Active: 1715559647452@@127.0.0.1@3306@fiompina
-- V.4. Procedures stockees
-- ------------------------

    -- V.4.1. Creation et utilisation
    -- V.4.2. Les parametres d'une procedure stockee
    -- V.4.3. Supression d'une PROCEDURE
    -- v.4.4. Avantages, incovenients et usage des procedures stockees


    -- V.4.1. Creation et utilisation
    -- ------------------------------

        -- V.4.1.1. Procedure avec une seule requete
        -- V.4.1.2. Procedure avec une bloc d'instructions
        -- V.4.1.3. Delimiteur
        -- V.4.1.4. Creation d'une procedure stockee
        -- V.4.1.5. Utilisation d'une procedute stockee

        -- V.4.1.1. Procedure avec une seule requete
        -- -----------------------------------------

            -- Syntaxe
            CREATE PROCEDURE afficher_races_requete() -- pas de paramètres dans les parenthèses
            
            SELECT id, nom, espece_id, prix FROM Race;

            call afficher_races_requete;
            -- Fin syntaxe


        -- V.4.1.2. Procedure avec une bloc d'instructions
        -- -----------------------------------------------

            --syntaxe
                BEGIN
                -- Série d'instructions
                END;
            -- fin syntaxe

            CREATE PROCEDURE afficher_races_bloc() -- pas de paramètres dans les parenthèses
                BEGIN
                SELECT id, nom, espece_id, prix FROM Race;
                END;

            
        -- V.4.1.3. Delimiteur
        -- -------------------

            -- DEFINITION

            -- Ce qu’on appelle délimiteur, c’est tout simplement (par défaut), le caractère ; .

            -- FIN DEFINITION

            -- Pour changer le délimiteur, il suffit d’utiliser cette commande :
            DELIMITER |

            SELECT 'test'|

            SELECT * FROM animal|


        -- V.4.1.4. Creation d'une procedure stockee
            
            DELIMITER |
            -- On change le délimiteur

            CREATE PROCEDURE afficher_races() -- toujours pas de paramètres, toujours des parenthèses 
                BEGIN
                    SELECT id, nom, espece_id, prix
                    FROM Race; -- Cette fois, le ; ne nous embêtera pas 
                END; -- TSY MITOVY AMIN'NY PDF
            -- Et on termine bien sûr la commande CREATE PROCEDURE par notre nouveau délimiteur


        -- V.4.1.5. Utilisation d'une procedute stockee

        CALL afficher_races()| -- le délimiteur est toujours | !!!


    -- V.4.2. Les parametres d'une PROCEDURE
    -- -------------------------------------

        -- V.4.2.1. Sens du parametres (in, out et inout)
        -- V.4.2.2. Syntaxe (lesona be)
        -- V.4.2.3. Exemples

        
        -- V.4.2.3. Exemples
        -- -----------------

            -- V.4.2.3.1. Procédure avec un seul paramètre entrant
            -- V.4.2.3.2. Procédure avec deux paramètres, un entrant et un sortant
            -- V.4.2.3.3. Procédure avec deux paramètres, un entrant et un entrant-sortant


            -- V.4.2.3.1. Procédure avec un seul paramètre entrant
            -- ---------------------------------------------------

                DELIMITER |
                -- Facultatif si votre délimiteur est toujours |

                CREATE PROCEDURE afficher_race_selon_espece (IN p_espece_id INT)
                -- Définition du paramètre p_espece_id
                    BEGIN
                        SELECT id, nom, espece_id, prix
                        FROM Race
                        WHERE espece_id = p_espece_id; -- Utilisation du paramètre
                    END;
                DELIMITER ; -- On remet le délimiteur par défaut


                CALL afficher_race_selon_espece(1);
                SET @espece_id := 2;
                CALL afficher_race_selon_espece(@espece_id);


            -- V.4.2.3.2. Procédure avec deux paramètres, un entrant et un sortant
            -- -------------------------------------------------------------------

                DELIMITER |

                CREATE PROCEDURE compter_races_selon_espece (p_espece_id INT, OUT p_nb_races INT)
                BEGIN
                SELECT COUNT(*) INTO p_nb_races
                FROM Race
                WHERE espece_id = p_espece_id;
                END ;

                DELIMITER ;


                SELECT id, nom INTO @var1, @var2
                FROM Animal
                WHERE id = 7;

                SELECT @var1, @var2;

                CALL compter_races_selon_espece (2, @nb_races_chats);

                SELECT @nb_races_chats;

            -- V.4.2.3.3. Procédure avec deux paramètres, un entrant et un entrant-sortant
            -- ---------------------------------------------------------------------------

            DELIMITER |

            CREATE PROCEDURE calculer_prix (IN p_animal_id INT, INOUT p_prix DECIMAL(7,2))
            BEGIN
            SELECT p_prix + COALESCE(Race.prix, Espece.prix) INTO p_prix
            FROM Animal
            INNER JOIN Espece ON Espece.id = Animal.espece_id
            LEFT JOIN Race ON Race.id = Animal.race_id
            WHERE Animal.id = p_animal_id;
            END;

            DELIMITER ;

            SET @prix = 0; -- On initialise @prix à 0

            CALL calculer_prix (13, @prix); -- Achat de Rouquine
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (24, @prix); -- Achat de Cartouche
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (42, @prix); -- Achat de Bilba
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (75, @prix); -- Achat de Mimi
            SELECT @prix AS total;

    -- V.4.3. Supression d'une PROCEDURE
            DROP PROCEDURE afficher_races;

    -- v.4.4. Avantages, incovenients et usage des procedures stockees
    -- ---------------------------------------------------------------
        
        -- V.4.4.1. Avantages(lesona be)
        -- V.4.4.2. Syntaxe  (lesona be)
        -- V.4.4.3. Exemples (lesona be)
        -- V.4.4.4. En RESUME (lesona be)


