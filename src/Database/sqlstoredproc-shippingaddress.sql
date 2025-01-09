/*sp_CreateShippingAddress*/
DROP PROCEDURE IF EXISTS `sp_CreateShippingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateShippingAddress`(
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
        INSERT INTO ShippingAddress(
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


/*sp_GetShippingAddressById*/
DROP PROCEDURE IF EXISTS `sp_GetShippingAddressById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetShippingAddressById`(
        IN `ShippingId` INT,
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
        FROM ShippingAddress 
        WHERE ID=ShippingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateShippingAddress*/
DROP PROCEDURE IF EXISTS `sp_UpdateShippingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateShippingAddress`(
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
        IN `ShippingId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE ShippingAddress SET 
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
        WHERE ID=ShippingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_DeleteShippingAddress*/
DROP PROCEDURE IF EXISTS `sp_DeleteShippingAddress`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteShippingAddress`(
        IN `ShippingId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ShippingAddress 
        WHERE Id=ShippingId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
