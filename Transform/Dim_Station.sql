BEGIN
    DROP table Dim_Station
END

Go;

CREATE TABLE Dim_Station (
	[station_id] nvarchar(4000),
	[name] nvarchar(4000),
	[latitude] float,
	[longitude] float
)

Go;

INSERT INTO Dim_Station ([station_id], [name] ,[latitude], [longitude])
select * from staging_station


GO;
select * from Dim_Station

go;