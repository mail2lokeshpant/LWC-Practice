public class QSYD_addressMapController {
    @AuraEnabled
    public static List<Sales_Evidence__c> findRelated(String workOrderId) {
        return [SELECT Id, 
                Name, 
                Address__c,
                Price__c,
                Comparison__c, 
                Date_sold__c, 
                Land_m2__c,
                Valuation__c,
                Location__Latitude__s,
                Location__Longitude__s 
                FROM Sales_Evidence__c
                WHERE Location__Latitude__s != NULL 
                AND Location__Longitude__s != NULL
                AND Valuation__c = :workOrderId];
    }
    @AuraEnabled
    public static List<Sales_Evidence__c> findAll() {
        return [SELECT Id, 
                Name, 
                Address__c,
                Price__c,
                Comparison__c, 
                Date_sold__c, 
                Land_m2__c,
                Valuation__c,
                Location__Latitude__s,
                Location__Longitude__s 
                FROM Sales_Evidence__c
                WHERE Location__Latitude__s != NULL 
                AND Location__Longitude__s != NULL];
    }
    @AuraEnabled
    public static Sales_Evidence__c updateSalesEvidence(String propertyId, String salesEvidenceId) {
        system.debug('propertyId: ' + propertyId);
        system.debug('salesEvidenceId: ' + salesEvidenceId);
        Sales_Evidence__c record = [SELECT Id, Address__c, Valuation__c FROM Sales_Evidence__c WHERE Id = :salesEvidenceId];
        record.Valuation__c = propertyId;
        update record;
        return record;
    }
    /*@AuraEnabled
    public static List<Account> findAll() {
        return [SELECT id, name, Location__Latitude__s, Location__Longitude__s
                FROM Account
                WHERE Location__Latitude__s != NULL AND Location__Longitude__s != NULL
                LIMIT 50];
    }*/
}