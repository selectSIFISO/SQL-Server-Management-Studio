/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	TOP 1000 [PolicyKey]
      ,[InsertAuditkey]
	  ,[PercentIncrease]
	  ,[PolicyNumber]
      ,[RecordEffectiveStartDate]
      ,[RecordEffectiveEndDate]
      ,[IsActiveRecord]
      ,[IsDeleted]
      ,[RecordUser]
      ,[PMaster_SourceAutoKey]
      ,[KeyDet_SourceAutokey]
      ,[PMaster_TriggerID]
      ,[KeyDet_TriggerID]
      ,[PMaster_TriggerAction]
      ,[KeyDet_TriggerAction]
      ,[PMaster_TriggerActionLineNo]
      ,[KeyDet_TriggerActionLineNo]
      --,[PolicyNumber]
      ,[PolicyFee]
      ,[PlanType]
      ,[ClientNumber]
      ,[Frequency]
      ,[MediaCode]
      ,[UnderwritingFlag]
      ,[Webcase]
      ,[CampaignCodeKeydet]
      ,[CampaignCodePmaster]
      ,[PercentIncrease]
      ,[DateOfCommencementKey]
      ,[IFAAgentNumberKey]
      ,[IntroducerKey]
      ,[PolicyStatusKey]
      ,[ProductKey]
      ,[SalesAgentKey]
      ,[UnderwriterKey]
      ,[ValuationDateOfCommencementKey]
      ,[FirstBenefitBusinessUnitKey]
      ,[FirstMovementCaptureDateKey]
      ,[AdminFee]
      ,[MobilePresenterNumberKey]
      ,[MasterContract]
      ,[IFAPresentationVenue]
      ,[IFAPresentationDate]
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY]
  --where PolicyKey in (6517899,6517900)
  where /*[RecordEffectiveStartDate] between '1 feb 2015' and '28 feb 2015'
   and */ [PolicyNumber]='401227541'