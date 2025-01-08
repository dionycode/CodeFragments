/*sp_CreateRecurringInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_CreateRecurringInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateRecurringInvoiceDetail` (
		IN `RecurringInvoiceID` int ,
		IN `ProductID` int ,
		IN `Description` varchar(200),
		IN `Quantity` int,
		IN `Price` decimal(18,2),
		IN `IsActive` TINYINT(1),
		IN `CreatedBy` VARCHAR(50) ,
		IN `DateCreated` DATETIME(6),
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO RecurringInvoiceDetails (
			RecurringInvoiceID,
			ProductID,
			Description,
			Quantity,
			Price,
			IsActive,
			CreatedBy,
			DateCreated,
			TenantId,
			CompanyId)
		VALUES (
			RecurringInvoiceID,
			ProductID,
			Description,
			Quantity,
			Price,
			IsActive,
			CreatedBy,
			DateCreated,
			SecurityTenantId,
			SecurityCompanyId);

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetRecurringInvoiceDetailByID*/
DROP PROCEDURE IF EXISTS `sp_GetRecurringInvoiceDetailByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetRecurringInvoiceDetailByID` (
		IN `RecurringInvoiceDetailsID` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT 
			RecurringInvoiceID,
			ProductID,
			Description,
			Quantity,
			Price,
			IsActive,
			CreatedBy,
			DateCreated,
			UpdatedBy,
			DateUpdated
		FROM RecurringInvoiceDetails
		WHERE ID = RecurringInvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateRecurringInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_UpdateRecurringInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateRecurringInvoiceDetail` (
		IN `RecurringInvoiceDetailsID` int,
		IN `RecurringInvoiceID` int ,
		IN `ProductID` int ,
		IN `Description` varchar(200),
		IN `Quantity` int,
		IN `Price` decimal(18,2),
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
        UPDATE RecurringInvoiceDetails SET
			RecurringInvoiceID = RecurringInvoiceID,
			ProductID = ProductID,
			Description = Description,
			Quantity = Quantity,
			Price = Price,
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
		WHERE ID = RecurringInvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteRecurringInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_DeleteRecurringInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteRecurringInvoiceDetail`(
		IN `RecurringInvoiceDetailsID` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM RecurringInvoiceDetails 
		WHERE ID = RecurringInvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
