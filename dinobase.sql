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
 ('Stegosaurus', 'Dinosaure', 2500, 9, 'Un dinosaure herbivore avec des plaques dorsales', 2), -- Jurassique
 ('Ankylosaurus', 'Dinosaure', 4000, 6, 'Un dinosaure herbivore avec une armure osseuse', 3), -- Crétacé
 ('Dimetrodon', 'Reptile mammifère', 200, 3, 'Un reptile mammifère à voile du Permien', 4), -- Permien
 ('Spinosauruse', 'Dinosaure', 7000, 15, 'Un grand dinosaure carnivore à voile', 3), -- Crétacé
 ('Edmontosaurus', 'Dinosaure', 4000, 12, 'Un dinosaure herbivore à bec de canard', 3), -- Crétacé
 ('Brontosaurus', 'Dinosaure', 20000, 22, 'Un immense dinosaure herbivore à long cou', 2), -- Jurassique
 ('Triceratops', 'Dinosaure', 8000, 9, 'Un dinosaure herbivore avec trois cornes', 3), -- Crétacé
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
 ('Edaphosaurus', 'Reptile mammifère', 300, 3, 'Un reptile mammifère herbivore à voile du Permien', 4),
 ('Lystrosaurus', 'Reptile mammifère', 20, 0.75, 'Un petit reptile mammifère herbivore à large crâne du Permien', 4),
 ('Sphenacodon', 'Reptile mammifère', 100, 2, 'Un reptile mammifère carnivore du Permien', 4),
 ('Varanops', 'Reptile mammifère', 20, 1, 'Un petit reptile mammifère carnivore du Permien', 4),
 ('Ophiacodon', 'Reptile mammifère', 50, 1.5, 'Un reptile mammifère carnivore du Permien', 4),

INSERT INTO espece_regime (id_espece, id_regime) VALUES
(1, 2), -- Stégosaurus (herbivore)
(2, 2), -- Ankylosaurus (herbivore)
(3, 3), -- Dimétrodon (omnivore)
(4, 1), -- Spinosaurus (carnivore)
(5, 2), -- Edmontosaurus (herbivore)
(6, 2), -- Brontosaurus (herbivore)
(7, 2), -- Tricératops (herbivore)
(8, 1), -- Velociraptor (carnivore)
(9, 1), -- Deinonychus (carnivore)
(10, 1), -- Compsognathus (carnivore)
(11, 1), -- Tyrannosaurus rex (carnivore)
(12, 1), -- Utahraptor (carnivore)
(13, 1), -- Baryonyx (carnivore)
(14, 2), -- Apatosaurus (herbivore)
(15, 2), -- Brachiosaurus (herbivore)
(16, 2), -- Diplodocus (herbivore)
(17, 2), -- Parasaurolophus (herbivore)
(18, 2), -- Pachycephalosaurus (herbivore)
(19, 1), -- Plesiosaurus (carnivore)
(20, 1), -- Mosasaurus (carnivore)
(21, 1), -- Liopleurodon (carnivore)
(22, 2), -- Shonisaurus (herbivore)
(23, 3), -- Pteranodon (insectivore)
(24, 3), -- Quetzalcoatlus (insectivore)
(25, 3), -- Dimorphodon (insectivore)
(26, 3), -- Rhamphorhynchus (piscivore)
(27, 2), -- Edaphosaurus (herbivore)
(28, 2), -- Lystrosaurus (herbivore)
(29, 1), -- Sphenacodon (carnivore)
(30, 1), -- Varanops (carnivore)
(31, 1), -- Ophiacodon (carnivore)

INSERT INTO espece_periode (id_espece, id_periode) VALUES
(1, 2), -- Stégosaurus (Jurassique)
(2, 3), -- Ankylosaurus (Crétacé)
(3, 4), -- Dimétrodon (Permien)
(4, 3), -- Spinosaurus (Crétacé)
(5, 3), -- Edmontosaurus (Crétacé)
(6, 2), -- Brontosaurus (Jurassique)
(7, 3), -- Tricératops (Crétacé)
(8, 3), -- Velociraptor (Crétacé)
(9, 3), -- Deinonychus (Crétacé)
(10, 2), -- Compsognathus (Jurassique)
(11, 3), -- Tyrannosaurus rex (Crétacé)
(12, 3), -- Utahraptor (Crétacé)
(13, 3), -- Baryonyx (Crétacé)
(14, 2), -- Apatosaurus (Jurassique)
(15, 2), -- Brachiosaurus (Jurassique)
(16, 2), -- Diplodocus (Jurassique)
(17, 3), -- Parasaurolophus (Crétacé)
(18, 3), -- Pachycephalosaurus (Crétacé)
(19, 2), -- Plesiosaurus (Jurassique)
(20, 3), -- Mosasaurus (Crétacé)
(21, 2), -- Liopleurodon (Jurassique)
(22, 1), -- Shonisaurus (Trias)
(23, 3), -- Pteranodon (Crétacé)
(24, 3), -- Quetzalcoatlus (Crétacé)
(25, 1), -- Dimorphodon (Trias)
(26, 2), -- Rhamphorhynchus (Jurassique)
(27, 4), -- Edaphosaurus (Permien)
(28, 4), -- Lystrosaurus (Permien)
(29, 4), -- Sphenacodon (Permien)
(30, 4), -- Varanops (Permien)
(31, 4), -- Ophiacodon (Permien)

