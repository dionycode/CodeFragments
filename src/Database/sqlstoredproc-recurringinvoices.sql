/*sp_CreateRecurringInvoice*/
DROP PROCEDURE IF EXISTS `sp_CreateRecurringInvoice`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateRecurringInvoice` (
		IN `RecurringInvoiceNumber` VARCHAR(20),
		IN `PONumber` VARCHAR(20),
		IN `Date` DATETIME,
		IN `PaymentDueDate` INT ,
		IN `Notes` VARCHAR(200),
		IN `Status` INT ,
		IN `CustomerID` INT ,
		IN `ContactID` INT ,
		IN `ShippingAddressID` INT ,
		IN `BillingAddressID` INT ,
		IN `RepeatType` INT ,
		IN `WeekdaySchedule` INT ,
		IN `MonthdaySchedule` INT ,
		IN `MonthSchedule` INT ,
		IN `CustomRepeatInterval` INT ,
		IN `CustomIntervalType` INT ,
		IN `FirstInvoiceDate` DATETIME,
		IN `RecurrenceEndType` INT ,
		IN `RecurrenceEndAfter` INT ,
		IN `RecurrenceEndOn` DATETIME ,
		IN `Timezone` VARCHAR(100),
		IN `IsActive` TINYINT(1) ,
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
        INSERT INTO RecurringInvoices (
			RecurringInvoiceNumber, 
			PONumber, 
			Date, 
			PaymentDueDate, 
			Notes, 
			Status, 
			CustomerID, 
			ContactID, 
			ShippingAddressID, 
			BillingAddressID,
			RepeatType, 
			WeekdaySchedule, 
			MonthdaySchedule, 
			MonthSchedule, 
			CustomRepeatInterval, 
			CustomIntervalType, 
			FirstInvoiceDate, 
			RecurrenceEndType, 
			RecurrenceEndAfter, 
			RecurrenceEndOn, 
			Timezone, 
			IsActive, 
			CreatedBy, 
			DateCreated,
			TenantId,
			CompanyId) 
		VALUES (
			RecurringInvoiceNumber, 
			PONumber, 
			Date, 
			PaymentDueDate, 
			Notes, 
			Status, 
			CustomerID, 
			ContactID, 
			ShippingAddressID, 
			BillingAddressID,
			RepeatType, 
			WeekdaySchedule, 
			MonthdaySchedule, 
			MonthSchedule, 
			CustomRepeatInterval, 
			CustomIntervalType, 
			FirstInvoiceDate, 
			RecurrenceEndType, 
			RecurrenceEndAfter, 
			RecurrenceEndOn, 
			Timezone, 
			IsActive, 
			CreatedBy, 
			DateCreated,
			SecurityTenantId,
			SecurityCompanyId);

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetRecurringInvoiceByID*/
DROP PROCEDURE IF EXISTS `sp_GetRecurringInvoiceByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetRecurringInvoiceByID` (
		IN `RecurringInvoiceID` INT,
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
			RecurringInvoiceNumber, 
			PONumber, 
			Date, 
			PaymentDueDate, 
			Notes, 
			Status, 
			CustomerID, 
			ContactID, 
			ShippingAddressID, 
			BillingAddressID,
			RepeatType, 
			WeekdaySchedule, 
			MonthdaySchedule, 
			MonthSchedule, 
			CustomRepeatInterval, 
			CustomIntervalType, 
			FirstInvoiceDate, 
			RecurrenceEndType, 
			RecurrenceEndAfter, 
			RecurrenceEndOn, 
			Timezone, 
			IsActive, 
			CreatedBy, 
			DateCreated, 
			UpdatedBy, 
			DateUpdated
		FROM RecurringInvoices
		WHERE ID = RecurringInvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateRecurringInvoice*/
DROP PROCEDURE IF EXISTS `sp_UpdateRecurringInvoice`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateRecurringInvoice` (
		IN `RecurringInvoiceID` INT,
		IN `RecurringInvoiceNumber` VARCHAR(20),
		IN `PONumber` VARCHAR(20),
		IN `Date` DATETIME,
		IN `PaymentDueDate` INT ,
		IN `Notes` VARCHAR(200),
		IN `Status` INT ,
		IN `CustomerID` INT ,
		IN `ContactID` INT ,
		IN `ShippingAddressID` INT ,
		IN `BillingAddressID` INT ,
		IN `RepeatType` INT ,
		IN `WeekdaySchedule` INT ,
		IN `MonthdaySchedule` INT ,
		IN `MonthSchedule` INT ,
		IN `CustomRepeatInterval` INT ,
		IN `CustomIntervalType` INT ,
		IN `FirstInvoiceDate` DATETIME,
		IN `RecurrenceEndType` INT ,
		IN `RecurrenceEndAfter` INT ,
		IN `RecurrenceEndOn` DATETIME ,
		IN `Timezone` VARCHAR(100),
		IN `IsActive` TINYINT(1) ,
		IN `UpdatedBy` VARCHAR(50) ,
		IN `DateUpdated` DATETIME(6),
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE RecurringInvoices SET
			RecurringInvoiceNumber = RecurringInvoiceNumber,
			PONumber = PONumber,
			Date = Date,
			PaymentDueDate = PaymentDueDate,
			Notes = Notes,
			Status = Status,
			CustomerID = CustomerID,
			ContactID = ContactID,
			ShippingAddressID = ShippingAddressID,
			BillingAddressID = BillingAddressID,
			RepeatType = RepeatType,
			WeekdaySchedule = WeekdaySchedule,
			MonthdaySchedule = MonthdaySchedule,
			MonthSchedule = MonthSchedule,
			CustomRepeatInterval = CustomRepeatInterval,
			CustomIntervalType = CustomIntervalType,
			FirstInvoiceDate = FirstInvoiceDate,
			RecurrenceEndType = RecurrenceEndType,
			RecurrenceEndAfter = RecurrenceEndAfter,
			RecurrenceEndOn = RecurrenceEndOn,
			Timezone = Timezone,
			IsActive = IsActive,
			UpdatedBy = UpdatedBy,
			DateUpdated = DateUpdated
		WHERE ID = RecurringInvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteRecurringInvoice*/
DROP PROCEDURE IF EXISTS `sp_DeleteRecurringInvoice`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteRecurringInvoice` (
		IN `RecurringInvoiceID` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM RecurringInvoices 
		WHERE ID = RecurringInvoiceID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
