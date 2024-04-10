-- Création de la base de données

CREATE DATABASE IF NOT EXISTS dinobase CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Utilisation de la base de données

USE dinobase;

-- Création des tables

-- Table Espèce
CREATE TABLE IF NOT EXISTS espece (
 id_espece INT PRIMARY KEY AUTO_INCREMENT,
 nom_espece VARCHAR(255) NOT NULL,
 type_espece ENUM('Dinosaure', 'Reptile mammalien', 'Reptile volant', 'Reptile marin') NOT NULL,
 poids_moyen INT,
 longueur_moyenne INT,
 description TEXT,
 id_periode INT, 
 FOREIGN KEY (id_periode) REFERENCES periode(id_periode)
);

-- Table Régime alimentaire
CREATE TABLE IF NOT EXISTS regime_alimentaire (
 id_regime INT PRIMARY KEY AUTO_INCREMENT,
 type_regime VARCHAR(255) NOT NULL
);

-- Table Période
CREATE TABLE IF NOT EXISTS periode (
 id_periode INT PRIMARY KEY AUTO_INCREMENT,
 nom_periode VARCHAR(255) NOT NULL
);

-- Table Fossile
CREATE TABLE IF NOT EXISTS fossile (
 id_fossile INT PRIMARY KEY AUTO_INCREMENT,
 id_espece INT,
 date_decouverte DATE,
 lieu_decouverte VARCHAR(255),
 description TEXT,
 FOREIGN KEY (id_espece) REFERENCES espece(id_espece),
 FOREIGN KEY (id_periode) REFERENCES periode(id_periode) -- Ajout de la contrainte de clé étrangère
);

-- Table Association Espèce-Régime alimentaire
CREATE TABLE IF NOT EXISTS espece_regime (
 id_espece INT,
 id_regime INT,
 PRIMARY KEY (id_espece, id_regime),
 FOREIGN KEY (id_espece) REFERENCES espece(id_espece),
 FOREIGN KEY (id_regime) REFERENCES regime_alimentaire(id_regime)
);

-- Insertion des valeurs par défaut

INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Carnivore');
INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Herbivore');
INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Omnivore');

INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Trias');
INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Jurassique');
INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Crétacé');
INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Permien');

-- Ajout d'animaux
INSERT INTO espece (nom_espece, type_espece, poids_moyen, longueur_moyenne, description, id_periode)
VALUES
 ('Stégosaurus', 'Dinosaure', 2500, 9, 'Un dinosaure herbivore avec des plaques dorsales', 2), -- Jurassique
 ('Ankylosaurus', 'Dinosaure', 4000, 6, 'Un dinosaure herbivore avec une armure osseuse', 3), -- Crétacé
 ('Dimétrodon', 'Reptile mammifère', 200, 3, 'Un reptile mammifère à voile du Permien', 4), -- Permien
 ('Spinosauruse', 'Dinosaure', 7000, 15, 'Un grand dinosaure carnivore à voile', 3), -- Crétacé
 ('Edmontosaurus', 'Dinosaure', 4000, 12, 'Un dinosaure herbivore à bec de canard', 3), -- Crétacé
 ('Brontosaurus', 'Dinosaure', 20000, 22, 'Un immense dinosaure herbivore à long cou', 2), -- Jurassique
 ('Tricératops', 'Dinosaure', 8000, 9, 'Un dinosaure herbivore avec trois cornes', 3), -- Crétacé
 ('Velociraptor', 'Dinosaure', 15, 2, 'Un petit dinosaure carnivore à griffes en forme de faucille', 3),
 ('Deinonychus', 'Dinosaure', 70, 3, 'Un dinosaure carnivore intelligent et agile', 3),
 ('Compsognathus', 'Dinosaure', 3, 0.6, 'Un petit dinosaure carnivore', 2),
 ('Tyrannosaurus rex', 'Dinosaure', 7000, 12, 'Un grand dinosaure carnivore', 3),
 ('Utahraptor', 'Dinosaure', 500, 7, 'Un grand dinosaure carnivore à griffes en forme de faucille', 3),
 ('Baryonyx', 'Dinosaure', 1750, 9.5, 'Un dinosaure carnivore à griffes en forme de crochet', 3),
 ('Apatosaurus', 'Dinosaure', 30000, 22, 'Un immense dinosaure herbivore à long cou', 2),
 ('Brachiosaurus', 'Dinosaure', 70000, 25, 'Un des plus grands dinosaures herbivores', 2),
 ('Diplodocus', 'Dinosaure', 15000, 33, 'Un dinosaure herbivore à long cou et à longue queue', 2),
 ('Parasaurolophus', 'Dinosaure', 2500, 10, 'Un dinosaure herbivore à crête creuse', 3),
 ('Pachycephalosaurus', 'Dinosaure', 450, 2, 'Un dinosaure herbivore avec un crâne épais', 3),
 ('Plesiosaurus', 'Reptile marin', 15000, 15, 'Un grand reptile marin carnivore', 2),
 ('Mosasaurus', 'Reptile marin', 15000, 17, 'Un grand reptile marin carnivore', 3),
 ('Liopleurodon', 'Reptile marin', 250, 6, 'Un reptile marin carnivore au long cou', 2),
 ('Shonisaurus', 'Reptile marin', 20000, 15, 'Un grand reptile marin herbivore', 1),
 ('Pteranodon', 'Reptile volant', 20, 3, 'Un reptile volant insectivore', 3),
 ('Quetzalcoatlus', 'Reptile volant', 250, 10.5, 'Un des plus grands reptiles volants', 3),
 ('Dimorphodon', 'Reptile volant', 1, 1, 'Un petit reptile volant insectivore', 1),
 ('Rhamphorhynchus', 'Reptile volant', 2, 1.5, 'Un reptile volant piscivore', 2),
