                -- I.1. Introduction
                -- -----------------
                    -- I.1.1. Concept de base
                    -- I.1.2. Presentation succinte de MySQL
                    -- I.1.3. Presentation de ses Concurrents
                    -- I.1.4. Organisation d'une base de donnees


                    -- I.1.1. Concept de base
                    -- ----------------------
                        -- I.1.1.1. Base de donnees
                        -- I.1.1.2. SGBD
                            -- I.1.1.2.1. Le paradigme client-serveur
                        -- I.1.1.3. SGBDR
                        -- I.1.1.4. Le langage SQL


                        -- I.1.1.1. Base de donnees
                        -- ------------------------

                        # Une base de données informatique est
                        # un ensemble de données qui ont été stockées 
                        # sur un support informatique, et organisées
                        # et structurées de manière à pouvoir facilement
                        # consulter et modifier leur contenu.
                        

                        # Une base de données seule ne suffit donc pas,
                        # il est nécessaire d’avoir également :
                        # — un système permettant de gérer cette base;
                        # — un langage pour transmettre des instructions
                        # à la base de données (par l’intermédiaire du système de gestion).
                    
                    
                        -- I.1.1.2. SGBD
                        -- -------------
                            -- I.1.1.2.1. Le paradigme client-serveur
                            
                        # Un Système de Gestion de Base de Données
                        # (SGBD) est un logiciel (ou un ensemble de
                        # logiciels) permettant de manipuler les
                        # données d’une base de données.

                        # MySQL est un système de gestion de bases de données.


                            -- I.1.1.2.1. Le paradigme client-serveur
                            -- --------------------------------------

                            # La plupart des SGBD sont basés sur un modèle
                            # Client - Serveur. C’est-à-dire que la base de
                            # données se trouve sur un serveur qui ne sert 
                            # qu’à ça, et pour interagir avec cette base de données,
                            # il faut utiliser un logiciel ”client” qui va interroger
                            # le serveur et transmettre la réponse que le serveur 
                            # lui aura donnée.

                            # Le serveur peut être installé sur une machine
                            # différente du client ; c’est souvent le cas
                            # lorsque les bases de données sont importantes.

                            # Par conséquent, lorsque vous installez un SGBD basé
                            # sur ce modèle (c’est le cas de MySQL), vous installez 
                            # en réalité deux choses (au moins) : le serveur,
                            # et le client. Chaque requête
                            # (insertion/modification/lecture de données) est faite
                            # par l’intermédiaire du client. Jamais vous ne discuterez 
                            # directement avec le serveur (d’ailleurs, il ne 
                            # comprendrait rien à ce que vous diriez).
                            

                            # Vous avez donc besoin d’un langage pour discuter avec
                            # le client, pour lui donner les requêtes que vous souhaitez
                            # effectuer. Dans le cas de MySQL, ce langage est le SQL

                        
                        
                        -- I.1.1.3. SGBDR
                        -- --------------

                            # Le R de SGBDR signifie ”relationnel”. Un SGBDR est un SGBD
                            # qui implémente la théorie relationnelle.
                            # MySQL implémente la théorie relationnelle ; c’est donc un



                        -- I.1.1.4. Le langage SQL
                        -- -----------------------

                            # Le SQL (Structured Query Language) est un langage
                            # informatique qui permet d’interagir avec des bases
                            # de données relationnelles.


                    -- I.1.2. Presentation succinte de MySQL
                    -- -------------------------------------
                        -- I.1.2.1. Un peu d'histoire
                        -- I.1.2.2. Mise en garde

                        # MySQL est donc un Système de Gestion de Bases de Données
                        # Relationnelles, qui utilise le langage SQL.
                        # C’est un des SGBDR les plus utilisés. Sa popularité est 
                        # due en grande partie au fait qu’il s’agit d’un logiciel


                        # Le logo de MySQL est un dauphin, nommé Sakila suite au 
                        # concours Name the dolphin   


                        -- I.1.2.1. Un peu d'histoire
                        -- --------------------------

                        # Le développement de MySQL commence en 1994 par David Axmark
                        # et Michael Widenius


                        -- I.1.2.2. Mise en garde
                        -- ----------------------
                        # resabe tsy dia mankaiza



                    -- I.1.3. Presentation de ses Concurrents
                    -- --------------------------------------
                        -- I.1.3.1. Oracle database
                        -- I.1.3.2. PostgreSQL
                        -- I.1.3.3 MS Access
                        -- I.1.3.4 SQLite

                        -- Tsy dia ilaina firy ny fahalalana an'ireo


                    -- I.1.4. Organisation d'une base de donnees
                    -- -----------------------------------------
                        # (resabe ty mankaiza)

                        -- I.1.4.1. En resume
                        -- ------------------

                            # — MySQL est un Système de Gestion de Bases de Données 
                            #   Relationnelles (SGBDR) basé sur le modèle client-serveur.
                            # — Le langage SQL est utilisé pour communiquer entre le 
                            #   client et le serveur.
                            # — Dans une base de données relationnelle, les données sont 
                            #   représentées sous forme de tables.