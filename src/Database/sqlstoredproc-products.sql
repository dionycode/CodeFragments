/*sp_CreateProduct*/
DROP PROCEDURE IF EXISTS `sp_CreateProduct`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateProduct`(
		IN `Name` VARCHAR(100),
		IN `Description` VARCHAR(200),
		IN `CategoryID` INT,
		IN `Price` DECIMAL(18,2),
		IN `IsSales` TINYINT(1),
		IN `IsPurchase` TINYINT(1),
		IN `IsActive` TINYINT(1),
		IN `IncomeAccountID` INT,
		IN `ExpenseAccountID` INT,
		IN `ProductSalesTaxID` INT,
		IN `AccountID` INT,
		IN `CreatedBy` VARCHAR(50), 
		IN `DateCreated` DATETIME(6),
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        INSERT INTO Products(
			Name, 
			Description, 
			CategoryID, 
			Price, 
			IsSales, 
			IsPurchase, 
			IsActive, 
			IncomeAccountID, 
			ExpenseAccountID, 
			ProductSalesTaxID, 
			AccountID, 
			CreatedBy, 
			DateCreated,
            TenantId,
            CompanyId) 
		VALUES (
			Name, 
			Description, 
			CategoryID, 
			Price, 
			IsSales, 
			IsPurchase, 
			IsActive, 
			IncomeAccountID, 
			ExpenseAccountID, 
			ProductSalesTaxID, 
			AccountID, 
			CreatedBy, 
			DateCreated,
            SecurityTenantId,
            SecurityCompanyId);
		
		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetProductById*/
DROP PROCEDURE IF EXISTS `sp_GetProductById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetProductById`(
		IN `ProductId` INT,
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
			Name, 
			Description, 
			CategoryID, 
			Price, 
			IsSales, 
			IsPurchase, 
			IsActive, 
			IncomeAccountID, 
			ExpenseAccountID, 
			ProductSalesTaxID, 
			AccountID, 
			CreatedBy, 
			DateCreated, 			
			UpdatedBy,
			DateUpdated 
		FROM Products 
		WHERE ID=ProductId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateProduct*/
DROP PROCEDURE IF EXISTS `sp_UpdateProduct`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateProduct`(
		IN `Name` VARCHAR(100),
		IN `Description` VARCHAR(200),
		IN `CategoryID` INT,
		IN `Price` DECIMAL(18,2),
		IN `IsSales` TINYINT(1),
		IN `IsPurchase` TINYINT(1),
		IN `IsActive` TINYINT(1),
		IN `IncomeAccountID` INT,
		IN `ExpenseAccountID` INT,
		IN `ProductSalesTaxID` INT,
		IN `AccountID` INT,
		IN `UpdatedBy` VARCHAR(50), 
		IN `DateUpdated` DATETIME(6),
		IN `ProductId` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Products SET 
			Name = Name, 
			Description = Description, 
			CategoryID = CategoryID, 
			Price = Price, 
			IsSales = IsSales, 
			IsPurchase = IsPurchase, 
			IsActive = IsActive, 
			IncomeAccountID = IncomeAccountID, 
			ExpenseAccountID = ExpenseAccountID, 
			ProductSalesTaxID = ProductSalesTaxID, 
			AccountID = AccountID, 
			UpdatedBy = UpdatedBy, 
			DateUpdated = DateUpdated 
		WHERE ID=ProductId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteProduct*/
DROP PROCEDURE IF EXISTS `sp_DeleteProduct`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteProduct`(
		IN `ProductId` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Products 
		WHERE Id=ProductId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
