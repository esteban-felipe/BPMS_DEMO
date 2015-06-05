jsx3.lang.Package.definePackage(
  "eg.productService",                //the full name of the package to create
  function(productService) {          //name the argument of this function

    //call this method to begin the service call (eg.service.callRecieve_query();)
    productService.callRecieve_query = function() {
      var objService = SalesOrderForm.loadResource("productListMapping_xml");
      objService.setEndpointURL(SalesOrderForm.intalioEndpoint + "integration/GetProductList/Query/consumer");
      objService.setOperation("Recieve_query");

      //subscribe
      objService.subscribe(jsx3.net.Service.ON_SUCCESS, productService.onRecieve_querySuccess);
      objService.subscribe(jsx3.net.Service.ON_ERROR, productService.onRecieve_queryError);
      objService.subscribe(jsx3.net.Service.ON_INVALID, productService.onRecieve_queryInvalid);

      //PERFORMANCE ENHANCEMENT: uncomment the following line of code to use XSLT to convert the server response to CDF (refer to the API docs for jsx3.net.Service.compile for implementation details)
      //objService.compile();

      //call the service
      objService.doCall();
    };
    productService.test = function(){
         jsx3.log(SalesOrderForm.intalioEndpoint);
    }
    productService.onRecieve_querySuccess = function(objEvent) {
     //var responseXML = objEvent.target.getInboundDocument();
     var control = SalesOrderForm.getJSXByName("productSelect");
     var resource = SalesOrderForm.loadResource("productListTransform_xsl");
     var xslTransform = new jsx3.xml.XslDocument();
     xslTransform.loadXML(resource.getXML());
     var doc = new jsx3.xml.Document();
     doc.loadXML(SalesOrderForm.getCache().getDocument("productList").getXML());
     var transformedDoc = xslTransform.transform(doc);
     var cacheDoc = new jsx3.xml.Document();
     cacheDoc.loadXML(transformedDoc);
     SalesOrderForm.getCache().setDocument("productCombo", cacheDoc);
    };

    productService.onRecieve_queryError = function(objEvent) {
      var myStatus = objEvent.target.getRequest().getStatus();
      objEvent.target.getServer().alert("Error","The service call failed. The HTTP Status code is: " + myStatus);
    };

    productService.onRecieve_queryInvalid = function(objEvent) {
      objEvent.target.getServer().alert("Invalid","The following message node just failed validation:\n\n" + objEvent.message);
    };

  }
);

