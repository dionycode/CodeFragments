
/*Update sp_CreateCategory*/
DROP PROCEDURE IF EXISTS `sp_CreateCategory`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateCategory`(
        IN `Name` VARCHAR(100), 
        IN `ParentId` INT, 
        IN `Description` VARCHAR(200), 
        IN `Active` TINYINT, 
        IN `CreatedBy` LONGTEXT, 
        IN `DateCreated` DATETIME(6),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Insert data with tenant and company filters
        INSERT INTO Category(
                Name, 
                ParentId, 
                Description, 
                Active, 
                CreatedBy, 
                DateCreated,
                TenantId,
                CompanyId) 
            VALUES (
                Name, 
                ParentId, 
                Description, 
                Active, 
                CreatedBy, 
                DateCreated,
                SecurityTenantId,
                SecurityCompanyId);
        SELECT LAST_INSERT_ID();
    END$$
DELIMITER ;

/*Update sp_GetCategoryById*/
DROP PROCEDURE IF EXISTS `sp_GetCategoryById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCategoryById`(
        IN `CategoryId` INT,
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
            Name,
            ParentId,
            Description
            Active,
            CreatedBy,
            UpdatedBy,
            DateCreated,
            DateUpdated
        FROM Category 
        WHERE ID=CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*Update sp_GetCategoryByName*/
DROP PROCEDURE IF EXISTS `sp_GetCategoryByName`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCategoryByName`(
        IN `CategoryName` VARCHAR(100)    ,
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
            Name,
            ParentId,
            Description
            Active,
            CreatedBy,
            UpdatedBy,
            DateCreated,
            DateUpdated 
        FROM Category 
        WHERE Name=CategoryName AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*Update sp_GetCategoryIsUniqueName*/
DROP PROCEDURE IF EXISTS `sp_GetCategoryIsUniqueName`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCategoryIsUniqueName`(
        IN `CategoryId` INT, 
        IN `CategoryName` VARCHAR(100),
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        SELECT CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END as IsUnique 
        FROM Category 
        WHERE Id!=CategoryId AND 
            TenantId=SecurityTenantId AND 
            CompanyId=SecurityCompanyId AND 
            Name=CategoryName;
    END$$

DELIMITER ;


/*Update sp_UpdateCategory*/
DROP PROCEDURE IF EXISTS `sp_UpdateCategory`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateCategory`(
        IN `Name` VARCHAR(100), 
        IN `ParentId` INT, 
        IN `Description` VARCHAR(200), 
        IN `Active` TINYINT, 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `CategoryId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Category SET 
            Name = Name, 
            ParentId = ParentId, 
            Description = Description, 
            Active = Active, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated 
        WHERE ID=CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*Update sp_DeleteCategory*/
DROP PROCEDURE IF EXISTS `sp_DeleteCategory`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteCategory`(
        IN `CategoryId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Category 
        WHERE Id = CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*Update sp_GetCategoryDescendants*/
DROP PROCEDURE IF EXISTS `sp_GetCategoryDescendants`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetCategoryDescendants`(
        IN `CategoryId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        WITH RECURSIVE Descendants AS (
            SELECT *
            FROM Category
            WHERE Id = CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId

            UNION ALL

            SELECT c.*
            FROM Category c
            INNER JOIN Descendants d ON c.ParentId = d.Id AND c.TenantId=SecurityTenantId AND c.CompanyId=SecurityCompanyId
        )
        SELECT * FROM Descendants WHERE Id <> CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*Update sp_GetCategoryNonDescendants*/
DROP PROCEDURE IF EXISTS `sp_GetCategoryNonDescendants`;


DELIMITER $$
    CREATE PROCEDURE `sp_GetCategoryNonDescendants`(
        IN `CategoryId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        WITH RECURSIVE Descendants AS (
            SELECT *
            FROM Category
            WHERE Id = CategoryId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId

            UNION ALL

            SELECT c.*
            FROM Category c
            INNER JOIN Descendants d ON c.ParentId = d.Id AND c.TenantId=SecurityTenantId AND c.CompanyId=SecurityCompanyId
        )
        SELECT * FROM Category WHERE TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId AND Id NOT IN (SELECT Id FROM Descendants);
    END$$

DELIMITER ;
