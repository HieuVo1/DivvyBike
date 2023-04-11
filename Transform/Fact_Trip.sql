BEGIN
    DROP table Fact_Trip
END

Go;

CREATE TABLE Fact_Trip (
	[trip_id] nvarchar(4000),
	[rider_id] bigint,
    [start_station_id] nvarchar(4000),
	[end_station_id] nvarchar(4000),
    [day_key] varchar(50),
	[started_at] datetime2(0),
	[ended_at] datetime2(0),
    [trip_duration] BIGINT,
    [rider_age] BIGINT
)

Go;

INSERT INTO Fact_Trip (
    [trip_id],
    [rider_id] ,
    [start_station_id],
    [end_station_id],
    [day_key],
    [started_at],
    [ended_at],
    [trip_duration],
    [rider_age])
select 
    [trip_id],
    t.[rider_id],
    [start_station_id],
    [end_station_id],
    LEFT(start_at, 10),
    TRY_CONVERT(datetime2(0), [start_at]) as [start_at],
    TRY_CONVERT(datetime2(0), [ended_at]) as [ended_at],
    DATEDIFF(minute,  TRY_CONVERT(datetime2(0), [ended_at]), TRY_CONVERT(datetime2(0), [start_at])),
    DATEDIFF(year, GETDATE(), r.[birthday])   
    from staging_trip as t, staging_rider as r
where t.[rider_id] = r.[rider_id]


GO;
select * from Fact_Trip

go;