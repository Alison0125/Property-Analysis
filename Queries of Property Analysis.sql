
/* question 1.a*/
SELECT p.Name, op.PropertyId 
FROM dbo.Property as P INNER JOIN dbo.OwnerProperty as OP on p.Id = op.PropertyId
where op.OwnerId = 1426

/* question 1.b*/
select p.Name as PropertyName, PH.Value as PropertyValue
FROM dbo.Property as P Inner Join dbo.OwnerProperty as OP on p.Id = op.PropertyId
Inner Join dbo.PropertyHomeValue as PH on PH.PropertyId = p.Id
where op.OwnerId = 1426
/* question 1.c i*/
SELECT op.OwnerId, p.Name,Pay.Amount as Rate,tt.name as PaymentFrequency,
      Case When tt.name = 'Weekly' then (DATEDIFF(day, t.StartDate, t.EndDate)/7)*Pay.Amount
	       WHEN tt.name ='Fortnightly' then (DATEDIFF(day, t.StartDate, t.EndDate)/14)*Pay.Amount
		   ELSE DATEDIFF(month, t.StartDate, t.EndDate)*pay.Amount 
	  END AS TotalPayment,
      t.StartDate,t.EndDate
FROM dbo.OwnerProperty as OP Inner Join dbo.Property as P on op.PropertyId = p.Id
Inner Join dbo.PropertyRentalPayment as Pay on pay.PropertyId = p.Id
INNER JOIN dbo.TenantProperty as t on OP.PropertyId=t.PropertyId
Inner Join dbo.TargetRentType as tt on tt.id= t.PaymentFrequencyId
where op.OwnerId = 1426



/* question 1.c.ii*/
SELECT  op.OwnerId,property.Id as PropertyID, pf.Yield
FROM dbo.PropertyFinance as PF Inner Join dbo.OwnerProperty as OP on PF.PropertyId = op.PropertyId
INNER JOIN dbo.Property on Property.Id=op.PropertyId
where op.OwnerId = 1426


/* question 1.d*/
select job.Id, job.JobDescription,JobStatus.Status from dbo.job inner join dbo.JobStatus on job.JobStatusId=JobStatus.Id
where JobStatus.Status = 'Open'

/* question 1.e*/
select p.Name as PropertyName, concat(FirstName,' ', LastName) as TenantName,PR.amount as PayAmont, t.Name as PayFrequency
FROM dbo.OwnerProperty as OP 
INNER JOIN dbo.PropertyRentalPayment as PR on OP.PropertyId = PR.PropertyId
Inner Join dbo.Property as P on op.PropertyId = p.Id
INNER JOIN dbo.TenantProperty as TP on TP.PropertyId = op.PropertyId
INNER JOIN dbo.Person on person.id = TP.TenantId
INNER JOIN dbo.Tenant on Tenant.id=TP.TenantId
INNER JOIN dbo.TargetRentType as t on t.Id=TP.PaymentFrequencyId
where op.OwnerId = 1426


/* question 2 */
SELECT p.Id as PropertyID, OP.id as OwnerID, p.name as PropertyName, concat (A.Number,A.Street,  A.Suburb, A.City,A.PostCode) as Address, p.bedroom, p.bathroom, PE.Amount, PE.Date
FROM dbo.property P Inner Join dbo.OwnerProperty OP on p.id =op.propertyid
Inner Join dbo.PropertyExpense PE on PE.PropertyId = p.Id
inner join dbo.address A on A.AddressId=p.addressid
WHERE Name = 'Property A'

 
