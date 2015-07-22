SELECT 
  SUBSTRING(CONVERT(VARCHAR(11), c.CreatedTimestamp, 113), 4, 8) AS [Snapshot Date]
  ,'ClaimStatus' [Dashboard_Col]
  ,'LatestClaimStatus' [Dashboard_Col2]
  ,s.Description
  ,c.[StatusId]
  ,c.[Claim_Id] [Curresnt Claim_Id] 
  ,b.id [Latest Claim ID]
FROM [CG_P_DB_CLAIMS].[dbo].[ClaimStatusHistory] c
left join [CG_P_DB_CLAIMS].[dbo].ClaimStatusType s
on s.Id = c.[StatusId]
left join (select id,[ClaimStatusId] from [CG_P_DB_CLAIMS].[dbo].[Claim] where id in (
SELECT [Claim_Id]
  FROM [CG_P_DB_CLAIMS].[dbo].[ClaimStatusHistory]
  where [StatusId]=16
  and CreatedTimestamp >= '1 may 2015')
  and [ClaimStatusId]=16
  )b
  on b.id=c.[Claim_Id]
where [StatusId]=16
  and CreatedTimestamp between '1 may 2015' and '31 may 2015'
  --and CreatedTimestamp >= '1 may 2015'
  order by c.[Claim_Id] 

--  /****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP 1000 [Id]
--      ,[StatusId]
--      ,[ModifiedTimestamp]
--      ,[TimeStamp]
--      ,[CreatedTimestamp]
--      ,[CreatedBy]
--      ,[ModifiedBy]
--      ,[Claim_Id]
--      ,SUBSTRING(CONVERT(VARCHAR(11), CreatedTimestamp, 113), 4, 8) AS [Snapshot Date]
--  FROM [CG_P_DB_CLAIMS].[dbo].[ClaimStatusHistory]
--  where [StatusId]=16
--  and CreatedTimestamp >= '1 may 2015'