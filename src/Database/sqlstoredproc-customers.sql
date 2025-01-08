/*sp_CreateCustomer*/
DROP PROCEDURE IF EXISTS sp_CreateCustomer;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateCustomer`(
        IN `CompanyName` VARCHAR(50), 
        IN `AccountNumber` VARCHAR(50), 
        IN `Website` VARCHAR(100), 
        IN `Notes` VARCHAR(200), 
        IN `ContactID` INT, 
        IN `BillingID` INT, 
        IN `IsSameShipping` TINYINT(1), 
        IN `ShippingID` INT, 
        IN `IsActive` TINYINT(1), 
        IN `CreatedBy` LONGTEXT, 
        IN `DateCreated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO Customers(
            CompanyName, 
            AccountNumber,
            Website, 
            Notes, 
            ContactID, 
            BillingID, 
            IsSameShipping,
            ShippingID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId) 
        VALUES (
            CompanyName, 
            AccountNumber, 
            Website, 
            Notes, 
            ContactID, 
            BillingID, 
            IsSameShipping,
            ShippingID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetCustomerById*/
DROP PROCEDURE IF EXISTS sp_GetCustomerById;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCustomerById`(
        IN `CustomerId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT
            Id,
            CompanyName,
            AccountNumber,
            Website,
            Notes,
            ContactID,
            BillingID,
            IsSameShipping,
            ShippingID,
            IsActive,
            CreatedBy,
            UpdatedBy,
            DateCreated,
            DateUpdated
        FROM Customers 
        WHERE ID=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_UpdateCustomer*/
DROP PROCEDURE IF EXISTS sp_UpdateCustomer;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateCustomer`(
        IN `CompanyName` VARCHAR(50), 
        IN `AccountNumber` VARCHAR(50), 
        IN `Website` VARCHAR(100), 
        IN `Notes` VARCHAR(200), 
        IN `ContactID` INT, 
        IN `BillingID` INT, 
        IN `IsSameShipping` TINYINT(1),
        IN `ShippingID` INT, 
        IN `IsActive` TINYINT(1), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `CustomerId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Customers SET 
            CompanyName = CompanyName, 
            AccountNumber = AccountNumber, 
            Website = Website, 
            Notes = Notes, 
            ContactID = ContactID, 
            BillingID = BillingID, 
            IsSameShipping = IsSameShipping,
            ShippingID = ShippingID, 
            IsActive = IsActive, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated 
        WHERE ID=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteCustomer*/
DROP PROCEDURE IF EXISTS sp_DeleteCustomer;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteCustomer`(
        IN `CustomerId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Contacts WHERE Contacts.CustomerId=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
	    DELETE FROM BillingAddress WHERE BillingAddress.CustomerId=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
	    DELETE FROM ShippingAddress WHERE ShippingAddress.CustomerId=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
	    DELETE FROM Customers WHERE Customers.Id=CustomerId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
