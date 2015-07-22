SELECT 
  'Administration' [Basket Entries]
  ,us.[Surname] + ', ' + us.[FirstName] [User]
  ,ce.Id AS ClaimEventId
  ,ce.EventDate
  ,ce.NextContactDate
  ,il.FirstName AS InsuredLifeFirstName
  ,il.Surname AS InsuredLifeSurname
  ,ce.ClaimEventReferenceNumber_Number AS ReferenceNumber		
FROM [DIM].[Claims_ClaimEvent] ce
INNER JOIN [DIM].[Claims_InsuredLife] il ON ce.[Claims_InsuredLifeKey] = il.[Claims_InsuredLifeKey]
inner join [DIM].[Claims_ClaimsUser] us
on ce.AssignedToAdministratorUserId = us.[Id]
WHERE ce.AssignedToAdministratorUserId in ('58477B34-5D66-C244-F4FD-08CF5D2E4840','F8BC3324-C13F-C7C6-4BB7-08CF5D2E493B','4FF77F04-6E8C-C57E-72C5-08CF5D2E4942','5F2DA56A-CC7E-C060-DC53-08CF5D2E48A9','0EED4D73-140C-CB5E-435D-08D036326934')
AND ce.AssignedToAssessorUserId IS NULL
AND ce.[Claims_ClaimantKey] IS NOT NULL
AND ce.[Claims_ClaimEventStatusTypeKey] NOT IN (2,11,12)
AND 0 = (SELECT COUNT(Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Claim] c
			WHERE [Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND c.[Claims_ClaimStatusTypeKey] = 3) -- New
AND 0 = (SELECT COUNT(r.Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Requirement] r
			INNER JOIN [CG_D_DB_DATEDW].[DIM].[Claims_Document] d ON d.[Claims_RequirementKey] = r.[Claims_RequirementKey]
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND d.[Claims_DocumentStatusTypeKey] = 2 -- New
			AND (r.Claims_RequirementStatusTypeKey <> 3 -- Complete
			OR ce.[Claims_ClaimEventStatusTypeKey] <> 10)) -- Complete
AND (ce.NextContactDate > GETDATE()
	OR ce.NextContactDate IS NULL)
AND ce.AssignedToAssessorUserId IS NULL
AND 0 < (SELECT COUNT(Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Requirement] r
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND r.Claims_RequirementStatusTypeKey <> 3) -- Complete
AND 0 = (SELECT COUNT(Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Claim] c
			WHERE c.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND [Claims_ClaimTypeKey] IN (26,27,34,35,49,50))
AND 0 < (SELECT COUNT(Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Claim] c
			WHERE c.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND c.[Claims_ClaimStatusTypeKey] = 4) --Administration
AND 0 < (SELECT COUNT(Id)
			FROM [CG_D_DB_DATEDW].[DIM].[Claims_Requirement] r
			WHERE r.[Claims_ClaimEventKey] = ce.[Claims_ClaimEventKey]
			AND r.Claims_RequirementStatusTypeKey IN (1,2,4))