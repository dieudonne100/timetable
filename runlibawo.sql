
SET MARKUP HTML ON
SPOOL ONSET NULL'_'
SET TAB OFF
SET NEWPAGE NONE 
SET TRIMS OFF
 SET NUMWIDTH 50
SPOOL DB_teT.HTML
CREATE VIEW sstockemplois AS 
SELECT DISTINCT C.codeCours, T.jourCoursDate,C.VOLUMEH,
T.tranche ||'heures' as tranche_horaire,
FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON  T.crsCodeCours=cls.crsCodeCours
JOIN Classe ce
ON ce.specialiteNomSpec=cls.classSpecialiteNomspec
INNER JOIN ClassePeriodeacademique ca
ON C.periodeAcademiqueIdTrim=ca.PERIODEACADEMIQUEIDTRIM
JOIN Etudiantdeclasse et 
on cls.crsCodeCours=et.COURCODECOURS
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
JOIN ETUDIANT E
ON E.MATRICULE=et.ETUDIANTMATRICULE
WHERE et.ETUDIANTMATRICULE=&Matricule AND PASSWORD=ora_hash(&Password)
 T.jourCoursDate 
IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi') ;
