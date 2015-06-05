/* place JavaScript code here */
SalesOrderForm.intalioEndpoint = "http://bpms.local:8080/intalio/ode/processes/BPMS_DEMO/processes/";
jsx3.lang.Package.definePackage("eg.service",function(srv) {
    srv.callDataServices = function(){
        SalesOrderForm.getJSXByName("OrderDate").setValue(new Date());
        server.getJSXByName("Client").setValue().repaint();
        server.getJSXByName("OrderRef").setText().repaint();
        server.getJSXByName("clientName").setText().repaint();
        server.getJSXByName("contactName").setText().repaint();
        server.getJSXByName("contactPhone").setText().repaint();
        server.getJSXByName("contactEmail").setText().repaint();
        server.getJSXByName("clientDialog").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);  
        server.getJSXByName("productSelect").setValue().repaint(); 
        server.getJSXByName("GlobalDiscount").setValue("0").repaint(); 
        server.getJSXByName("subtotal").setText("0").repaint();
        server.getJSXByName("total").setText("0").repaint();
        eg.clientList.callRecieve_Request();
        eg.refService.callGenerate_ID();
        eg.productService.callRecieve_query();
        eg.ui.hideClientFields();
    }
});

jsx3.lang.Package.definePackage("eg.ui",function(ui){
    server = SalesOrderForm.getServer();
    cache = server.getCache();
    hide = function(control){
        server.getJSXByName(control).setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);
        server.getJSXByName(control).setDisplay(jsx3.gui.Block.DISPLAYNONE,true);
    }
    show= function(control){
        server.getJSXByName(control).setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);
        server.getJSXByName(control).setDisplay(jsx3.gui.Block.DISPLAYBLOCK,true);
    }
    iterate = function(arr,fn){
        for(var i=0; i<arr.length; i++){
            fn(arr[i]);
        }
    }   
    ui.hideClientFields = function(){
        iterate(["Client-field","ContactName-field","ContactEmail-field","ContactPhone-field"],hide);
        iterate(["SelectClient-field"],show);
        /*
        server.getJSXByName("Client-field").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);  
        server.getJSXByName("ContactName-field").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);  
        server.getJSXByName("ContactEmail-field").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);  
        server.getJSXByName("ContactPhone-field").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);
        server.getJSXByName("btn-label").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);
        server.getJSXByName("btn-select").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);
        server.getJSXByName("btn-label").setDisplay(jsx3.gui.Block.DISPLAYBLOCK,true);
        server.getJSXByName("btn-select").setDisplay(jsx3.gui.Block.DISPLAYBLOCK,true);
        */
    }
    ui.showClientFields = function(){
        iterate(["Client-field","ContactName-field","ContactEmail-field","ContactPhone-field"],show);
        iterate(["SelectClient-field"],hide);
        /*
        server.getJSXByName("Client-field").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);  
        server.getJSXByName("ContactName-field").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);  
        server.getJSXByName("ContactEmail-field").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);  
        server.getJSXByName("ContactPhone-field").setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);
        server.getJSXByName("btn-label").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);
        server.getJSXByName("btn-select").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);
        server.getJSXByName("btn-label").setDisplay(jsx3.gui.Block.DISPLAYNONE,true);
        server.getJSXByName("btn-select").setDisplay(jsx3.gui.Block.DISPLAYNONE,true);
        */
        
    }    
    ui.showClientDialog = function(){
        dialog = SalesOrderForm.getJSXByName("clientDialog");
        dialog.setVisibility(jsx3.gui.Block.VISIBILITYVISIBLE,true);

    }
    ui.handleDialogSelect = function(obj,recordId){
        node = cache.getDocument('clientList').selectSingleNode("//record[@jsxid='" + recordId + "']")
        server.getJSXByName("Client").setValue(node.getAttribute("clientId")).repaint();
        server.getJSXByName("clientName").setText(node.getAttribute("clientName")).repaint();
        server.getJSXByName("contactName").setText(node.getAttribute("contactName")).repaint();
        server.getJSXByName("contactPhone").setText(node.getAttribute("contactPhone")).repaint();
        server.getJSXByName("contactEmail").setText(node.getAttribute("contactEmail")).repaint();
        server.getJSXByName("clientDialog").setVisibility(jsx3.gui.Block.VISIBILITYHIDDEN,true);
        eg.ui.showClientFields();
    }
    ui.handleAddProductButton = function(){
        dropdown = SalesOrderForm.getJSXByName("productSelect");
        currentValue = dropdown.getValue();
        if(currentValue != ""){
            srcDocument = cache.getDocument('productList');
            node = srcDocument.selectSingleNode("//record[@productId='" + currentValue + "']").cloneNode();
            jsxid = node.getAttribute("jsxid");
            if(cache.getDocument('productMap') == null){
                baseDoc = new jsx3.xml.Document();
                baseDoc.loadXML("<data jsxid=\"jsxroot\"/>");
                cache.setDocument('productMap',baseDoc);
            }
            map = cache.getDocument('productMap');
            map_node = map.selectSingleNode("//record[@jsxid='" + jsxid+ "']");
            if(map_node == null){
                price = parseFloat(node.getAttribute("productPrice"));
                total = price * 1;
                node.setAttribute("productTotal",total);
                node.setAttribute("productQuantity","1");
                node.setAttribute("productDiscount","0");
                root = map.selectSingleNode("/data");
                root.appendChild(node);
           }
           else{
               quantity = parseInt(map_node.getAttribute("productQuantity"));
               discount = parseFloat(map_node.getAttribute("productDiscount"));
               price = parseFloat(map_node.getAttribute("productPrice"));
               quantity++;
               total = quantity*price*(1-discount);
               map_node.setAttribute("productQuantity",quantity);
               map_node.setAttribute("productTotal",total);
           }
            server.getJSXByName("Items").repaint();
            server.getJSXByName("productSelect").setValue().repaint();
            ui.calculateTotals();
        }
    }
    ui.handleQuantityChange = function(obj,jsxid){
        var queryString = "/data/record[@jsxid='" + jsxid + "']";
        var row = obj.getXML().selectSingleNode(queryString);
        jsx3.log(row);
       quantity = parseInt(row.getAttribute("productQuantity"));
       discount = parseFloat(row.getAttribute("productDiscount"));
       price = parseFloat(row.getAttribute("productPrice"));
       total = quantity*price*(1-discount);
       row.setAttribute("productQuantity",quantity);
       row.setAttribute("productTotal",total);            
       server.getJSXByName("Items").repaint();
        ui.calculateTotals();
    }
    ui.handleDiscountChange= function(obj){
        newValue = obj.emGetValue();
        oldValue = obj.emGetSession().value;
        if(newValue != oldValue){                 
           map = cache.getDocument('productMap');
           node= map.selectSingleNode("//record[@jsxid='" + obj.emGetSession().recordId + "']");
           quantity = parseInt(node.getAttribute("productQuantity"));
           discount = parseFloat(newValue);
           price = parseFloat(node.getAttribute("productPrice"));
           total = quantity*price*(1-discount);
           node.setAttribute("productDiscount",discount);
           node.setAttribute("productTotal",total);            
           server.getJSXByName("Items").repaint();
        }
        ui.calculateTotals();
    }
    ui.calculateTotals = function(){
        map = cache.getDocument('productMap');
        subtotal = 0.0;
        total = 0.0;
        if(map){
            nodes = map.selectNodes("//record");
            for(i=0;i<nodes.size();i++){
                node = nodes.get(i);
                subtotal+=parseFloat(node.getAttribute("productTotal"));
            }
        }
        discount = parseFloat(server.getJSXByName("GlobalDiscount").getValue());
        total = subtotal*(1-discount);
        server.getJSXByName("subtotal").setText("$ " + subtotal.toFixed(2)).repaint();
        server.getJSXByName("total").setText("$ " + total.toFixed(2)).repaint();
    }
});