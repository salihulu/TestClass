public class AccountContactlari {
    public static INTEGER contactSayisi ( ID sorulanacakAccountIdsi ){
        
        List<Contact> cntList = [SELECT Id, AccountId FROM Contact WHERE AccountId =:sorulanacakAccountIdsi] ; 
        
        return cntList.size();
    }
    
    public static List<Contact> contactList ( ID sorulanacakAccountIdsi ){
        
        List<Contact> cntList = [SELECT Id, AccountId , name FROM Contact WHERE AccountId =:sorulanacakAccountIdsi] ; 
        
        return cntList;
    } 
    
    
    
}
@isTest
public class AccountContactlariTest {
    // ilk yontem canli sf databasi ile iletisime gecmektir  
    @isTest(SeeAllData = true)  //  tavsiye edilmiyor
    PRIVATE  static VOID contactSayisiTest(){
        
    //  INTEGER cntsayisi  =   AccountContactlari.contactSayisi ( '001Dp000004NXETIA4' );  / lutfen hardcode ID vermeyiniz
     
        Account acc = [Select id FROM account WHERE name='sForce' ];
      INTEGER cntsayisi  =   AccountContactlari.contactSayisi ( acc.id );   //  lutfen SF databasenine baglanmayin
        
        system.assertEquals(3, cntsayisi);
    }
    
    
}
//  option second
@isTest
public class AccountContactlariTest2 {
    
    // 2. yontem  zorda kalrisaniz yapiniz 
    @isTest 
    PRIVATE  static VOID contactSayisiTest(){
        Account acc = new Account();
        acc.Name= 'test';
        insert acc;
        
        Contact cnt = new Contact();
        cnt.LastName = 'test contact';
        cnt.AccountId = acc.id;
      
        insert cnt;
        
        
         Contact cnt2 = new Contact();
         cnt2.LastName = 'test contact2';
         cnt2.AccountId = acc.id;
      
         insert cnt2;
        
        
      INTEGER cntsayisi  =   AccountContactlari.contactSayisi ( acc.id );   //  lutfen SF databasenine baglanmayin
        
        system.assertEquals(3, cntsayisi);
    }
    
    
    // 2. yontem  zorda kalrisaniz yapiniz 
    @isTest 
    PRIVATE  static VOID contactListTest(){
        Account acc = new Account();
        acc.Name= 'test';
        insert acc;
        
        Contact cnt = new Contact();
        cnt.LastName = 'test contact';
        cnt.AccountId = acc.id;
      
        insert cnt;
        
        
         Contact cnt2 = new Contact();
         cnt2.LastName = 'test contact2';
         cnt2.AccountId = acc.id;
      
         insert cnt2;
        
        
      List<Contact> cntListesi  =   AccountContactlari.contactList ( acc.id );   //  lutfen SF databasenine baglanmayin
        
          
        system.assertEquals(3, cntListesi.size());
           
        
    }
}
