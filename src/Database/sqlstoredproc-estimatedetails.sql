/*sp_CreateEstimateDetails*/
DROP PROCEDURE IF EXISTS `sp_CreateEstimateDetails`;

DELIMITER $$
     CREATE PROCEDURE `sp_CreateEstimateDetails`(
        IN `EstimateID` INT,
        IN `ProductID` INT ,
        IN `Description` VARCHAR(200),
        IN `Quantity` INT ,
        IN `Price` DECIMAL(18,2),
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
        INSERT INTO EstimateDetails (
            EstimateID, 
            ProductID, 
            Description, 
            Quantity, 
            Price, 
            IsActive, 
            CreatedBy, 
            DateCreated,
            TenantId,
            CompanyId)
            VALUES (
                EstimateID, 
                ProductID, 
                Description, 
                Quantity, 
                Price, 
                IsActive, 
                CreatedBy, 
                DateCreated,
                SecurityTenantId,
                SecurityCompanyId);
        
        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;

/*sp_GetEstimateDetailsByID*/
DROP PROCEDURE IF EXISTS `sp_GetEstimateDetailsByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetEstimateDetailsByID` (
        IN `EstimateDetailsID` int,
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
            EstimateID, 
            ProductID, 
            Description,
            Quantity, Price,
            IsActive, 
            CreatedBy, 
            DateCreated,
            UpdatedBy,
            DateUpdated
            FROM EstimateDetails 
            WHERE ID = EstimateDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateEstimateDetailsByID*/
DROP PROCEDURE IF EXISTS `sp_UpdateEstimateDetailsByID`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateEstimateDetailsByID` (
        IN `EstimateDetailsID` INT,
        IN `EstimateID` INT,
        IN `ProductID` INT ,
        IN `Description` VARCHAR(200),
        IN `Quantity` INT ,
        IN `Price` DECIMAL(18,2) ,
        IN `IsActive` TINYINT(1),
        IN `UpdatedBy` LONGTEXT,
        IN `DateUpdated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36)
	)
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE EstimateDetails SET
	    EstimateID = EstimateID, 
        ProductID = ProductID, 
        Quantity = Quantity, 
        Price = Price, 
        IsActive = IsActive,
        UpdatedBy = UpdatedBy,
        DateUpdated = DateUpdated
        WHERE ID = EstimateDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_DeleteEstimateDetailsByID*/
DROP PROCEDURE IF EXISTS `sp_DeleteEstimateDetailsByID`;

DELIMITER $$
    CREATE PROCEDURE sp_DeleteEstimateDetailsByID (
        IN `EstimateDetailsID` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM EstimateDetails WHERE ID = EstimateDetailsID AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
