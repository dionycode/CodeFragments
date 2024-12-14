/*sp_CreateBillingAddress*/
DROP procedure IF EXISTS `sp_CreateBillingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateBillingAddress`(
        IN `CustomerId` INT, 
        IN `CurrencyCode` VARCHAR(20),
        IN `Address1` VARCHAR(100),
        IN `Address2` VARCHAR(50),
        IN `City` VARCHAR(50),
        IN `State` VARCHAR(20),
        IN `Country` VARCHAR(50),
        IN `PostalCode` VARCHAR(50),
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
        INSERT INTO BillingAddress(
            CustomerId, 
            CurrencyCode, 
            Address1, 
            Address2, 
            City, 
            State, 
            Country, 
            PostalCode, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId) 
        VALUES (
            CustomerId, 
            CurrencyCode, 
            Address1, 
            Address2, 
            City, 
            State, 
            Country, 
            PostalCode, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);
        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetBillingAddressById*/
DROP procedure IF EXISTS `sp_GetBillingAddressById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetBillingAddressById`(
        IN `BillingId` INT,
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
            CustomerId,
            CurrencyCode,
            Address1,
            Address2,
            City,
            State,
            Country,
            PostalCode,
            IsActive,
            CreatedBy,
            DateCreated,
            UpdatedBy,
            DateUpdated
        FROM BillingAddress WHERE ID=BillingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateBillingAddress*/
DROP procedure IF EXISTS `sp_UpdateBillingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateBillingAddress`(
        IN `CustomerId` INT, 
        IN `CurrencyCode` VARCHAR(20),
        IN `Address1` VARCHAR(100),
        IN `Address2` VARCHAR(50),
        IN `City` VARCHAR(50),
        IN `State` VARCHAR(20),
        IN `Country` VARCHAR(50),
        IN `PostalCode` VARCHAR(50),
        IN `IsActive` TINYINT(1), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `BillingId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE BillingAddress SET 
            CustomerId = CustomerId, 
            CurrencyCode = CurrencyCode, 
            Address1 = Address1, 
            Address2 = Address2, 
            City = City, 
            State = State, 
            Country = Country, 
            PostalCode = PostalCode, 
            IsActive = IsActive, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated
        WHERE ID=BillingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_DeleteBillingAddress*/
DROP procedure IF EXISTS `sp_DeleteBillingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteBillingAddress`(
        IN `BillingId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM BillingAddress WHERE Id=BillingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
