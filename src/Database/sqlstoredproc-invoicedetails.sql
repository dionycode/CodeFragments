/*sp_CreateInvoiceDetails*/
DROP PROCEDURE IF EXISTS `sp_CreateInvoiceDetails`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateInvoiceDetails` (
		IN `InvoiceID` INT,
		IN `ProductID` INT,
		IN `Description` VARCHAR(200),
		IN `Quantity` INT,
		IN `Price` DECIMAL(18,2),
		IN `IsActive` TINYINT(1),
		IN `CreatedBy` VARCHAR(50) ,
		IN `DateCreated` DATETIME,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO InvoiceDetails (
            InvoiceID, 
            ProductID, 
            Description, 
            Quantity, 
            Price, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
            VALUES(
                InvoiceID,
                ProductID,
                Description,
                Quantity,
                Price,
                IsActive,
                CreatedBy,
                Date(DateCreated),
                SecurityTenantId,
                SecurityCompanyId);

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetInvoiceDetailsByID*/
DROP PROCEDURE IF EXISTS `sp_GetInvoiceDetailsByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetInvoiceDetailsByID`(
		IN `InvoiceDetailsID` INT,
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
			InvoiceID,
			ProductID,
			Description,
			Quantity,
			Price,
			IsActive,
			CreatedBy,
			DateCreated,
			UpdatedBy,
			DateUpdated
		    FROM InvoiceDetails 
            WHERE ID = InvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateInvoiceDetails*/
DROP PROCEDURE IF EXISTS `sp_UpdateInvoiceDetails`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateInvoiceDetails`(
		IN `InvoiceDetailsID` INT,
		IN `InvoiceID` INT,
		IN `ProductID` INT,
		IN `Description` VARCHAR(200),
		IN `Quantity` INT,
		IN `Price` DECIMAL(18,2),
		IN `IsActive` TINYINT(1),
		IN `UpdatedBy` VARCHAR(50) ,
		IN `DateUpdated` DATETIME,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE InvoiceDetails SET
			InvoiceID = InvoiceID,
			ProductID = ProductID,
			Description = Description,
			Quantity = Quantity,
			Price = Price,
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
		    WHERE ID = InvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteInvoiceDetailsByID*/
DROP PROCEDURE IF EXISTS `sp_DeleteInvoiceDetailsByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteInvoiceDetailsByID` (
        IN `InvoiceDetailsID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM InvoiceDetails 
            WHERE ID = InvoiceDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
