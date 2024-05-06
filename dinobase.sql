-- Création de la base de données
CREATE DATABASE IF NOT EXISTS dinobase CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Utilisation de la base de données
USE dinobase;

-- Création des tables

-- Table Période
CREATE TABLE IF NOT EXISTS periode (
    id_periode INT PRIMARY KEY AUTO_INCREMENT,
    nom_periode VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table Espèce
CREATE TABLE IF NOT EXISTS espece (
    id_espece INT PRIMARY KEY AUTO_INCREMENT,
    nom_espece VARCHAR(255) NOT NULL,
    type_espece ENUM ('Dinosaure', 'Reptile mammalien', 'Reptile volant', 'Reptile marin') NOT NULL,
    poids_moyen INT,
    longueur_moyenne INT,
    description_espece TEXT,
    img_espece VARCHAR(255) NOT NULL,
    id_periode INT, 
    FOREIGN KEY (id_periode) REFERENCES periode(id_periode)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table Régime alimentaire
CREATE TABLE IF NOT EXISTS regime_alimentaire (
    id_regime INT PRIMARY KEY AUTO_INCREMENT,
    type_regime VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table Fossile
CREATE TABLE IF NOT EXISTS fossile (
    id_fossile INT PRIMARY KEY AUTO_INCREMENT,
    id_espece INT,
    date_decouverte DATE,
    lieu_decouverte VARCHAR(255),
    description_fossile TEXT,
    FOREIGN KEY (id_espece) REFERENCES espece(id_espece)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table Association Espèce-Régime alimentaire
CREATE TABLE IF NOT EXISTS espece_regime (
    id_espece INT,
    id_regime INT,
    PRIMARY KEY (id_espece, id_regime),
    FOREIGN KEY (id_espece) REFERENCES espece(id_espece),
    FOREIGN KEY (id_regime) REFERENCES regime_alimentaire(id_regime)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des valeurs par défaut

INSERT INTO regime_alimentaire (type_regime) VALUES ('Carnivore');
INSERT INTO regime_alimentaire (type_regime) VALUES ('Herbivore');
INSERT INTO regime_alimentaire (type_regime) VALUES ('Omnivore');

INSERT INTO periode (nom_periode) VALUES ('Trias');
INSERT INTO periode (nom_periode) VALUES ('Jurassique');
INSERT INTO periode (nom_periode) VALUES ('Crétacé');
INSERT INTO periode (nom_periode) VALUES ('Permien');

-- Ajout d'animaux
INSERT INTO espece (nom_espece, type_espece, poids_moyen, longueur_moyenne, description_espece, img_espece, id_periode) VALUES
('Stegosaurus', 'Dinosaure', 2500, 9, 'Un dinosaure herbivore avec des plaques dorsales', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Stegosaurus_stenops_Life_Reconstruction.png/640px-Stegosaurus_stenops_Life_Reconstruction.png', 2), -- Jurassique
('Ankylosaurus', 'Dinosaure', 4000, 6, 'Un dinosaure herbivore avec une armure osseuse','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/202007_Ankylosaurus_magniventris.svg/640px-202007_Ankylosaurus_magniventris.svg.png', 3), -- Crétacé
('Dimetrodon', 'Reptile mammalien', 200, 3, 'Un Reptile mammalien à voile du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Dimetrodon_grandis_3D_Model_Reconstruction.png/640px-Dimetrodon_grandis_3D_Model_Reconstruction.png', 4), -- Permien
('Spinosaurus', 'Dinosaure', 7000, 15, 'Un grand dinosaure carnivore à voile','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Spinosaurus_Model_%282%29.png/640px-Spinosaurus_Model_%282%29.png', 3), -- Crétacé
('Edmontosaurus', 'Dinosaure', 4000, 12, 'Un dinosaure herbivore à bec de canard','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Edmontosaurus_BW.jpg/640px-Edmontosaurus_BW.jpg', 3), -- Crétacé
('Brontosaurus', 'Dinosaure', 20000, 22, 'Un immense dinosaure herbivore à long cou','https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Brontosaurus.png/640px-Brontosaurus.png', 2), -- Jurassique
('Triceratops', 'Dinosaure', 8000, 9, 'Un dinosaure herbivore avec trois cornes','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Triceratops_liveDB.jpg/640px-Triceratops_liveDB.jpg', 3), -- Crétacé
('Velociraptor', 'Dinosaure', 15, 2, 'Un petit dinosaure carnivore à griffes en forme de faucille','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Velociraptor_recon.png/640px-Velociraptor_recon.png', 3),
('Deinonychus', 'Dinosaure', 70, 3, 'Un dinosaure carnivore intelligent et agile','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Fred_Wierum_Deinonychus.png/640px-Fred_Wierum_Deinonychus.png', 3),
('Compsognathus', 'Dinosaure', 3, 0.6, 'Un petit dinosaure carnivore','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Compsognathus_BW.jpg/640px-Compsognathus_BW.jpg', 2),
('Tyrannosaurus rex', 'Dinosaure', 7000, 12, 'Un grand dinosaure carnivore','https://upload.wikimedia.org/wikipedia/commons/6/61/202007_Tyrannosaurus_rex.svg', 3),
('Utahraptor', 'Dinosaure', 500, 7, 'Un grand dinosaure carnivore à griffes en forme de faucille','https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Utahraptor_ostrommaysorum_update2.png/640px-Utahraptor_ostrommaysorum_update2.png', 3),
('Baryonyx', 'Dinosaure', 1750, 9.5, 'Un dinosaure carnivore à griffes en forme de crochet','https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Baryonyx_walkeri_restoration.jpg/640px-Baryonyx_walkeri_restoration.jpg', 3),
('Apatosaurus', 'Dinosaure', 30000, 22, 'Un immense dinosaure herbivore à long cou','https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Apatosaurus_louisae_by_durbed.jpg/640px-Apatosaurus_louisae_by_durbed.jpg', 2),
('Brachiosaurus', 'Dinosaure', 70000, 25, 'Un des plus grands dinosaures herbivores','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Brachiosaurus_DB.jpg/640px-Brachiosaurus_DB.jpg', 2),
('Diplodocus', 'Dinosaure', 15000, 33, 'Un dinosaure herbivore à long cou et à longue queue','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/202005_Diplodocus_carnegii.png/640px-202005_Diplodocus_carnegii.png', 2),
('Parasaurolophus', 'Dinosaure', 2500, 10, 'Un dinosaure herbivore à crête creuse','https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Parasaurolophus_UDL.png/640px-Parasaurolophus_UDL.png', 3),
('Pachycephalosaurus', 'Dinosaure', 450, 2, 'Un dinosaure herbivore avec un crâne épais','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Pachycephalosaurus_UDL.png/640px-Pachycephalosaurus_UDL.png', 3),
('Plesiosaurus', 'Reptile marin', 15000, 15, 'Un grand reptile marin carnivore','https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/202006_Plesiosaurus_dolichodeirus.png/640px-202006_Plesiosaurus_dolichodeirus.png', 2),
('Mosasaurus', 'Reptile marin', 15000, 17, 'Un grand reptile marin carnivore','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Mosasaurus_missouriensis_NT.png/640px-Mosasaurus_missouriensis_NT.png', 3),
('Liopleurodon', 'Reptile marin', 250, 6, 'Un très gransd reptile marin carnivore','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Liopleurodon_after_Tarlo.jpg/640px-Liopleurodon_after_Tarlo.jpg', 2),
('Shonisaurus', 'Reptile marin', 20000, 15, 'Un grand reptile marin herbivore','https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Shonisaurus_BW_2.jpg/640px-Shonisaurus_BW_2.jpg', 1),
('Pteranodon', 'Reptile volant', 20, 3, 'Un reptile volant insectivore', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Pteranodon_longiceps_mmartyniuk_wiki.png/640px-Pteranodon_longiceps_mmartyniuk_wiki.png',3),
('Quetzalcoatlus', 'Reptile volant', 250, 10.5, 'Un des plus grands reptiles volants','https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Quetzalcoatlus.jpg/640px-Quetzalcoatlus.jpg', 3),
('Dimorphodon', 'Reptile volant', 1, 1, 'Un petit reptile volant insectivore','https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Dimorphodon2DB.jpg/640px-Dimorphodon2DB.jpg', 1),
('Rhamphorhynchus', 'Reptile volant', 2, 1.5, 'Un reptile volant piscivore','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Rhamphorhynchus_DB.jpg/640px-Rhamphorhynchus_DB.jpg', 2),
('Edaphosaurus', 'Reptile mammalien', 300, 3, 'Un Reptile mammalien herbivore à voile du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Edaphosaurus_NT_small.jpg/640px-Edaphosaurus_NT_small.jpg', 4),
('Lystrosaurus', 'Reptile mammalien', 20, 0.75, 'Un petit Reptile mammalien herbivore à large crâne du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/202012_Lystrosaurus.svg/640px-202012_Lystrosaurus.svg.png', 4),
('Sphenacodon', 'Reptile mammalien', 100, 2, 'Un Reptile mammalien carnivore du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Sphenacodon222.jpg/640px-Sphenacodon222.jpg', 4),
('Varanops', 'Reptile mammalien', 20, 1, 'Un petit Reptile mammalien carnivore du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Varanops_NT_small.jpg/640px-Varanops_NT_small.jpg', 4),
('Ophiacodon', 'Reptile mammalien', 50, 1.5, 'Un Reptile mammalien carnivore du Permien','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Ophiacodon_retroversus.png/640px-Ophiacodon_retroversus.png', 4);

INSERT INTO espece_regime (id_espece, id_regime) VALUES
(1, 2), -- Stegosaurus (herbivore)
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
(31, 1); -- Ophiacodon (carnivore)

INSERT INTO fossile (id_espece, date_decouverte, lieu_decouverte, description_fossile) VALUES
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
(20, '1987-11-23', 'Belgique', 'Dents et fragments de mâchoire');
