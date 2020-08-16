public class DocumentComponentController 
{
    
    //this method is used for the demand letter pdf generate.
    @AuraEnabled
    public static string ViewDemandLetterDocs(String attName)
    {
              /* attName=attName+'.pdf';
               Attachment objDoc=[SELECT Name,Body from Attachment WHERE id='00P7F0000091bXF']; 
               Blob blobBody=objDoc.Body;*/
             HttpRequest req = new HttpRequest();
             req.setEndpoint('http://saasfocusapi.uat.resimac.com.au/api/DownloadAppFormFile/123');
             req.setMethod('GET');
             Http http = new Http();
             HTTPResponse res = http.send(req);
             Blob blobBody=res.getBodyAsblob();
             String pdfString=EncodingUtil.base64Encode(blobBody);
             return pdfString;
    }
    
}