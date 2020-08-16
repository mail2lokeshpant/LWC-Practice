trigger ContentDocLinkTrigger on ContentDocumentLink (before insert) {

set<Id>docId = new set<Id>();
string linkedId = '';
for(contentDocumentLink i:trigger.new){
linkedId = i.LinkedEntityId;//linkedId.add();
docId.add(i.ContentDocumentId);
}
list<contentVersion>CV = [select id,checksum from contentversion where ContentDocumentId in:docId];
system.debug(CV[0].checksum);
//system.debug();
WorkOrder wo = new WorkOrder(id=linkedId);
wo.Unique__c = CV[0].checksum;
update wo;
}