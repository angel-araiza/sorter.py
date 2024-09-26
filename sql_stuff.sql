SELECT 
    m.MtgID,
    m.MeetingDate,
    md.MeetingDate AS DerivedMeetingDate
FROM 
    Meetings m
JOIN (
    SELECT 
        CAST('2023-03-18' AS DATE) AS MeetingDate, 5580 AS MtgID
    UNION ALL
    SELECT 
        CAST('2024-05-12' AS DATE), 3204
    -- Add more rows here as needed
) AS md ON m.MtgID = md.MtgID AND m.MeetingDate = md.MeetingDate;

-- I think this the code I will need to run, 
-- Next, I need to format the data from the excel sheet with python to be my code for SQL
-- Note for later, It might be useful if I could access these SQL databases from terminal, rahter than using Microsoft SQL Server

--------------------------------------------------------------------------------------------------------------
list_v4 code
--------------------------------------------------------------------------------------------------------------

SELECT a.NAME AS OrgName,p.MTGNAME AS ProfileName, o.STARTYEAR, o.STARTDATE, o.CITY AS CityMetIn, o.STPROV, o.HQHOTEL, o.PEAKRMSRES, o.REGATTEND, o.REC_ID AS LeadID, d.MtgID AS DenverLostProfileMintID, d.MeetingYear AS DenverLostLeadYear, o.deleted, o.LeadCreateDate, o.DateDefinite, o.CanceledDate, o.PoolSource
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

