-- Création de la base de données

CREATE DATABASE IF NOT EXISTS dinobase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilisation de la base de données

USE dinobase;

-- Création des tables

CREATE TABLE IF NOT EXISTS espece (
  id_espece INT PRIMARY KEY AUTO_INCREMENT,
  nom_espece VARCHAR(255) NOT NULL,
  poids_moyen INT,
  longueur_moyenne INT,
  description TEXT
);

CREATE TABLE IF NOT EXISTS regime_alimentaire (
  id_regime INT PRIMARY KEY AUTO_INCREMENT,
  type_regime VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS periode (
  id_periode INT PRIMARY KEY AUTO_INCREMENT,
  nom_periode VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS fossile (
  id_fossile INT PRIMARY KEY AUTO_INCREMENT,
  id_espece INT,
  date_decouverte DATE,
  lieu_decouverte VARCHAR(255),
  description TEXT,
  FOREIGN KEY (id_espece) REFERENCES espece(id_espece)
);

CREATE TABLE IF NOT EXISTS espece_regime (
  id_espece INT,
  id_regime INT,
  PRIMARY KEY (id_espece, id_regime),
  FOREIGN KEY (id_espece) REFERENCES espece(id_espece),
  FOREIGN KEY (id_regime) REFERENCES regime_alimentaire(id_regime)
);

CREATE TABLE IF NOT EXISTS espece_periode (
  id_espece INT,
  id_periode INT,
  PRIMARY KEY (id_espece, id_periode),
  FOREIGN KEY (id_espece) REFERENCES espece(id_espece),
  FOREIGN KEY (id_periode) REFERENCES periode(id_periode)
);

-- Insertion des valeurs par défaut

INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Carnivore');
INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Herbivore');
INSERT INTO IF NOT EXISTS regime_alimentaire (type_regime) VALUES ('Omnivore');

INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Trias');
INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Jurassique');
INSERT INTO IF NOT EXISTS periode (nom_periode) VALUES ('Crétacé');
