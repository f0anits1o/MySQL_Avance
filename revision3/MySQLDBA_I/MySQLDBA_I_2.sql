
                -- I.2. Installation de MySQL
                -- --------------------------
                    -- (Resa be dia tsy ilaiko)

                    -- I.2.5. Encodage, jeux de caracteres et interclassement
                    -- ------------------------------------------------------
                        -- I.2.5.1. La table ASCII
                        -- I.2.5.2. Jeux de caracteres
                        -- I.2.5.3. L'UTF-8


                        -- I.2.5.1. La table ASCII
                        -- -----------------------
                        
                        # Le processeur d’un ordinateur, c’est-à-dire le composant qui s’occupe de traiter les informations,
                        # exécuter les programmes, etc., ne comprend que les instructions formulées en binaire; il ne
                        # peut que lire une suite d’éléments pouvant être dans deux états : 0 ou 1.

                        # Donc, tous les programmes informatiques que vous pourriez écrire, toutes les instructions SQL,
                        # tous les fichiers, sont in fine traduits en code machine, donc une longue suite de 0 et de 1, pour
                        # pouvoir être lus ou exécutés. Chacun de ces 0 ou 1 est un bit. Ces bits sont regroupés par huit
                        # pour former un octet.

                        # L’ordinateur ne connaît donc pas la notion de caractères. Il ne sait pas ce qu’est un ”A”, ou
                        # un ”è”. Il a donc fallu créer une table de conversion pour traduire les caractères de la langue
                        # courante en une série de bits. La table ASCII était née !

                        # La table ASCII est donc une table de conversion, qui permet de traduire en code binaire
                        # 128 caractères, dont 33 caractères de contrôle (séparateur de fichier, saut de page, ...) et
                        # 95 caractères affichables. Les caractères affichables sont les 26 lettres de l’alphabet, en
                        # majuscules et en minuscules, les 10 chiffres arabes et toute une série de caractères
                        # spéciaux courants ( # , ; , ) , < , ...)



                        -- I.2.5.2. Jeux de caracteres
                        -- ---------------------------
                        # On s’est ensuite rendu compte que ces 128 caractères n’étaient pas suffisants. En effet, ils ne
                        # comprennent pas les caractères accentués (”é”, ”à”). Ils ne comprennent pas non plus tous
                        # les caractères cyrilliques, japonais,etc. On a alors commencé à utiliser le huitième bit. Ce qui
                        # permettait de représenter 128 caractères supplémentaires (donc 28 = 256 en tout). Mais avec
                        # 128 caractères supplémentaires, on n’a pas de quoi représenter tous les caractères qui n’existent
                        # pas dans la table ASCII. On a donc créé plusieurs jeux de caractères différents. Exemples :

                            # — l’ISO 8859-1 (ou latin1) : qui permet de couvrir une bonne partie des langues d’Europe
                            #   occidentale en ajoutant les lettres accentuées aux caractères ASCII de base (”å”, ”é”,
                            #   ”ô”, ”ñ”, ...)
                            # — l’ISO 8859-7 : qui permet de représenter les lettres grecques
                            # — l’ISO 8859-11 : qui contient une bonne partie des glyphes de la langue thaï
                            # — l’ISO 8859-15 : qui est une révision de l’ISO 8859-1, et qui remplace quelques caractères
                            #   peu utilisés par d’autres, plus nécessaires, comme l’euro (”€”)





                        -- I.2.5.3. L'UTF-8
                        -- ----------------

                        # Il restait un petit problème : comment faire des documents (ou autres) qui doivent utiliser
                        # plusieurs jeux de caractères différents ? On a donc créé un nouveau type d’encodage, permettant
                        # de représenter les caractères avec deux octets au lieu d’un. 16 bits donnent 216 = 65536
                        # possibilités. On peut donc, en utilisant deux octets, représenter plus de 65000 caractères. Cet
                        # encodage s’appelle l’UTF-8. Le désavantage d’un tel encodage est évidemment le coût en
                        # mémoire, deux octets prenant plus de place qu’un. Cependant, tous les caractères ne sont pas
                        # codés sur deux octets. S’il s’agit d’un caractère de base de la table ASCII, le 8e bit est à 0, ce
                        # qui indique qu’il n’est codé que sur un octet. Par contre, lorsque le 8e bit est à 1, cela indique
                        # qu’on a affaire à un caractère spécial et qu’il est codé sur deux octets. Donc, en UTF-8, un
                        # ”é” prendra plus de place qu’un ”e” (deux octets au lieu d’un).

