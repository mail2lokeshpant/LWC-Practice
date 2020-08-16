Public Class JobIncomingRequest{
public string iValuationTypeID;
public dateTime valuationDate;
public string ValuationSubTypeId;
public string iValuationReasonID;
public string bValuationPurposeID;
public Time valuationTime;
public string RPID;
public string sEMVSource;
public decimal mEMV;
public string BuildingName;
public string StreetNumber;
public string unitType;
public string unitNumber;
public string streetTypeId;
public string suburbId;     
public string stateId;
public string postcodeId; 
public string countryId;
public string sAccessInfo;
public string sDeliveryPriority;
public decimal mValuationFees;
public list<JobDocuments>documents;
public string bInspectionNumber;
public string iPropertyTypeId;
public string bPercentageCompleted;
public string mConstructionContract;
public string mBalanceBF;
public string mSchedule;


public class JobDocuments{
   public string jobId; 
   public string documentId;
   public string documentType;
}

}