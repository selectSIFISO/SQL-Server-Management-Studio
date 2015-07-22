SELECT DISTINCT
    'Administration' [Basket Entries]
  ,us.[Surname] + ', ' + us.[FirstName] [User]
  ,ce.Id AS ClaimEventId
  ,ce.EventDate
  ,ce.NextContactDate
  ,il.FirstName AS InsuredLifeFirstName
  ,il.Surname AS InsuredLifeSurname
  ,ce.ClaimEventReferenceNumber_Number AS ReferenceNumber	
  ,imt.Description [Intimation Method Type]
  ,cety.[Description] [Claim Event Type]
  ,c.[ProductCode]
  ,c.[PlanDescription]
FROM [DIM].[Claims_ClaimEvent] ce
left join [DIM].[Claims_Claim] c
  ON ce.[Claims_ClaimEventKey] = c.[Claims_ClaimEventKey]
  and c.[IsActiveRecord] = 1
left JOIN [DIM].[Claims_InsuredLife] il 
  ON ce.[Claims_InsuredLifeKey] = il.[Claims_InsuredLifeKey]
  and il.[IsActiveRecord] = 1
left join [DIM].[Claims_ClaimsUser] us
  ON ce.AssignedToAdministratorUserId = us.[Id]
  and ce.[IsActiveRecord] = 1
left join [CG_P_DB_DATEDW].[DIM].[Claims_ClaimEventType] cety
  ON cety.[Claims_ClaimEventTypeKey] = ce.[Claims_ClaimEventTypeKey]
  and cety.[IsActiveRecord] = 1
left join [CG_P_DB_DATEDW].[DIM].[Claims_IntimationMethodType] imt
  ON imt.[Claims_IntimationMethodTypeKey] = ce.[Claims_IntimationMethodTypeKey]
  and imt.[IsActiveRecord] = 1
where ce.AssignedToAdministratorUserId in ('0EED4D73-140C-CB5E-435D-08D036326934')
AND ce.AssignedToAssessorUserId IS NULL
--and ce.[ClaimEventReferenceNumber_Number] = 'S0056459'
AND ce.[Claims_ClaimantKey] IS NOT NULL
AND ce.[Claims_ClaimEventStatusTypeKey] NOT IN (2,11,12)
AND 0 = (SELECT COUNT(Id)
			FROM [DIM].[Claims_Claim] c
			WHERE [Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND c.[Claims_ClaimStatusTypeKey] = 3) -- New
AND 0 = (SELECT COUNT(r.Id)
			FROM [DIM].[Claims_Requirement] r
			INNER JOIN [DIM].[Claims_Document] d ON d.[Claims_RequirementKey] = r.[Claims_RequirementKey]
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND d.[Claims_DocumentStatusTypeKey] = 2 -- New
			AND (r.Claims_RequirementStatusTypeKey <> 3 -- Complete
			OR ce.[Claims_ClaimEventStatusTypeKey] <> 10)) -- Complete
AND (ce.NextContactDate > GETDATE() OR ce.NextContactDate IS NULL)
AND 0 < (SELECT COUNT(Id)
			FROM [DIM].[Claims_Requirement] r
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND r.Claims_RequirementStatusTypeKey <> 3) -- Complete
AND 0 = (SELECT COUNT(Id)
			FROM [DIM].[Claims_Claim] c
			WHERE c.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND [Claims_ClaimTypeKey] IN (26,27,34,35,49,50))
AND 0 < (SELECT COUNT(Id)
			FROM [DIM].[Claims_Claim] c
			WHERE c.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND c.[Claims_ClaimStatusTypeKey] = 4) --Administration
AND 0 < (SELECT COUNT(Id)
			FROM [DIM].[Claims_Requirement] r
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND r.Claims_RequirementStatusTypeKey IN (1,2,4))