/*
* This class is used for incoming and outgoing job request from Mulesoft.
*/
Public Class JobRequest{
    public string   requestType;
    public string   iValuationTypeID;
    public string   valuationSubTypeId;
    public string   bValuationPurpose;
    public string   department;
    public string   RPID;
    public string   sEMVSource;
    public decimal  mEMV;
    public string   BuildingName;
    public string   StreetNumber;
    public string   unitType;
    public string   unitNumber;
    public string   streetType;
    public string   suburbId;     
    public string   stateId;
    public string   postcodeId; 
    public string   countryId;
    public string   sAccessInfo;
    public string   sDeliveryPriority;
    public decimal  mValuationFees;
    public string   bInspectionNumber;
    public string   iPropertyTypeId;
    public decimal  bPercentageCompleted;
    public decimal  mConstructionContract;
    public decimal  mBalanceBF;
    public decimal  mSchedule;
    public string   bKerbSideID;
    public string   sXMLServicesJobID;
    public string   AccountNo;
    public string   bXMLServiceProviderID; 
    public string   sClientRef;
    public string   sClientRequirements;
    public string   iStatusID;
    public string   PreferredDate;
    public string   PreferredStartTime;
    public string   PreferredEndTime;
    public string   AcceptanceDueByDate;
    public string   AcceptanceDueByTime;
    
    public list<JobAttachments>attachments;
    public list<RelatedParties>relatedParties;
    
    // Milestone Data
    public string milestoneName;
    public decimal milestoneTimestamp; 
    
    // Client Settings
    public string communicationPath;
    public string documentationPath;
    
    
    /*
    * This class is used for job attachments.
    */
    public class JobAttachments{
        public string sRemoteURL;
        public string md5;
        public string fileName;
        public string iItemTypeId;
        public string tDocumentTypeId;
        public string documentId;
        public string documentType;
    }
    /*
    * This class is used for job related parties.
    */
    public class RelatedParties{
        public string relPartyType;
        public string uniqueID;
        public string companyName;
        public string relPartyDescription;
        public string email;
        public string firstName;
        public string surName;
        public list<Phones>Phones;
    }
    /*
    * This class is used to store the different Phones.
    */
    public class Phones{
        public string faxNumber;
        public string fixedPhone;
        public string mobile;
        public string phoneType; //Home Phone or Work Phone
    }
}