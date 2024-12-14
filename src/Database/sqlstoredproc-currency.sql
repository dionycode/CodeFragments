/*sp_CreateCurrency*/
DROP procedure IF EXISTS `sp_CreateCurrency`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateCurrency`(
        IN `Name` VARCHAR(100),
        IN `ShortName` VARCHAR(10),
        IN `Symbol` VARCHAR(20), 
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
        INSERT INTO Currency(
            Name, 
            ShortName, 
            Symbol, 
            IsDeleted, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId) 
            VALUES (
                Name, 
                ShortName, 
                Symbol, 
                0, 
                CreatedBy, 
                DateCreated,
                SecurityTenantId,
                SecurityCompanyId);
        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetCurrencyById*/
DROP procedure IF EXISTS `sp_GetCurrencyById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCurrencyById`(
        IN `CurrencyId` INT,
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
            Name,
            ShorName,
            Symbol,
            IsDeleted,
            CreatedBy,
            UpdatedBy,
            DateCreated,
            DateUpdated
        FROM Currency 
        WHERE ID=CurrencyId  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateCurrency*/
DROP procedure IF EXISTS `sp_UpdateCurrency`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateCurrency`(
        IN `Name` VARCHAR(100),
        IN `ShortName` VARCHAR(10),
        IN `Symbol` VARCHAR(20), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `CurrencyId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Currency SET 
            Name = Name, 
            ShortName = ShortName, 
            Symbol = Symbol, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated 
            WHERE ID=CurrencyId  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteCurrency*/
DROP procedure IF EXISTS `sp_DeleteCurrency`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteCurrency`(
        IN `CurrencyId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Currency 
        WHERE Id = CurrencyId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
