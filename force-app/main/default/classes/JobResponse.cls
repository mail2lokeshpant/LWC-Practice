Public Class JobResponse{
    public JobResponse(){
        JobRequest objRequest            = new JobRequest();
        objRequest.requestType           = 'Val_Request_Creation';
        objRequest.iValuationTypeID      = 'DesktopAppraisal';
        objRequest.valuationSubTypeId    = 'Standard';
        objRequest.bValuationPurpose     = 'Family Law'; 
        objRequest.department            = 'RESIDENTIAL VALUATION';
        objRequest.RPID                  = '17883290';
        objRequest.sEMVSource            = 'ContractPrice'; 
        objRequest.mEMV                  =  100000; 
        objRequest.BuildingName          =  'Test Building'; 
        objRequest.StreetNumber          =  '17-19';
        objRequest.unitType              =  'UNIT'; 
        objRequest.unitNumber            =  '22';    
        objRequest.streetType            =  'STREET'; 
        objRequest.suburbId              =  'CLAYTON';
        objRequest.stateId               =  'VIC';
        objRequest.postcodeId            =  '3011'; 
        objRequest.countryId             =  'Australia'; 
        objRequest.sAccessInfo           =  'Test Access information'; 
        objRequest.sDeliveryPriority     =  'Normal';
        objRequest.mValuationFees        =  200.00; 
        objRequest.bInspectionNumber     =  '01';
        objRequest.iPropertyTypeId       =  'Progress - Final';
        objRequest.bPercentageCompleted  =  0;
        objRequest.mConstructionContract =  188734;
        objRequest.mBalanceBF            =  0;
        objRequest.mSchedule             =  0;
        objRequest.bKerbSideID           =  'Single Point Value';
        objRequest.sXMLServicesJobID     =  '11524269';
        objRequest.AccountNo             =  '11524269';
        objRequest.bXMLServiceProviderID =  'PSG'; 
        objRequest.sClientRef            =  '50513823';
        objRequest.sClientRequirements   =  'Test Client Comments'; 
        objRequest.iStatusID             =  'Inquiring';
        objRequest.PreferredDate         =  '2019-05-28'; 
        objRequest.PreferredStartTime    =  '10:00:00';
        objRequest.PreferredEndTime      =  '12:00:00';
        objRequest.AcceptanceDueByDate   =  '2019-05-27';
        objRequest.AcceptanceDueByTime   =  '12:10:28+10:00'; 
        objRequest.attachments        =  new List<JobRequest.JobAttachments>();
        for(integer i=0;i<3;i++){
                JobRequest.JobAttachments att    = new JobRequest.JobAttachments();
                    att.sRemoteURL               = 'https://test.test.com.au/utils/getdoc.php?doc_id=00288&amp;md5=1f26f16d02fc1e1a896322c3465345345';
                    att.md5                      = '1f26f16d02fc1e1a896322c3465345345'; 
                    att.fileName                 = 'Testdoc'+i+'.pdf'; 
                    att.iItemTypeId              = 'Standing Instructions';
                    att.tDocumentTypeId          = 'BuildingContract'+' '+i;
                    att.documentId               = 'D-0000000'+i;
                    att.documentType             = 'Contract of Sale/Tender';
                
                objRequest.attachments.add(att);
        } 
        objRequest.relatedParties = new list<JobRequest.RelatedParties>();
        for(integer i=0;i<3;i++){
            JobRequest.RelatedParties rel      = new JobRequest.RelatedParties();
            rel.relPartyType                   = 'ValuationFirm';
            rel.uniqueID                       = 'V-51';  
            rel.companyName                    = 'test  Group Pty Ltd-VIC';
            rel.relPartyDescription            = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante,';
            rel.email                          = 'test@test.com';
            rel.firstName                      = 'test';
            rel.surName                        = 'testing';
            rel.Phones                         = new list<JobRequest.Phones>();
            JobRequest.Phones Workphone = new JobRequest.Phones();
                Workphone.faxNumber  = '000000000000';    
                Workphone.fixedPhone = '000000000000';
                Workphone.mobile     = '000000000000';
                Workphone.phoneType  = 'WorkPhone';
            rel.Phones.add(Workphone);  
                
            JobRequest.Phones Homephone = new JobRequest.Phones();
                Homephone.faxNumber  = '000000000000';
                Homephone.fixedPhone = '000000000000';
                Homephone.mobile     = '000000000000';
                Homephone.phoneType  = 'HomePhone'; 
            rel.Phones.add(Homephone); 
            objRequest.relatedParties.add(rel);
        }
        
        //For Milestone
        objRequest.milestoneName = 'accepted';
        objRequest.milestoneTimestamp = 1559520000;
        
        //For client Settings
        objRequest.communicationPath = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ';
        objRequest.documentationPath = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ';
        system.debug(JSON.serialize(objRequest));
    }
}