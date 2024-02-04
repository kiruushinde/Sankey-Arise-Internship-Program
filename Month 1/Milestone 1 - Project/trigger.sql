--use demohms;
 
-- Create a trigger to update InsuranceExpired flag and log expiration
CREATE TRIGGER CheckInsuranceExpiry
ON InsuranceLimits
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(expiryDate)
    BEGIN
        DECLARE @PatientID varchar(5);

        SELECT @PatientID = pid FROM INSERTED;

        IF (SELECT ExpiryDate FROM INSERTED) < GETDATE()
        BEGIN
            -- Insurance limit has expired
            UPDATE patient
            SET insuranceExpired = 1
            WHERE pid = @PatientID;

            -- Log the expiration event
            --INSERT INTO InsuranceExpiryLog (PatientID, ExpiryDate)
            --VALUES (@PatientID, (SELECT ExpiryDate FROM INSERTED));
        END
    END
END;


update InsuranceLimits
set expiryDate = '2024-01-13'
where pid = 'p1';

update InsuranceLimits
set expiryDate = '2024-01-15'
where pid = 'p2';

select * from InsuranceLimits;
select * from patient;