
select DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-12, 0) --First day of previous month

select DATEADD(month, -12, GETDATE())


SELECT
	k.[Mon YYYY] [Date]
	,COUNT(*) [Number of policies with an annual premium increase indicator ]
	--,k.[PolicyNumber]
	--,k.[PolicyNumber],k.[ProductKey],k.[PolicyKey]
	--,[PercentIncrease]
FROM
(
SELECT SUBSTRING(CONVERT(VARCHAR(11), [RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY],[PolicyNumber],[ProductKey],
MAX([PolicyKey]) [PolicyKey]
   --   ,[InsertAuditkey]
	  --,[PercentIncrease]
	  ----,[PolicyNumber]
   --   ,[RecordEffectiveStartDate]
   --   ,[RecordEffectiveEndDate]
   --   ,[IsActiveRecord]
   --   ,[IsDeleted]
   --   ,[RecordUser]
   --   ,[PMaster_SourceAutoKey]
   --   ,[KeyDet_SourceAutokey]
   --   ,[PMaster_TriggerID]
   --   ,[KeyDet_TriggerID]
   --   ,[PMaster_TriggerAction]
   --   ,[KeyDet_TriggerAction]
   --   ,[PMaster_TriggerActionLineNo]
   --   ,[KeyDet_TriggerActionLineNo]
   --   --,[PolicyNumber]
   --   ,[PolicyFee]
   --   ,[PlanType]
   --   ,[ClientNumber]
   --   ,[Frequency]
   --   ,[MediaCode]
   --   ,[UnderwritingFlag]
   --   ,[Webcase]
   --   ,[CampaignCodeKeydet]
   --   ,[CampaignCodePmaster]
   --   ,[PercentIncrease]
   --   ,[DateOfCommencementKey]
   --   ,[IFAAgentNumberKey]
   --   ,[IntroducerKey]
   --   ,[PolicyStatusKey]
   --   --,[ProductKey]
   --   ,[SalesAgentKey]
   --   ,[UnderwriterKey]
   --   ,[ValuationDateOfCommencementKey]
   --   ,[FirstBenefitBusinessUnitKey]
   --   ,[FirstMovementCaptureDateKey]
   --   ,[AdminFee]
   --   ,[MobilePresenterNumberKey]
   --   ,[MasterContract]
   --   ,[IFAPresentationVenue]
   --   ,[IFAPresentationDate]
--count([PolicyNumber])
----,[ProductKey]
--	,[RecordEffectiveStartDate]
--      ,[PercentIncrease]
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY]  
  --where [RecordEffectiveStartDate] >= '1 feb 2014'
  where [RecordEffectiveStartDate] between '1 feb 2015' and '28 feb 2015'
  group by SUBSTRING(CONVERT(VARCHAR(11), [RecordEffectiveStartDate], 113), 4, 8),[PolicyNumber],[ProductKey]
  --where [RecordEffectiveStartDate] >= DATEADD(month, -12, GETDATE())
  --group by [RecordEffectiveStartDate]
  --    ,[PercentIncrease]
	--order by [RecordEffectiveStartDate]
	--order by [PolicyNumber],[ProductKey]

	--612158014
	)k
	INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] pol
	on k.PolicyKey = pol.PolicyKey
	WHERE pol.[PercentIncrease] <> 0
	group by k.[Mon YYYY]