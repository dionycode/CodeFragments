/*sp_CreateContacts*/
DROP PROCEDURE IF EXISTS `sp_CreateContacts`;

DELIMITER $$
    CREATE PROCEDURE `sp_CreateContacts`(
        IN `CustomerId` INT, 
        IN `Firstname` VARCHAR(50),
        IN `Lastname` VARCHAR(50),
        IN `Email` VARCHAR(100),
        IN `Phone` VARCHAR(20),
        IN `Fax` VARCHAR(20),
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
        INSERT INTO Contacts(
                CustomerId, 
                Firstname, 
                Lastname, 
                Email, 
                Phone, 
                Fax, 
                IsActive, 
                CreatedBy, 
                DateCreated,
                TenantId,
                CompanyId) 
            VALUES (
                CustomerId, 
                Firstname, 
                Lastname, 
                Email, 
                Phone, 
                Fax, 
                IsActive, 
                CreatedBy, 
                DateCreated,
                SecurityTenantId,
                SecurityCompanyId);

        SELECT LAST_INSERT_ID();
    END$$

DELIMITER ;


/*sp_GetContactsById*/
DROP PROCEDURE IF EXISTS `sp_GetContactsById`;

DELIMITER $$
    CREATE PROCEDURE `sp_GetContactsById`(
        IN `ContactId` INT,
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
            CustomerId,
            Firstname,
            Lastname,
            Email,
            Phone,
            Fax,
            IsActive,
            CreatedBy,
            DateCreated,
            UpdatedBy,
            DateUpdated            
        FROM Contacts WHERE ID=ContactId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;


/*sp_UpdateContacts*/
DROP PROCEDURE IF EXISTS `sp_UpdateContacts`;

DELIMITER $$
    CREATE PROCEDURE `sp_UpdateContacts`(
        IN `CustomerId` INT, 
        IN `Firstname` VARCHAR(50),
        IN `Lastname` VARCHAR(50),
        IN `Email` VARCHAR(100),
        IN `Phone` VARCHAR(20),
        IN `Fax` VARCHAR(20),
        IN `IsActive` TINYINT(1), 
        IN `UpdatedBy` LONGTEXT, 
        IN `DateUpdated` DATETIME(6), 
        IN `ContactId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        UPDATE Contacts SET 
            CustomerId = CustomerId, 
            Firstname = Firstname, 
            Lastname = Lastname, 
            Email = Email, 
            Phone = Phone, 
            Fax = Fax, 
            IsActive = IsActive, 
            UpdatedBy = UpdatedBy, 
            DateUpdated = DateUpdated 
            WHERE ID=ContactId  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;

/*sp_DeleteContacts*/
DROP PROCEDURE IF EXISTS `sp_DeleteContacts`;

DELIMITER $$
    CREATE PROCEDURE `sp_DeleteContacts`(
        IN `ContactId` INT,
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36))
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        DELETE FROM Contacts WHERE Id=ContactId AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;
    END$$

DELIMITER ;
