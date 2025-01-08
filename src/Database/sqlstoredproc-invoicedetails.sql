/*sp_CreateInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_CreateInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateInvoiceDetail` (
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


/*sp_GetInvoiceDetailByID*/
DROP PROCEDURE IF EXISTS `sp_GetInvoiceDetailByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetInvoiceDetailByID`(
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


/*sp_UpdateInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_UpdateInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateInvoiceDetail`(
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


/*sp_DeleteInvoiceDetail*/
DROP PROCEDURE IF EXISTS `sp_DeleteInvoiceDetail`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteInvoiceDetail` (
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
