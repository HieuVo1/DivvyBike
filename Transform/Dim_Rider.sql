BEGIN
    DROP table Dim_Rider
END

Go;

CREATE TABLE Dim_Rider (
	[rider_id] bigint,
	[first_name] nvarchar(4000),
    [last_name] nvarchar(4000),
	[address] nvarchar(4000),
	[birthday] datetime2(0),
	[account_start_date] datetime2(0),
	[account_end_date] datetime2(0),
	[is_member] bit
)

Go;

INSERT INTO Dim_Rider ([rider_id],
                        [first_name],
                        [last_name],
                        [address],
                        [birthday],
                        [account_start_date],
                        [account_end_date],
                        [is_member])
select [rider_id],
        [first_name],
        [last_name],
        [address],
        TRY_CONVERT(datetime2(0), [birthday]) as [birthday],
        TRY_CONVERT(datetime2(0), [account_start_date]) as [account_start_date],
        TRY_CONVERT(datetime2(0), [account_end_date]) as [account_end_date],
        [is_member] from staging_rider


GO;
select * from Dim_Rider

go;