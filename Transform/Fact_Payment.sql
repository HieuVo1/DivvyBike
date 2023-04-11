BEGIN
    DROP table Fact_Payment
END

Go;

CREATE TABLE Fact_Payment (
	[payment_id] bigint,
    [rider_id] bigint,
	[date_key] varchar(50),
	[amount] float
)

Go;

INSERT INTO Fact_Payment ([payment_id], [rider_id] ,[date_key], [amount])
select [payment_id], [rider_id] , LEFT(payment_date, 10), [amount] from staging_payment


GO;
select * from Fact_Payment

go;