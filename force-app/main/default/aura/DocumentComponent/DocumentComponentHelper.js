({
	goToPDF : function(component, event, PDFData){
		$A.createComponent(
            "c:PDFViewer",
             {
                 "pdfData": PDFData
             },
             function(PDFViewer, status, errorMessage){
                 if (status === "SUCCESS") {
                    var pdfContainer = component.get("v.pdfContainer");
                     pdfContainer.push(PDFViewer);
                     component.set("v.pdfContainer", pdfContainer);
                     var popUp = component.find("PoPShow");
                     $A.util.removeClass(popUp, 'hidePopup');
                 }
                 else if (status === "INCOMPLETE") {
                     console.log("No response from server or client is offline.");
                 }
                 else if (status === "ERROR") {
                     console.log("Error: " + errorMessage);
                 }
          }
		);	
	},
    // show loading gif
    showSpinner : function (component){
        component.set("v.showWaitingIcon" ,true);  
    },    
    // hide loading gif
    hideSpinner : function (component){
        component.set("v.showWaitingIcon" ,false);  
    }

})