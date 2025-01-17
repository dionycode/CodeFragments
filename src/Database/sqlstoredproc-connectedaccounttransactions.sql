/*sp_CreateConnectedAccountTransaction*/
DROP PROCEDURE IF EXISTS `sp_CreateCategory`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateConnectedAccountTransaction` (
        IN `ConnectedAccountsID` INT,
        IN `TransactionDate` DATETIME(6),
        IN `TransactionID` VARCHAR(100),
        IN `Merchant` VARCHAR(100),
        IN `PaymentChannel` VARCHAR(50),
        IN `Amount` DECIMAL,
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
        INSERT INTO ConnectedAccountsTransactions (
			ConnectedAccountsID,
			TransactionDate,
			TransactionID,
			Merchant,
			PaymentChannel,
			Amount,
			IsActive,
			CreatedBy,
			DateCreated,
            TenantId,
            CompanyId)
		VALUES (
			ConnectedAccountsID,
			TransactionDate,
			TransactionID,
			Merchant,
			PaymentChannel,
			Amount,
			IsActive,
			CreatedBy,
			DateCreated,
            SecurityTenantId,
            SecurityCompanyId);

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetConnectedAccountTransactionByID*/
DROP PROCEDURE IF EXISTS `sp_GetConnectedAccountTransactionByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetConnectedAccountTransactionByID` (
        IN `ConnectedAccountsTransactionsID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT
			ConnectedAccountsID,
			TransactionDate,
			TransactionID,
			Merchant,
			PaymentChannel,
			Amount,
			IsActive,
			CreatedBy,
			UpdatedBy,
			DateCreated,
			DateUpdated
		FROM ConnectedAccountsTransactions 
        WHERE ID = ConnectedAccountsTransactionsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateConnectedAccountTransaction*/
DROP PROCEDURE IF EXISTS `sp_UpdateConnectedAccountTransaction`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateConnectedAccountTransaction` (
		IN `ConnectedAccountsTransactionsID` INT,
		IN `ConnectedAccountsID` INT,
		IN `TransactionDate` DATETIME,
		IN `TransactionID` VARCHAR(100),
		IN `Merchant` VARCHAR(100),
		IN `PaymentChannel` VARCHAR(50),
		IN `Amount` DECIMAL,
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
        UPDATE ConnectedAccountsTransactions SET
			ConnectedAccountsID = ConnectedAccountsID,
			TransactionDate = TransactionDate,
			TransactionID = TransactionID,
			Merchant = Merchant,
            PaymentChannel = PaymentChannel,
            Amount = Amount,
			IsActive = IsActive,
			Updatedby  = UpdatedBy,
			DateUpdated = DateUpdated
        WHERE ID = ConnectedAccountsTransactionsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteConnectedAccountTransaction*/
DROP PROCEDURE IF EXISTS `sp_DeleteConnectedAccountTransaction`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteConnectedAccountTransaction` (
		IN `ConnectedAccountsTransactionsID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ConnectedAccountsTransactions 
        WHERE ID = ConnectedAccountsTransactionsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
