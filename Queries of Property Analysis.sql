SELECT p.Name, op.PropertyId 
FROM dbo.Property as P INNER JOIN dbo.OwnerProperty as OP on p.Id = op.PropertyId
where op.OwnerId = 1426

select p.Name as PropertyName, PH.Value as PropertyValue
FROM dbo.Property as P Inner Join dbo.OwnerProperty as OP on p.Id = op.PropertyId
Inner Join dbo.PropertyHomeValue as PH on PH.PropertyId = p.Id
where op.OwnerId = 1426

SELECT op.OwnerId, sum(DATEDIFF(day, StartDate, EndDate)/7/pay.FrequencyType* pay.Amount) as TotalPayment 
FROM dbo.OwnerProperty as OP Inner Join dbo.Property as P on op.PropertyId = p.Id
Inner Join dbo.PropertyRepayment as Pay on pay.PropertyId = p.Id
where op.OwnerId = 1426
GROUP By op.OwnerId

SELECT  op.OwnerId, sum(pf.Yield) as TotalYield
FROM dbo.PropertyFinance as PF Inner Join dbo.OwnerProperty as OP on PF.PropertyId = op.PropertyId
where op.OwnerId = 1426
GROUP By op.OwnerId


select * from dbo.job inner join dbo.JobStatus on job.JobStatusId=JobStatus.Id
where JobStatus.Status = 'Open'

select p.Name as PropertyName, concat(FirstName,' ', LastName) as TenantName,PR.amount as PayAmont, Fre.Name as PayFrequency
FROM dbo.OwnerProperty as OP 
INNER JOIN dbo.PropertyRepayment as PR on OP.PropertyId = PR.PropertyId
Inner Join dbo.Property as P on op.PropertyId = p.Id
INNER JOIN dbo.TenantProperty as TP on TP.PropertyId = op.PropertyId
Inner JOIN dbo.TenantPaymentFrequencies as Fre ON Fre.Id = PR.FrequencyType
INNER JOIN dbo.Person on person.id = TP.TenantId
where op.OwnerId = 1426


SELECT p.Id as PropertyID, OP.id as OwnerID, p.name as PropertyName, concat (A.Number,A.Street,  A.Suburb, A.City,A.PostCode) as Address, p.bedroom, p.bathroom, PE.Amount, PE.Date
FROM dbo.property P Inner Join dbo.OwnerProperty OP on p.id =op.propertyid
Inner Join dbo.PropertyExpense PE on PE.PropertyId = p.Id
inner join dbo.address A on A.AddressId=p.addressid
WHERE Name = 'Property A'

 
