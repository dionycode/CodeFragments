
/*sp_CreateChartofAccounts*/
DROP procedure IF EXISTS `sp_CreateChartOfAccounts`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateChartOfAccounts` (
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


/*p_GetChartofAccountsById*/
DROP procedure IF EXISTS `sp_GetChartOfAccountsById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetChartOfAccountsById`(
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


/*sp_UpdateChartofAccounts*/
DROP procedure IF EXISTS `sp_UpdateChartOfAccounts`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateChartOfAccounts` (
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


/*sp_DeleteChartofAccounts*/
DROP procedure IF EXISTS `sp_DeleteChartOfAccounts`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteChartOfAccounts` (
        IN `ChartOfAccountId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ChartOfAccounts WHERE Id = ChartOfAccountId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
