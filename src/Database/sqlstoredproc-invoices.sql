/*sp_CreateInvoice*/
DROP PROCEDURE IF EXISTS `sp_CreateInvoice`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateInvoice`(
		IN `InvoiceNumber` VARCHAR(20),
		IN `PONumber` VARCHAR(20),
		IN `Date`   DATETIME(6),
		IN `DueDate` DATETIME(6),
		IN `Notes` varchar(200),
		IN `Discount` DECIMAL(18,2),
		IN `Status` INT,
		IN `CustomerID` INT,
		IN `ContactID` INT,
		IN `ShippingAddressID` INT,
		IN `BillingAddressID` INT,
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
        INSERT INTO Invoices (
            InvoiceNumber, 
            PONumber, 
            Date, 
            DueDate, 
            Notes, 
            Discount, 
            Status, 
            CustomerID, 
            ContactID, 
            ShippingAddressID, 
            BillingAddressID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId) 
        VALUES (
            InvoiceNumber, 
            PONumber, 
            Date(Date), 
            Date(DueDate), 
            Notes, 
            Discount, 
            Status, 
            CustomerID, 
            ContactID, 
            ShippingAddressID, 
            BillingAddressID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            SecurityTenantId,
            SecurityCompanyId);	

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;

/*sp_GetInvoiceByID*/
DROP PROCEDURE IF EXISTS `sp_GetInvoiceByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetInvoiceByID` (
        IN `InvoiceID` INT,
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
            InvoiceNumber, 
            PONumber, 
            Date, 
            DueDate, 
            Notes, 
            Discount, 
            Status, 
            CustomerID, 
            ContactID, 
            ShippingAddressID, 
            BillingAddressID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            UpdatedBy,
            DateUpdated
		FROM Invoices 
        WHERE ID = InvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_UpdateInvoice*/
DROP PROCEDURE IF EXISTS `sp_UpdateInvoice`;

DELIMITER $$
    CREATE PROCEDURE  `sp_UpdateInvoice` (
        IN `InvoiceID` INT,
        IN `InvoiceNumber` VARCHAR(20), ## Assumed this column is a custom field (format and auto increment)
        IN `PONumber` VARCHAR(20) ,
        IN `Date`   DATETIME(6) ,
        IN `DueDate` DATETIME(6) ,
        IN `Notes` VARCHAR(200),
        IN `Discount` DECIMAL(18,2),
        IN `Status` INT,
        IN `CustomerID` INT,
        IN `ContactID` INT,
        IN `ShippingAddressID` INT,
        IN `BillingAddressID` INT,
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
        UPDATE Invoices SET 
            InvoiceNumber = InvoiceNumber,
			PONumber = PONumber,
			Date = Date(Date),
			DueDate = Date(DueDate),
			Notes = Notes,
			Discount = Discount,
			Status = Status,
			CustomerID = CustomerID,
			ContactID = ContactID,
			ShippingAddressID = ShippingAddressID,
			BillingAddressID = BillingAddressID,
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
        WHERE ID = InvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_DeleteInvoice*/
DROP PROCEDURE IF EXISTS `sp_DeleteInvoice`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteInvoice` (
        IN `InvoiceID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Invoices 
        WHERE ID = InvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
