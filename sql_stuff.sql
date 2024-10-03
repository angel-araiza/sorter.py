SELECT *
FROM [Mint2].[dbo].[Mtg_Log] as m
JOIN (
    SELECT 
        CAST('2023-03-18' AS DATE) AS MeetingDate, 5580 AS MtgID
    UNION ALL
    SELECT 
        CAST('2024-05-12' AS DATE), 3204
    -- Add more rows here as needed
) AS md ON m.MtgID = md.MtgID AND m.MeetingDate = md.MeetingDate;


-- Note for later, It might be useful if I could access these SQL databases from terminal, rahter than using Microsoft SQL Server

--------------------------------------------------------------------------------------------------------------
list_v5 code
--------------------------------------------------------------------------------------------------------------

SELECT a.NAME AS OrgName,p.MTGNAME AS ProfileName, o.STARTYEAR, o.STARTMONTH, o.STARTDATE, o.CITY AS CityMetIn, o.STPROV, o.HQHOTEL, o.PEAKRMSRES, o.REGATTEND, o.REC_ID AS LeadID, d.MtgID AS DenverLostProfileMintID, d.MeetingYear AS DenverLostLeadYear, o.deleted, o.LeadCreateDate, o.DateDefinite, o.CanceledDate, o.PoolSource
FROM [Mint2].[dbo].[Mtg_Log] AS o
JOIN Mint2.dbo.Mtg AS p ON o.MtgID = p.REC_ID
JOIN Mint2.dbo.Org AS a ON p.OrgID = a.REC_ID
JOIN (
    SELECT
    CAST('2023' AS DATE) AS MeetingYear, 5580 AS MtgID
UNION ALL
SELECT
    CAST('2026' AS DATE) AS MeetingYear, 110693 AS MtgID
    -- I added in all the code from python script ----

) AS d ON o.MtgID = d.MtgID AND o.STARTYEAR = d.MeetingYear
WHERE o.deleted = '0'


------------------------------------------
-- Code to get Key Classifications as well
  
SELECT a.NAME AS OrgName,k.description AS KeyClassification, p.MTGNAME AS ProfileName, o.STARTYEAR, o.STARTDATE, o.CITY AS CityMetIn, o.STPROV, o.HQHOTEL, o.PEAKRMSRES, o.REGATTEND, o.REC_ID AS LeadID, d.MtgID AS DenverLostProfileMintID, d.MeetingYear AS DenverLostLeadYear, o.deleted, o.LeadCreateDate, o.DateDefinite, o.CanceledDate, o.PoolSource
FROM [Mint2].[dbo].[Mtg_Log] AS o
JOIN Mint2.dbo.Mtg AS p ON o.MtgID = p.REC_ID
JOIN Mint2.dbo.Org AS a ON p.OrgID = a.REC_ID
JOIN
  (
    SELECT Code, KeyId
	FROM Mint2.dbo.KeyNTEE
	UNION ALL
	SELECT Code, KeyId
	FROM Mint2.dbo.KeyNAICS
  ) AS combined ON a.NTEE = combined.Code OR a.NAICS = combined.Code
JOIN Mint2.dbo.KeyClassifications AS k ON combined.KeyId = k.id
JOIN (
    SELECT
    CAST('2023' AS DATE) AS MeetingYear, 5580 AS MtgID
UNION ALL
SELECT
    CAST('2026' AS DATE) AS MeetingYear, 110693 AS MtgID
    -- I added in all the code from python script ----

) AS d ON o.MtgID = d.MtgID AND o.STARTYEAR = d.MeetingYear
WHERE o.deleted = '0'
