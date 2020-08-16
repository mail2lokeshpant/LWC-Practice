({
    jsLoaded: function(component, event, helper) {
        var map = L.map('map', {zoomControl: false, tap: false})
        .setView([-37.792343, 144.994987], 18);
        L.tileLayer(
            'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
            {
                attribution: 'Tiles © Esri'
            }).addTo(map);
        component.set("v.map", map);
        
        $(document).ready(function(){
            $("div div div div div").on("click", '.tooltipButton', function () {
                var ID = $(this).attr("id");
                var value = $(this).attr("value");
                $(this).attr("value", "Added");
                //openSidebar(ID);
                console.log(ID);
                console.log(value);
                
                helper.callServer(
                    component,
                    "c.updateSalesEvidence",
                    function (response) {
                        console.log(response);
                        
                        var message = response.Address__c + " has been added as Sales Evidence";
                        
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            //"title": title,
                            "message": message,
                            "type": 'success',
                            "mode": 'dismissible'
                        });
                        toastEvent.fire();
                        $A.get('e.force:refreshView').fire();
                    },
                    { 
                        propertyId : component.get("v.recordId"),
                        salesEvidenceId : ID
                    }
                );       
            });     
        });
    },
    locationsLoaded: function(component, event, helper) {
        var recordId = component.get("v.recordId");
        
        helper.callServer(
            component,
            "c.findAll",
            function (response) {
                console.log(response);
                
                var orangeIcon = L.icon({
                    iconUrl: 'https://wbpvalue--c.na57.content.force.com/servlet/servlet.ImageServer?id=0150b000002oGQk&oid=00D0b000000vcBJ&lastMod=1537837702000',
                    
                    //iconSize:     [38, 95], // size of the icon
                    iconAnchor:   [12, 41], // point of the icon which will correspond to marker's location
                    popupAnchor:  [0, -38] // point from which the popup should open relative to the iconAnchor
                });
                
                // Add markers
                var map = component.get('v.map');
                var salesEvidences = event.getParam('salesEvidences');
                for (var i=0; i < response.length; i++) {
                    var salesEvidence = response[i];
                    var latLng = [salesEvidence.Location__Latitude__s, salesEvidence.Location__Longitude__s];
                    
                    // specify popup options 
                    var customOptions =
                        {
                            'maxWidth': '500',
                            'className' : 'mapMarker'
                        }
                    
                    // create popup contents
                    var customPopup = "<div class='tooltipContainer' name='tooltipContainer'>" +
                        "<h1 class='slds-box title'>" + salesEvidence.Address__c + "</h1>" +
                        "<div class='flex'><p><b>Sold:</b> " + salesEvidence.Date_sold__c + "</p>" +
                        "<p><b>Price:</b> $" + salesEvidence.Price__c + "</p>" +
                        "<p><b>Land:</b> " + salesEvidence.Land_m2__c + "</p>" +
                        "<p><b>Comparison:</b> " + salesEvidence.Comparison__c + "</p></div>" +
                        "<img src='https://wbpvalue--c.na57.content.force.com/servlet/servlet.ImageServer?id=0150b000002oEHM&oid=00D0b000000vcBJ&lastMod=1537766558000' />";
                    
                    if (salesEvidence.Valuation__c == recordId) {
                        customPopup += "<input class='slds-button slds-button_success slds-m-vertical_small slds-size_1-of-1 tooltipButton' type='button' value='Added' id='" + salesEvidence.Id + "' />" +
                            "</div>";
                        L.marker(latLng, {icon: orangeIcon}, {salesEvidence: salesEvidence}).bindPopup(customPopup, customOptions).addTo(map);
                    }
                    else {
                        customPopup += "<input class='slds-button slds-button_brand slds-m-vertical_small slds-size_1-of-1 tooltipButton' type='button' value='Add' id='" + salesEvidence.Id + "' />" +
                            "</div>";
                        L.marker(latLng, {salesEvidence: salesEvidence}).bindPopup(customPopup, customOptions).addTo(map);
                    }
                }
            },
            { 
                propertyId : recordId
            }
        );
    },
    propertySelected: function(component, event, helper) {
        // Center the map on the account selected in the list
        var map = component.get('v.map');
        var salesEvidence = event.getParam("salesEvidence");
        map.panTo([salesEvidence.Location__Latitude__s, salesEvidence.Location__Longitude__s]);
    }
})