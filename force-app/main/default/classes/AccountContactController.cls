public with sharing class AccountContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsWithContacts() {
        return [
            SELECT Id, Name,
                   (SELECT Id, Name, Email FROM Contacts)
            FROM Account
            ORDER BY Name ASC   
            LIMIT 20
        ];
    }
}