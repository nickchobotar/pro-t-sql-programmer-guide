-- Listing 12-18

SELECT Resume.query('declare namespace ns =
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
for $m in /ns:Resume
where $m/ns:Education/ns:Edu.Level[. = "Bachelor" ] 
return <Name> 
   { 
     data(($m/ns:Name/ns:Name.Last)[1]), 
     data(($m/ns:Name/ns:Name.First)[1]), 
     data(($m/ns:Name/ns:Name.Middle)[1]) 
   } </Name>')
FROM HumanResources.JobCandidate; 
GO
