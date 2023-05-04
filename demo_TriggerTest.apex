// AccountTrigger -> Trigger

trigger accountTrigger on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
 
    SWITCH on Trigger.operationType {
       WHEN BEFORE_INSERT {
           for(Account acc : trigger.new){
               acc.name = acc.name + ' Inserted';
               
           }

       }
       WHEN BEFORE_UPDATE { 
           for(Account acc : trigger.new){
               acc.name = acc.name + ' Updated';
               
           }

       }

   }
}

//DataFactory -> Class
@isTest
public class DataFactory {
    Public static Account  createAccount(){
        Account acc = new Account();
        acc.name='test';
        acc.Phone = '132165161';
        acc.Fax = 'kasdfsjaf';
        
        return acc;
    }
    
    
    public static contact createContact(){
        Contact cnt = new Contact();
        cnt.LastName ='soyisim';
        
        return cnt;
            
        
    }
  
    public static Opportunity createOpp(){
        Opportunity opp = new Opportunity();
        opp.name = 'test Opp';
        opp.StageName = 'Qualification';
        opp.CloseDate = date.today() + 3 ;
        
        return opp;
    }
    
}

//AccountTriggerTest
@isTest
public class accountTriggerTest {
    
    //Account insert edildiginde calisan triggerin before insert kisminin testi
    @isTest
    static void beforeInsertTest(){
        Account acc = Datafactory.createAccount();
        acc.Name = 'armut';
        insert acc;
        
        Account yeniAcc = [SELECT id, name FROM Account WHERE id=: acc.Id];
        
        System.assertEquals('armut Inserted', yeniAcc.name);
        System.assertNotEquals('armut', yeniAcc.name);
    }
    
    
    @isTest
    static void beforeUpdateTest(){
        Account acc = Datafactory.createAccount();
        acc.Name = 'armut';
        insert acc;
        
        Account yeniAcc = [SELECT id, name FROM Account WHERE id=: acc.Id];
        yeniAcc.Name = 'degisti';
        update yeniAcc;
        
        Account sonAcc = [SELECT id, name FROM Account WHERE id=: acc.Id];
        
        System.assertEquals('degisti Updated', sonAcc.name);
        System.assertNotEquals('armut', sonAcc.name);
    }

}
