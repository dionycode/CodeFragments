
/*sp_CreateChartofAccount*/
DROP PROCEDURE IF EXISTS `sp_CreateChartOfAccount`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateChartOfAccount` (
        IN `Account` INT, 
        IN `Description` VARCHAR(200), 
        IN `Type` VARCHAR(100), 
        IN `Name` VARCHAR(100), 
        IN `Currency` VARCHAR(50), 
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
        INSERT INTO ChartOfAccounts(
            Account,
            Description, 
            Type, 
            Name, 
            Currency, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
        VALUES (
            Account, 
            Description, 
            Type,
            Name, 
            Currency, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*p_GetChartofAccountById*/
DROP PROCEDURE IF EXISTS `sp_GetChartOfAccountById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetChartOfAccountById`(
        IN `ChartOfAccountId` INT,
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
            Account,
            Description, 
            Type, 
            Name, 
            Currency, 
            IsActive,
            CreatedBy, 
            DateCreated,
            UpdatedBy,
            DateUpdated
        FROM ChartOfAccounts 
        WHERE ID=ChartOfAccountId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;

    END$$

DELIMITER ;


/*sp_UpdateChartofAccount*/
DROP PROCEDURE IF EXISTS `sp_UpdateChartOfAccount`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateChartOfAccount` (
        IN `Account` INT, 
        IN `Description` VARCHAR(200), 
        IN `Type` VARCHAR(100), 
        IN `Name` VARCHAR(100), 
        IN `Currency` VARCHAR(50), 
        IN `IsActive` TINYINT(1), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `ChartOfAccountId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE ChartOfAccounts SET 
            Account = Account, 
            Description = Description, 
            Type = Type, 
            Name = Name, 
            Currency = Currency, 
            IsActive = IsActive, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated
        WHERE Id = ChartOfAccountId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteChartofAccount*/
DROP PROCEDURE IF EXISTS `sp_DeleteChartOfAccount`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteChartOfAccount` (
        IN `ChartOfAccountId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ChartOfAccounts 
        WHERE Id = ChartOfAccountId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
