ALTER PROCEDURE dbo.CreateCustomer
(
	@LastName char(20),
	@FirstName char(20),
	@MiddleName char(20),
	@Address VARCHAR(50),
	@City VARCHAR(25),
	@State VARCHAR(2),
	@Zip NUMERIC(5),
	@DOB date,
	@ContactNumber NUMERIC(15), 
	@SSN NUMERIC(9),
	@DateEst date,
	@Balance Numeric(10,2),
	@ReferralBit BIT,
	@Referral# NUMERIC(10),
	@Email VARCHAR(100)
	--@SalesID VARCHAR(10)
)
AS
DECLARE @Customer# NUMERIC(10)
SET @Customer# = (CAST( RAND() * 10000000000 as BIGINT))

IF (@Referral# = 0)
BEGIN 
	SET @Referral# = NULL
END

WHILE( EXISTS(SELECT TOP 1 * from CUSTOMER WHERE Customer# = @Customer#))
	BEGIN
		SET @Customer# = (CAST( RAND() * 10000000000 as BIGINT))	
	END
INSERT INTO CUSTOMER (customer#, LastName, FirstName, MiddleName, Address, Zip, City, State, SSN,  DOB, ContactNumber,
 DateEst, Balance, WasReferred, Referral#, Email) VALUES
(@Customer#, @LastName, @FirstName, @MiddleName, @Address, @Zip, @City, @State, @SSN,  @DOB, @ContactNumber,
 @DateEst, @Balance, @ReferralBit, @Referral#, @Email);-- @SalesID );
