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