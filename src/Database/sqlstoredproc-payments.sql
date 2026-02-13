/*sp_CreatePayment*/
DROP PROCEDURE IF EXISTS `sp_CreatePayment`;

DELIMITER $$
    CREATE PROCEDURE sp_CreatePayment (		
		IN `InvoiceID` int,
		IN `Date` Datetime,
		IN `Amount` Decimal(18,2),
		IN `Method` int,
		IN `Account` int,
		IN `Notes` varchar(200) ,
		IN `IsActive` TINYINT(1) ,
		IN `CreatedBy` VARCHAR(50),
	    IN `DateCreated` DATETIME,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO Payments (
			InvoiceID, 
			Date, 
			Amount, 
			Method, 
			Account, 
			Notes, 
			IsActive, 
			CreatedBy, 
			DateCreated,
            TenantId,
            CompanyId)
		VALUES (
			InvoiceID, 
			Date, 
			Amount, 
			Method, 
			Account, 
			Notes, 
			IsActive, 
			CreatedBy, 
			DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

		Select LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetPaymentByID*/
DROP PROCEDURE IF EXISTS `sp_GetPaymentByID`;

DELIMITER $$
    CREATE PROCEDURE sp_GetPaymentByID (
		IN `PaymentID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT 
			ID,
			InvoiceID, 
			Date, 
			Amount, 
			Method, 
			Account, 
			Notes, 
			IsActive, 
			CreatedBy, 
			DateCreated,
			UpdatedBy,
			DateUpdated 
		FROM Payments 
		WHERE ID = PaymentID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdatePayment*/
DROP PROCEDURE IF EXISTS `sp_UpdatePayment`;

DELIMITER $$
    CREATE PROCEDURE sp_UpdatePaymentByID (
		IN `PaymentID` int,
		IN `InvoiceID` int,
		IN `Date` Datetime,
		IN `Amount` Decimal(18,2),
		IN `Method` int,
		IN `Account` int,
		IN `Notes` varchar(200) ,
		IN `IsActive` TINYINT(1) ,
		IN `UpdatedBy` VARCHAR(50),
		IN `DateUpdated` DATETIME,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Payments SET
			InvoiceID = InvoiceID,
			Date = Date,
			Amount = Amount,
			Method = Method,
			Account = Account,
			Notes = Notes,
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
		WHERE ID = PaymentID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeletePayment*/
DROP PROCEDURE IF EXISTS `sp_DeletePayment`;

DELIMITER $$
    CREATE PROCEDURE sp_DeletePayment (
		IN `PaymentID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Payments 
		WHERE ID = PaymentID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
