/*sp_CreateConnectedAccount*/
DROP PROCEDURE IF EXISTS `sp_CreateConnectedAccount`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateConnectedAccount`(
        IN `CustomerID` INT,
        IN `Access_Token` VARCHAR(100),
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
        INSERT INTO ConnectedAccounts (
            CustomerID,
            Access_Token,
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
        VALUES (
            CustomerID,
            Access_Token,
            IsActive, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetConnectedAccount*/
DROP PROCEDURE IF EXISTS `sp_GetConnectedAccountByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetConnectedAccountByID`(
        IN `ConnectedAccountsID` INT,
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
            CustomerID,
            Access_Token,
            IsActive,
            CreatedBy,
            UpdatedBy,
            DateCreated,
            DateUpdated
        FROM ConnectedAccounts 
        WHERE ID = ConnectedAccountsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateConnectedAccount*/
DROP PROCEDURE IF EXISTS `sp_UpdateConnectedAccount`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateConnectedAccount`(
        IN `ConnectedAccountID` INT,
        IN `CustomerID` INT,
        IN `Access_Token` VARCHAR(100),
        IN `IsActive` TinyInt,
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
        UPDATE ConnectedAccounts SET
            CustomerID = CustomerID,
            Access_Token = Access_Token,
            IsActive = IsActive,
            UpdatedBy = UpdatedBy,
            DateUpdated = DateUpdated
        WHERE ID = ConnectedAccountID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteConnectedAccount*/
DROP PROCEDURE IF EXISTS `sp_DeleteConnectedAccount`;


DELIMITER $$
    CREATE PROCEDURE `sp_DeleteConnectedAccount`(
        IN `ConnectedAccountId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ConnectedAccounts 
        WHERE ID = ConnectedAccountID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
