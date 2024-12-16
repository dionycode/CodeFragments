
/*sp_CreateInvoiceDetailSalesTaxes*/
DROP PROCEDURE IF EXISTS `sp_CreateInvoiceDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateInvoiceDetailSalesTaxes`(
        IN `InvoiceDetailID` INT,
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
        INSERT INTO InvoiceDetailSalesTaxes (
            InvoiceDetailID, 
            Rate, 
            SalesTaxID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
            VALUES (
                InvoiceDetailID, 
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


/*sp_GetInvoiceDetailSalesTaxesByID*/
DROP PROCEDURE IF EXISTS `sp_GetInvoiceDetailSalesTaxesByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetInvoiceDetailSalesTaxesByID` (
        IN `InvoiceDetailSalesTaxID` INT,
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
            InvoiceDetailID, 
            Rate,
            SalesTaxID, 		
            IsActive, 
            CreatedBy, 
            DateCreated,
            UpdatedBy,
            DateUpdated
            FROM InvoiceDetailSalesTaxes 
            WHERE ID = InvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateInvoiceDetailSalesTaxes*/
DROP PROCEDURE IF EXISTS `sp_UpdateInvoiceDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateInvoiceDetailSalesTaxes` (
        IN `InvoiceDetailSalesTaxID` INT,
        IN `InvoiceDetailID` INT,
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
        UPDATE InvoiceDetailSalesTaxes SET 
            InvoiceDetailID = InvoiceDetailID, 
            Rate = Rate,
            SalesTaxID = SalesTaxID,        
            IsActive = IsActive,
            UpdatedBy = UpdatedBy,
            DateUpdated = DateUpdated
            WHERE ID = InvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteInvoiceDetailSalesTaxes*/
DROP PROCEDURE IF EXISTS `sp_DeleteInvoiceDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE sp_DeleteInvoiceDetailSalesTaxes (
        IN `InvoiceDetailSalesTaxID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM InvoiceDetailSalesTaxes 
            WHERE ID = InvoiceDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
