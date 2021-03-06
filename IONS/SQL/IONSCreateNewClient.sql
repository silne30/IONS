SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CreateClient]
(
	@LastName VARCHAR(20),
	@FirstName VARCHAR(20),
	@MiddleName VARCHAR(20),
	@Address VARCHAR(100),
	@City VARCHAR(25),
	@State VARCHAR(2),
	@Zip NUMERIC(5),
	@DOB date,
	@ContactNumber VARCHAR(10), 
	@SSN VARCHAR(9),
	@DateEst date,
	@Balance Numeric(10,2),
	@ReferralBit BIT,
	@Referral# VARCHAR(10),
	@Email VARCHAR(100),
	@DueDate Date,
	@Comments Text,
	@Product1 VARCHAR(10),
	@Product2 VARCHAR(10),
	@Product3 VARCHAR(10),
	@Product4 VARCHAR(10),
	@Product5 VARCHAR(10),
	@Product6 VARCHAR(10),
	@Product7 VARCHAR(10),
	@Product8 VARCHAR(10),
	@Product9 VARCHAR(10),
	@Product10 VARCHAR(10),
	@SalesID VARCHAR(10)
)
AS

BEGIN TRANSACTION 
--Declare @Client# and @Order# and set to random numbers. 
DECLARE @Client# VARCHAR(10)
DECLARE @Order# VARCHAR(10)
SET @Client# = (CAST(CAST( RAND() * 10000000000 as BIGINT) as VARCHAR))
SET @Order# = 'N' + (CAST(CAST( RAND() * 1000000000 as BIGINT) as VARCHAR))

--If a referrall number 0 was passed as parameter, set to null
IF (@Referral# = 0)
BEGIN 
	SET @Referral# = NULL
END

--Check if Client# exists in the Client# Table. If so, set to new random number.
WHILE( EXISTS(SELECT TOP 1 * from CLIENT WHERE Client# = @Client#))
	BEGIN
		SET @Client# = 'N' + (CAST(CAST( RAND() * 1000000000 as BIGINT) as VARCHAR))
	END
	
--Check if Client# exists in the Client# Table. If so, set to new random number.
WHILE( EXISTS(SELECT TOP 1 * from dbo.ORDERS WHERE Order# = @Order#))
	BEGIN
		SET @Order# = 'N' + (CAST(CAST( RAND() * 1000000000 as BIGINT) as VARCHAR))
	END
	
--Insert new client information into client. 	
INSERT into CLIENT (Client#, LastName, FirstName, MiddleName, Address, Zip, City, State, SSN,  DOB, ContactNumber,
 DateEst, Balance, WasReferred, Referral#, Email) VALUES
(@Client#, @LastName, @FirstName, @MiddleName, @Address, @Zip, @City, @State, @SSN,  @DOB, @ContactNumber,
 @DateEst, @Balance, @ReferralBit, @Referral#, @Email);-- @SalesID );
 
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting new client into Client table.', 16, 1)
		RETURN
	END
 
INSERT INTO dbo.ORDERS VALUES  ( @Order#, 'P' , @DueDate ,@Client# ,@Comments , @SalesID )

IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting order into ORDERS table.', 16, 1)
		RETURN
	END
 
IF @Product1 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product1 )
	END

IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product1 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	

IF @Product2 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product2 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product2 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END
	
		
IF @Product3 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product3 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product3 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	
	
IF @Product4 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product4 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product4 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	

IF @Product5 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product5 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product5 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	
	
IF @Product6 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product6 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product6 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	
	
IF @Product7 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product7 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product7 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	

IF @Product8 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product8 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product8 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	

IF @Product9 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product9 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product9 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	

IF @Product10 != NULL
	BEGIN 
		INSERT INTO dbo.ORDEREDPRODUCT VALUES  ( @Order#, @Product10 )
	END
	
IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK

		-- Raise an error and return
		RAISERROR ('Error in inserting product10 into ORDEREDPRODUCT table.', 16, 1)
		RETURN
	END	
	
--All inserts have succeeded if we have gotten to this point. Commit transaction. 
COMMIT