/*sp_CreateRecurringInvoiceDetailSalesTax*/
DROP PROCEDURE IF EXISTS `sp_CreateRecurringInvoiceDetailSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateRecurringInvoiceDetailSalesTax`(
		IN `RecurringInvoiceDetailID` INT,
		IN `Rate` DECIMAL(18, 2),
		IN `SalesTaxID` INT,
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
        INSERT INTO RecurringInvoiceDetailSalesTaxes (
			RecurringInvoiceDetailID, 
			Rate, 
			SalesTaxID, 
			IsActive, 
			CreatedBy, 
			DateCreated,
			TenantId,
			CompanyId)
        VALUES (
			RecurringInvoiceDetailID, 
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


/*sp_GetRecurringInvoiceDetailSalesTaxByID*/
DROP PROCEDURE IF EXISTS `sp_GetRecurringInvoiceDetailSalesTaxByID`;

DELIMITER $$
    CREATE Procedure `sp_GetRecurringInvoiceDetailSalesTaxByID` (
		IN `RecurringInvoiceDetailSalesTaxID` INT,
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
			RecurringInvoiceDetailID, 
			Rate,
			SalesTaxID, 		
			IsActive, 
			CreatedBy, 
			DateCreated,
			UpdatedBy,
			DateUpdated
		FROM RecurringInvoiceDetailSalesTaxes 
		WHERE ID = RecurringInvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateRecurringInvoiceDetailSalesTax*/
DROP PROCEDURE IF EXISTS `sp_UpdateRecurringInvoiceDetailSalesTax`;

DELIMITER $$
    CREATE Procedure `sp_UpdateRecurringInvoiceDetailSalesTax` (
		IN `RecurringInvoiceDetailSalesTaxID` INT,
		IN `RecurringInvoiceDetailID` INT,
		IN `Rate` DECIMAL(18, 2) ,
		IN `SalesTaxID` INT ,	
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
        UPDATE RecurringInvoiceDetailSalesTaxes SET 
			RecurringInvoiceDetailID = RecurringInvoiceDetailID, 
			Rate = Rate,
			SalesTaxID = SalesTaxID,        
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
        WHERE ID = RecurringInvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteRecurringInvoiceDetailSalesTax*/
DROP PROCEDURE IF EXISTS `sp_DeleteRecurringInvoiceDetailSalesTax`;

DELIMITER $$
    CREATE PROCEDURE sp_DeleteRecurringInvoiceDetailSalesTax (
		IN `RecurringInvoiceDetailSalesTaxID` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM RecurringInvoiceDetailSalesTaxes 
		WHERE ID = RecurringInvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
