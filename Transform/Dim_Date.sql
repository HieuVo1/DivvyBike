BEGIN
    DROP table Dim_Date
END

DECLARE @currentDate  date = '20100101';
DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 15, @currentDate));

CREATE TABLE Dim_Date (
	[date_key] varchar(50),
    [date] date,
	[year] int,
	[quarter] int,
	[month] int,
	[week] int,
	[dayofyear] int
)

WHILE ( @currentDate <= @CutoffDate)
BEGIN
	INSERT INTO Dim_Date
		([date_key],
		[date],
		[year],
		[quarter],
		[month],
		[week],
		[dayofyear])

	SELECT 
		convert(varchar, @currentDate, 112),
		@currentDate,
		DATEPART(YEAR, @currentDate),
		DATEPART(Quarter, @currentDate),
		DATEPART(MONTH, @currentDate),
		DATEPART(WEEK, @currentDate),
		DATEPART(DAYOFYEAR, @currentDate)

    SET @currentDate  = DATEADD(DAY, 1, @currentDate)
END
