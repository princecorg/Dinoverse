-- **Créer**

-- Ajouter un nouveau dinosaure
INSERT INTO espece (nom_espece, type_espece, poids_moyen, longueur_moyenne, description, img_espece, id_periode)
VALUES ('Deinonychus antirrhopus', 'Dinosaure', 70, 3, 'Un dinosaure carnivore intelligent et agile','', 3);

-- Ajouter un nouveau régime alimentaire
INSERT INTO regime_alimentaire (type_regime) VALUES ('Piscivore');

-- Ajouter une nouvelle période
INSERT INTO periode (nom_periode) VALUES ('Paléogène');

-- Ajouter un nouveau fossile
INSERT INTO fossile (id_espece, date_decouverte, lieu_decouverte, description)
VALUES (9, '1931-05-20', 'Alberta, Canada', 'Squelette partiel avec des griffes en forme de faucille bien conservées');

-- Associer un dinosaure à un régime alimentaire
INSERT INTO espece_regime (id_espece, id_regime) VALUES (9, 3);

-- Associer un dinosaure à une période
INSERT INTO espece_periode (id_espece, id_periode) VALUES (9, 3);

-- **Lire**

-- Sélectionner tous les dinosaures
SELECT * FROM espece;

-- Sélectionner les dinosaures en affichant leur régime alimentaire et leur période

SELECT e.nom_espece, e.type_espece, r.type_regime, p.nom_periode, 
CONCAT(e.longueur_moyenne, ' m') AS taille_metres, 
CONCAT(e.poids_moyen/1000, ' t') AS poids_tonnes
FROM espece e
INNER JOIN espece_regime er ON e.id_espece = er.id_espece
INNER JOIN regime_alimentaire r ON er.id_regime = r.id_regime
INNER JOIN espece_periode ep ON e.id_espece = ep.id_espece
INNER JOIN periode p ON ep.id_periode = p.id_periode;

-- Sélectionner les dinosaures carnivores
SELECT * FROM espece e
INNER JOIN espece_regime er ON e.id_espece = er.id_espece
INNER JOIN regime_alimentaire r ON er.id_regime = r.id_regime
WHERE r.type_regime = 'Carnivore';

-- Sélectionner les dinosaures du Crétacé
SELECT * FROM espece e
INNER JOIN espece_periode ep ON e.id_espece = ep.id_espece
INNER JOIN periode p ON ep.id_periode = p.id_periode
WHERE p.nom_periode = 'Crétacé';

-- Sélectionner les fossiles d'un dinosaure
SELECT * FROM fossile f
INNER JOIN espece e ON f.id_espece = e.id_espece
WHERE e.nom_espece = 'Deinonychus antirrhopus';

-- **Mettre à jour**

-- Modifier le nom d'un dinosaure
UPDATE espece SET nom_espece = 'Velociraptor mongoliensis' WHERE id_espece = 8;

-- Modifier le régime alimentaire d'un dinosaure
UPDATE espece_regime SET id_regime = 2 WHERE id_espece = 9;

-- Modifier la période d'un dinosaure
UPDATE espece_periode SET id_periode = 4 WHERE id_espece = 9;

-- Modifier la description d'un fossile
UPDATE fossile SET description = 'Squelette complet avec des griffes en forme de faucille et des plumes bien conservées' WHERE id_fossile = 5;

-- **Supprimer**

-- Supprimer un dinosaure
DELETE FROM espece WHERE id_espece = 32;

-- Supprimer un régime alimentaire
DELETE FROM regime_alimentaire WHERE id_regime = 4;

-- Supprimer une période
DELETE FROM periode WHERE id_periode = 5;

-- Supprimer un fossile
DELETE FROM fossile WHERE id_fossile = 10;
