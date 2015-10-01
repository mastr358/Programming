-- aktualizuje se středisko, pokud je středisko CZ a země dodání SK
-- RefZeme = 83 = slovensko

UPDATE dbo.OBJ 
SET RefStr = 
	(CASE 
		-- rb-store
		WHEN RefZeme = 83 AND RefStr = 1
			THEN 10
			
		-- puma
		WHEN RefZeme = 83 AND RefStr = 21
			THEN 22
			
		-- a-mania
		WHEN RefZeme = 83 AND RefStr = 4
			THEN 9
			
		-- ringit
		WHEN RefZeme = 83 AND RefStr = 32
			THEN 33
			
		-- total-store
		WHEN RefZeme = 83 AND RefStr = 6
			THEN 11
	END)
WHERE RefZeme = 83 AND RefStr IN (1, 4, 6, 21, 32)     -- musí tam být tento select jinak to smaže hodnoty u všech které jsou správně 