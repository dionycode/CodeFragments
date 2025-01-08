/*sp_CreateProductSalesTax*/
DROP PROCEDURE IF EXISTS `sp_CreateProductSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateProductSalesTax`(
		IN `ProductId` INT,
		IN `SalesTaxID` INT,
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
        INSERT INTO ProductSalesTaxes(
			ProductId, 
			SalesTaxID, 
			CreatedBy, 
			DateCreated,
			TenantId,
			CompanyId) 
		VALUES (
			ProductId, 
			SalesTaxID, 
			CreatedBy, 
			DateCreated,
			SecurityTenantId,
			SecurityCompanyId);

		SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetProductsSaleTaxById*/
DROP PROCEDURE IF EXISTS `sp_GetProductSalesTaxById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetProductSalesTaxById`(
		IN `ProductTaxId` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT * FROM ProductSalesTaxes 
		WHERE ID=ProductTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateProductSalesTax*/
DROP PROCEDURE IF EXISTS `sp_UpdateProductSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateProductSalesTax`(
		IN `ProductId` INT,
		IN `SalesTaxID` INT,
		IN `UpdatedBy` LONGTEXT,
		IN `DateUpdated` DATETIME(6),
		IN `ProductSalesTaxId` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE ProductSalesTaxes SET 
			ProductId = ProductId, 
			SalesTaxID = SalesTaxID, 
			UpdatedBy = UpdatedBy, 
			DateUpdated = DateUpdated 
		WHERE ID=ProductSalesTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_DeleteProductSalesTax*/
DROP PROCEDURE IF EXISTS `sp_DeleteProductSalesTax`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteProductSalesTax`(
		IN `ProductSalesTaxId` INT,
		IN `SecurityTenantId` CHAR(36),
		IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM ProductSalesTaxes 
		WHERE Id=ProductSalesTaxId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
