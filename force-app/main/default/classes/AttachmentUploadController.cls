public with sharing class AttachmentUploadController {
    public Id recordId;

    public AttachmentUploadController() {
        
    }


    public AttachmentUploadController(ApexPages.StandardController controller) {
        //this.recordId = (Account)StandardController.getRecord().Id;
    }


public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }

  public PageReference upload() {
    system.debug(attachment.ContentType);
    attachment.OwnerId = UserInfo.getUserId();
    attachment.ParentId = recordId; // the record the file is attached to
 //   attachment.ParentId = ApexPages.currentPage().getParameters().get('id'); 
    attachment.IsPrivate = true;

    try {
      insert attachment;
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } finally {
      attachment = new Attachment(); 
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }

}