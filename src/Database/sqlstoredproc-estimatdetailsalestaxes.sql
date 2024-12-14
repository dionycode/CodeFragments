/*sp_CreateEstimateDetailSalesTaxes*/
DROP procedure IF EXISTS `sp_CreateEstimateDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateEstimateDetailSalesTaxes`(
        IN `EstimateDetailID` INT,
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
        INSERT INTO EstimateDetailSalesTaxes (
            EstimateDetailID, 
            Rate, 
            SalesTaxID, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
        VALUES (
            EstimateDetailID, 
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

/*sp_GetEstimateDetailSalesTaxesByID*/
DROP PROCEDURE IF EXISTS `sp_GetEstimateDetailSalesTaxesByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetEstimateDetailSalesTaxesByID` (
        IN `EstimateDetailSalesTaxID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))

    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT 
            Id,
            EstimateDetailID, 
            Rate,
            SalesTaxID, 		
            IsActive, 
            CreatedBy, 
            DateCreated,
            UpdatedBy,
            DateUpdated
            FROM EstimateDetailSalesTaxes 
            WHERE Id = EstimateDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateEstimateDetailSalesTaxes*/
DROP PROCEDURE IF EXISTS `sp_UpdateEstimateDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateEstimateDetailSalesTaxes` (
	    IN `EstimateDetailSalesTaxID` INT,
	    IN `EstimateDetailID` INT,
	    IN `Rate` DECIMAL(18, 2) ,
	    IN `SalesTaxID` INT ,	
	    IN `IsActive` TINYINT(1),
	    IN `UpdatedBy` LONGTEXT,
	    IN `DateUpdated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
		UPDATE EstimateDetailSalesTaxes SET 
            EstimateDetailID = EstimateDetailID, 
            Rate = Rate,
            SalesTaxID = SalesTaxID,        
            IsActive = IsActive,
            UpdatedBy = UpdatedBy,
            DateUpdated = DateUpdated
            WHERE Id = EstimateDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$
DELIMITER ;

/*sp_DeleteEstimateDetailSalesTaxes*/
DROP procedure IF EXISTS `sp_DeleteEstimateDetailSalesTaxes`;

DELIMITER $$
    CREATE PROCEDURE sp_DeleteEstimateDetailSalesTaxes (
        IN `EstimateDetailSalesTaxID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
	BEGIN
		DELETE FROM EstimateDetailSalesTaxes 
        WHERE ID = EstimateDetailSalesTaxID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    End$$
DELIMITER ;