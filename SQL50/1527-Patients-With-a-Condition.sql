SELECT * 
FROM Patients
#starts with it or have it as a word
-- WHERE conditions like '% DIAB1%'  or conditions like 'DIAB1%'
 WHERE conditions REGEXP '(^| )DIAB1'