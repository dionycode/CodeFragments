/*sp_CreateSalesTaxRate*/
DROP PROCEDURE IF EXISTS `sp_CreateSalesTaxRate`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateSalesTaxRate` (
        IN `EffectiveDate` Datetime(6) ,
        IN  `Rate` DECIMAL(18, 2) ,
        IN  `SalesTaxID` int,
        IN  `IsActive` TINYINT(1),
        IN  `CreatedBy` VARCHAR(50),
        IN  `DateCreated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO SalesTaxRates (
            EffectiveDate,
            Rate,
            SalesTaxID,
            IsActive,
            CreatedBy,
            DateCreated,
            TenantId,
            CompanyId)
        VALUES (
            EffectiveDate,
            Rate,
            SalesTaxID,
            IsActive,
            CreatedBy,
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetSalesTaxRateByID*/
DROP PROCEDURE IF EXISTS `sp_GetSalesTaxRateByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetSalesTaxRateByID` (
        IN `SalesTaxRatesID` INT,
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
            EffectiveDate,
            Rate,
            SalesTaxID,
            IsActive,
            CreatedBy,
            DateCreated,
            UpdatedBy,
            DateUpdated
        FROM SalesTaxRates 
        WHERE ID = SalesTaxRatesID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_UpdateSalesTaxRate*/
DROP PROCEDURE IF EXISTS `sp_UpdateSalesTaxRate`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateSalesTaxRate` (
        IN `SalesTaxRateID` int,
        IN `EffectiveDate` Datetime(6) ,
        IN `Rate` DECIMAL(18, 2) ,
        IN `SalesTaxID` int,
        IN `IsActive` TINYINT(1),
        IN `UpdatedBy` VARCHAR(50),
        IN `DateUpdated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE SalesTaxRates SET
            EffectiveDate = EffectiveDate,
            Rate = Rate,
            SalesTaxID = SalesTaxID,
            IsActive = IsActive,
            UpdatedBy = UpdatedBy,
            DateUpdated = DateUpdated
        WHERE ID = SalesTaxRateID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteSalesTaxRate*/
DROP PROCEDURE IF EXISTS `sp_DeleteSalesTaxRate`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteSalesTaxRate`(
        IN `SalesTaxRateID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM SalesTaxRates 
        WHERE ID = SalesTaxRateID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
