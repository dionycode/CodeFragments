/*sp_CreateEstimate*/
DROP PROCEDURE IF EXISTS `sp_CreateEstimates`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateEstimates`(
		IN `EstimateNumber` VARCHAR(20),
		IN `CustomerRef` VARCHAR(20),
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
        INSERT INTO Estimates (
            EstimateNumber, 
            CustomerRef, 
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
                EstimateNumber, 
                CustomerRef, 
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

/*sp_GetEstimatesByID*/
DROP PROCEDURE IF EXISTS `sp_GetEstimatesByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetEstimatesByID` (
        IN `EstimatesID` INT,
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
            EstimateNumber, 
            CustomerRef, 
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
            FROM Estimates WHERE ID = EstimatesID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateEstimatesByID*/
DROP PROCEDURE IF EXISTS `sp_UpdateEstimatesByID`;

DELIMITER $$
    CREATE PROCEDURE  `sp_UpdateEstimatesByID` (
        IN `EstimatesID` INT,
        IN `EstimateNumber` VARCHAR(20), ## Assumed this column is a custom field (format and auto increment)
        IN `CustomerRef` VARCHAR(20) ,
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
        UPDATE Estimates 
			SET EstimateNumber = EstimateNumber,
			CustomerRef = CustomerRef,
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
            WHERE ID = EstimatesID  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteEstimatesById*/
DROP PROCEDURE IF EXISTS `sp_DeleteEstimatesById`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteEstimatesById` (
        IN `EstimatesID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Estimates WHERE ID = EstimatesID  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
