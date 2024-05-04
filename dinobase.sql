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
 img_espece VARCHAR(255) NOT NULL,
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
 ('Stegosaurus', 'Dinosaure', 2500, 9, 'Un dinosaure herbivore avec des plaques dorsales','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Stegosaurus_stenops_Life_Reconstruction.png/640px-Stegosaurus_stenops_Life_Reconstruction.png', 2), -- Jurassique
 ('Ankylosaurus', 'Dinosaure', 4000, 6, 'Un dinosaure herbivore avec une armure osseuse','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/202007_Ankylosaurus_magniventris.svg/640px-202007_Ankylosaurus_magniventris.svg.png', 3), -- Crétacé
 ('Dimetrodon', 'Reptile mammifère', 200, 3, 'Un reptile mammifère à voile du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Dimetrodon_grandis_3D_Model_Reconstruction.png/640px-Dimetrodon_grandis_3D_Model_Reconstruction.png', 4), -- Permien
 ('Spinosaurus', 'Dinosaure', 7000, 15, 'Un grand dinosaure carnivore à voile','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Spinosaurus_Model_%282%29.png/640px-Spinosaurus_Model_%282%29.png', 3), -- Crétacé
 ('Edmontosaurus', 'Dinosaure', 4000, 12, 'Un dinosaure herbivore à bec de canard','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Edmontosaurus_BW.jpg/640px-Edmontosaurus_BW.jpg', 3), -- Crétacé
 ('Brontosaurus', 'Dinosaure', 20000, 22, 'Un immense dinosaure herbivore à long cou','https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Brontosaurus.png/640px-Brontosaurus.png', 2), -- Jurassique
 ('Triceratops', 'Dinosaure', 8000, 9, 'Un dinosaure herbivore avec trois cornes','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Triceratops_liveDB.jpg/640px-Triceratops_liveDB.jpg', 3), -- Crétacé
 ('Velociraptor', 'Dinosaure', 15, 2, 'Un petit dinosaure carnivore à griffes en forme de faucille','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Velociraptor_recon.png/640px-Velociraptor_recon.png', 3),
 ('Deinonychus', 'Dinosaure', 70, 3, 'Un dinosaure carnivore intelligent et agile','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Fred_Wierum_Deinonychus.png/640px-Fred_Wierum_Deinonychus.png', 3),
 ('Compsognathus', 'Dinosaure', 3, 0.6, 'Un petit dinosaure carnivore','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Compsognathus_BW.jpg/640px-Compsognathus_BW.jpg', 2),
 ('Tyrannosaurus rex', 'Dinosaure', 7000, 12, 'Un grand dinosaure carnivore','https://upload.wikimedia.org/wikipedia/commons/6/61/202007_Tyrannosaurus_rex.svg', 3),
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
 ('Ophiacodon', 'Reptile mammifère', 50, 1.5, 'Un reptile mammifère carnivore du Permien', 4)

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
(31, 1) -- Ophiacodon (carnivore)

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
(31, 4) -- Ophiacodon (Permien)

INSERT INTO fossile (id_espece, date_decouverte, lieu_decouverte, description) VALUES
(1, '1877-01-01', 'Colorado, USA', 'Squelette complet avec des plaques dorsales bien conservées'),
(1, '1922-05-15', 'Wyoming, USA', 'Crâne et plaques dorsales fragmentaires'),
(2, '1908-10-24', 'Alberta, Canada', 'Squelette complet avec une armure osseuse bien conservée'),
(2, '1947-07-08', 'Montana, USA', 'Crâne et armure osseuse fragmentaires'),(7, '1889-07-20', 'Wyoming, USA', 'Crâne complet avec trois cornes bien conservées'),
(7, '1993-04-12', 'Montana, USA', 'Squelette partiel avec des cornes fragmentaires'),
(11, '1902-05-14', 'Montana, USA', 'Squelette partiel avec un crâne bien conservé'),
(11, '1991-08-21', 'Dakota du Sud, USA', 'Dents et fragments de mâchoire'),
(8, '1924-06-03', 'Mongolie', 'Squelette complet avec des griffes en forme de faucille bien conservées'),
(8, '1993-10-11', 'Chine', 'Crâne et membres fragmentaires'),
(9, '1964-08-15', 'Montana, USA', 'Squelette partiel avec des griffes en forme de faucille bien conservées'),
(9, '1974-02-25', 'Wyoming, USA', 'Crâne et membres fragmentaires'),
(19, '1824-09-01', 'Angleterre', 'Squelette complet bien conservé'),
(19, '1998-03-07', 'France', 'Crâne et membres fragmentaires'),
(20, '1822-10-12', 'Pays-Bas', 'Squelette partiel avec un crâne bien conservé'),
(20, '1987-11-23', 'Belgique', 'Dents et fragments de mâchoire')



