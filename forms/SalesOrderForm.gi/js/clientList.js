jsx3.lang.Package.definePackage(
  "eg.clientList",                //the full name of the package to create
  function(service) {          //name the argument of this function

    //call this method to begin the service call (eg.service.callRecieve_Request();)
    service.callRecieve_Request = function() {
      var objService = SalesOrderForm.loadResource("clientListMapping_xml");
      objService.setEndpointURL(SalesOrderForm.intalioEndpoint + "integration/GetClientList/Query/consumer");
      objService.setOperation("Recieve_Request");

      //subscribe
      objService.subscribe(jsx3.net.Service.ON_SUCCESS, service.onRecieve_RequestSuccess);
      objService.subscribe(jsx3.net.Service.ON_ERROR, service.onRecieve_RequestError);
      objService.subscribe(jsx3.net.Service.ON_INVALID, service.onRecieve_RequestInvalid);

      //PERFORMANCE ENHANCEMENT: uncomment the following line of code to use XSLT to convert the server response to CDF (refer to the API docs for jsx3.net.Service.compile for implementation details)
      //objService.compile();

      //call the service
      objService.doCall();
    };

    service.onRecieve_RequestSuccess = function(objEvent) {
      //var responseXML = objEvent.target.getInboundDocument();
//s      objEvent.target.getServer().alert("Success","The service call was successful.");
    };

    service.onRecieve_RequestError = function(objEvent) {
      var myStatus = objEvent.target.getRequest().getStatus();
      objEvent.target.getServer().alert("Error","The service call failed. The HTTP Status code is: " + myStatus);
    };

    service.onRecieve_RequestInvalid = function(objEvent) {
      objEvent.target.getServer().alert("Invalid","The following message node just failed validation:\n\n" + objEvent.message);
    };

  }
);

