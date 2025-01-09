/*sp_SalesTax*/
DROP PROCEDURE IF EXISTS `sp_CreateSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateSalesTax`(
        IN `Name` VARCHAR(100),
        IN `Description` VARCHAR(200),
        IN `Abbreviation` VARCHAR(20),
        IN `Rate` DECIMAL(18,2),
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
        INSERT INTO SalesTaxes(
            Name, 
            Description, 
            Abbreviation, 
            Rate, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId) 
        VALUES (
            Name, 
            Description, 
            Abbreviation, 
            Rate, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetSalesTaxById*/
DROP PROCEDURE IF EXISTS `sp_GetSalesTaxById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetSalesTaxById`(
        IN `SalesTaxId` INT,
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
            Name, 
            Description, 
            Abbreviation, 
            Rate, 
            CreatedBy, 
            DateCreated, 
            UpdatedBy, 
            DateUpdated
        FROM SalesTaxes WHERE ID=SalesTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateSalesTax*/
DROP PROCEDURE IF EXISTS `sp_UpdateSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateSalesTax`(
        IN `Name` VARCHAR(100),
        IN `Description` VARCHAR(200),
        IN `Abbreviation` VARCHAR(20),
        IN `Rate` DECIMAL(18,2), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `SalesTaxId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE SalesTaxes SET 
            Name = Name, 
            Description = Description, 
            Abbreviation = Abbreviation, 
            Rate = Rate, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated 
        WHERE ID=SalesTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteSalesTax*/
DROP PROCEDURE IF EXISTS `sp_DeleteSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteSalesTax`(
        IN `SalesTaxId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM SalesTaxes 
        WHERE Id=SalesTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
