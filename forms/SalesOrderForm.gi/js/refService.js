/* place JavaScript code here */
jsx3.lang.Package.definePackage(
  "eg.refService",                //the full name of the package to create
  function(service) {          //name the argument of this function

    //call this method to begin the service call (eg.service.callGenerate_ID();)
    service.callGenerate_ID = function() {
      var objService = SalesOrderForm.loadResource("GenerateIdMapping_xml");
      objService.setEndpointURL(SalesOrderForm.intalioEndpoint + "system/SalesOrderIdGenerator/ID_Generator/ID_GeneratorimplicitPartner");
      objService.setOperation("Generate_ID");

      //subscribe
      objService.subscribe(jsx3.net.Service.ON_SUCCESS, service.onGenerate_IDSuccess);
      objService.subscribe(jsx3.net.Service.ON_ERROR, service.onGenerate_IDError);
      objService.subscribe(jsx3.net.Service.ON_INVALID, service.onGenerate_IDInvalid);

      //PERFORMANCE ENHANCEMENT: uncomment the following line of code to use XSLT to convert the server response to CDF (refer to the API docs for jsx3.net.Service.compile for implementation details)
      //objService.compile();

      //call the service
      objService.doCall();
    };

    service.onGenerate_IDSuccess = function(objEvent) {
      var responseXML = objEvent.target.getInboundDocument();
      SalesOrderForm.getServer().getJSXByName("Title").setText("Sales order " + responseXML.getFirstChild().getFirstChild().getValue()).repaint();
    };

    service.onGenerate_IDError = function(objEvent) {
      var myStatus = objEvent.target.getRequest().getStatus();
      objEvent.target.getServer().alert("Error","The service call failed. The HTTP Status code is: " + myStatus);
    };

    service.onGenerate_IDInvalid = function(objEvent) {
      objEvent.target.getServer().alert("Invalid","The following message node just failed validation:\n\n" + objEvent.message);
    };

  }
);

