DELIMITER $$
    -- REPLACE WITH CREATE STORED PROCEDURE STATEMENT --
    BEGIN
        -- Validate input parameters
        IF SecurityTenantId IS NULL OR SecurityCompanyId IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid tenant filter input parameters';
        END IF;

        -- Query with tenant and company filters
        -- REPLACE WITH STORED PROCEDURE --
    END$$

DELIMITER ;



-- Condition
--  AND TenantId=SecurityTenantId AND CompanyId=SecurityCompanyId;

-- Parameters
/*
        IN `SecurityTenantId` CHAR(36),
        IN `SecurityCompanyId` CHAR(36)
*/
