select [ClaimStatusId],count(*) from [dbo].[Claim] where id in (
SELECT [Claim_Id]
  FROM [CG_P_DB_CLAIMS].[dbo].[ClaimStatusHistory]
  where [StatusId]=16
  and CreatedTimestamp >= '1 may 2015')
  group by [ClaimStatusId]