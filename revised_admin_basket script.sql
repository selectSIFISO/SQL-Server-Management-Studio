SELECT distinct
 'Administration' [Basket Entries]
  ,us.[Surname] + ', ' + us.[FirstName] [User]
  ,ce.Id AS ClaimEventId
  ,ce.EventDate
  ,ce.NextContactDate
  ,il.FirstName AS InsuredLifeFirstName
  ,il.Surname AS InsuredLifeSurname
  ,ce.ClaimEventReferenceNumber_Number AS ReferenceNumber
  ,imt.Description [Intimation Method Type]
FROM ClaimEvent ce
INNER JOIN InsuredLife il 
  ON ce.InsuredLifeId = il.Id
inner join [CG_P_DB_CLAIMS_LOG].[dbo].[IntimationMethodType] imt
  on imt.Id = ce.[IntimationMethodTypeId]
inner join [CG_P_DB_CLAIMS_LOG].[dbo].[ClaimsUser] us
on ce.AssignedToAdministratorUserId = us.[Id]
left join Claim c
on c.ClaimEventId = ce.Id
  AND c.ClaimStatusId = 2
  AND c.ClaimTypeId IN (25,26,33,34,48,49)
left join Requirement r
  on r.ClaimEventId = ce.Id
  AND r.StatusId <> 2
inner join Requirement r1
			on r1.ClaimEventId = ce.Id
			AND r1.StatusId IN (0,1,3)
inner join Claim c1
			on c1.ClaimEventId = ce.Id
			AND c1.ClaimStatusId = 3
--INNER JOIN Document d ON d.RequirementId = r.Id
where ce.AssignedToAdministratorUserId in ('0EED4D73-140C-CB5E-435D-08D036326934')
AND ce.AssignedToAssessorUserId IS NULL
AND ce.ClaimantId IS NOT NULL
AND ce.StatusId NOT IN (1,10,11)
AND (ce.NextContactDate > GETDATE() OR ce.NextContactDate IS NULL)
AND 0 = (SELECT COUNT(r.Id)
			FROM Requirement r
			INNER JOIN Document d ON d.RequirementId = r.Id
			WHERE ClaimEventId = ce.Id
			AND d.StatusId = 1 -- New
			AND (r.StatusId <> 2 -- Complete
			OR ce.StatusId <> 9)) -- Complete