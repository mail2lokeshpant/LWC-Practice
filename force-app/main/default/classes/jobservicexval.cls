@RestResource(urlMapping='/jobservicexval/*')
global with sharing class jobservicexval{

   @HttpGet
    global static void doGet() {
       map<string,list<Account>>mapaccount = new map<string,list<Account>>();
       mapaccount.put('Accountlist',[select id from account]);
       WrapperAccount obj = new WrapperAccount();
       obj.mapaccount = mapaccount;
       RestContext.response.addHeader('Content-Type','application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(mapaccount));
    }
       
    
    
    class WrapperAccount{
       public map<string,list<Account>>mapaccount;
       WrapperAccount(){
            mapaccount = new map<string,list<Account>>();
       }
    }
}