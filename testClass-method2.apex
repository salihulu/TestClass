//Class

public class accountContacts {
    
    public static integer contactNumber(id AccContactID){
        List<Contact> contList = [SELECT AccountId, Id FROM Contact WHERE AccountId =: AccContactID ];
         return contList.size();          
    }

}

//TestClass

@isTest
public class accountContactsTest {
    
    @isTest
    private static void ContactNumberTest(){
        
        Account acc = new Account();
        acc.Name = 'test';
        insert acc;
        
        Contact cnt1 = new Contact();
        cnt1.LastName = 'TestCnt1';
        cnt1.AccountId = acc.id;
        insert cnt1;
        
		Contact cnt2 = new Contact();
        cnt2.LastName = 'TestCnt2';
        cnt2.AccountId = acc.id;
        insert cnt2;        
        
        Integer ContactSayisi = accountContacts.contactNumber(acc.id);
        System.assertEquals(2, ContactSayisi);
    }
