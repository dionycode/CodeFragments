/*sp_CreateSetup*/
DROP PROCEDURE IF EXISTS `sp_CreateSetup`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateSetup`(
        IN `Name` VarChar(100),
        IN `Description` VARCHAR(200),
        IN `Value` VARCHAR(50),
        IN `Group` VARCHAR(30),
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
        INSERT INTO Setup (
            Name,
            Description,
            Value,
            `Group`,
            IsActive,
            CreatedBy,
            DateCreated,
            TenantId,
            CompanyId)
        VALUES (
            Name,
            Description,
            Value,
            `Group`,
            IsActive,
            CreatedBy,
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);
        
        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetSetupByID*/
DROP PROCEDURE IF EXISTS `sp_GetSetupByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetSetupByID`(
        IN `SetupID` INT,
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
            Value,
            `Group`,
            IsActive,
            CreatedBy,
            DateCreated,
            UpdatedBy,
            DateUpdated
        FROM Setup 
        WHERE ID = SetupID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateSetup*/
DROP PROCEDURE IF EXISTS `sp_UpdateSetup`;

DELIMITER $$
    -- REPLACE WITH CREATE STORED PROCEDURE STATEMENT --
    CREATE PROCEDURE `sp_UpdateSetup`(
        IN `SetupID` INT,
        IN `Name` VarChar(100),
        IN `Description` VARCHAR(200),
        IN `Value` VARCHAR(50),
        IN `Group` VARCHAR(30),
        IN `IsActive` TINYINT(1),
        IN `UpdatedBy` LONGTEXT,
        IN `DateUpdated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Setup SET
            Name = Name,
            Description = Description,
            Value = Value,
            `Group` = `Group`,
            IsActive = IsActive,
            UpdatedBy = UpdatedBy,
            DateUpdated = DateUpdated
        WHERE ID = SetupID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;

    END$$

DELIMITER ;


/*sp_DeleteSetup*/
DROP PROCEDURE IF EXISTS `sp_DeleteSetup`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteSetup`(
        IN `SetupID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Setup 
        WHERE ID = SetupID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
