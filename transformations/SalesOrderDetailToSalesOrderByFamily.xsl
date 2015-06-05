<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:SalesOrderModificationForm1="http://www.intalio.com/gi/forms/SalesOrderModificationForm.gi" xmlns:SalesOrderModificationForm="http://www.intalio.com/gi/forms/SalesOrderModificationForm.gi/attachments" xmlns:TaskManagementServices="http://www.intalio.com/BPMS/Workflow/TaskManagementServices-20051109/" xmlns:ConvertToOrderDetail-Convert="http://demo.intalio.com/processes/system/ConvertToOrderDetail/Convert" xmlns:SalesOrderReview="http://www.intalio.com/gi/forms/SalesOrderReview.gi" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:this="http://demo.intalio.com/processes/OrderManagement/OrderManagement" xmlns:tns="http://tempo.intalio.org/security/tokenService/" xmlns:diag="http://demo.intalio.com/processes/OrderManagement" xmlns:NofityRole-Notify="http://demo.intalio.com/processes/system/NofityRole/Notify" xmlns:Sales_representative="http://demo.intalio.com/processes/OrderManagement/Sales_representative" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:SalesOrderForm1="http://www.intalio.com/gi/forms/SalesOrderForm.gi" xmlns:SalesOrderForm="http://www.intalio.com/gi/forms/SalesOrderForm.gi/attachments" xmlns:bpms_demo_form_elements="http://demo.intalio.com/form_elements" xmlns:demo="http://demo.intalio.com/base_types" xmlns:attachments="http://www.intalio.com/gi/forms/SalesOrderReview.gi/attachments">
  <!--XSL Skeleton generated on Sun Feb 02 10:28:50 EST 2014
 for F/BPMS_DEMO/processes/OrderManagement.bpm
   pool:OrderManagement
   activity: Split orders
 Complete doXslTransform: bpel:doXslTransform("SalesOrderDetailToSalesOrderByFamily.xsl", $SalesManagement/demo:SalesOrder)
 Input document as defined in the mapper: $SalesManagement/demo:SalesOrder-->
  <xsl:output/>
  <xsl:template match="/demo:SalesOrder">
  	<xsl:variable name="OrderRef"></xsl:variable>
    <demo:SalesOrderByFamily>
      <demo:Office>
        <demo:OrderRef><xsl:value-of select="demo:OrderRef" /></demo:OrderRef>
        <demo:OrderDate><xsl:value-of select="demo:OrderDate" /></demo:OrderDate>
        <demo:ClientId><xsl:value-of select="demo:Client/demo:ClientId" /></demo:ClientId>
        <xsl:for-each select="demo:Items[demo:ProductFamily='Office']">
	        <demo:Items>
	          <demo:ItemRef><xsl:value-of select="replace(demo:ItemRef,'jsx_','')" /></demo:ItemRef>
	          <demo:ProductId><xsl:value-of select="demo:ProductId" /></demo:ProductId>
	          <demo:ProductFamily><xsl:value-of select="demo:ProductFamily" /></demo:ProductFamily>
	          <demo:ProductName><xsl:value-of select="demo:ProductName" /></demo:ProductName>
	          <demo:ProductPrice><xsl:value-of select="demo:ProductPrice" /></demo:ProductPrice>
	          <demo:Quantity><xsl:value-of select="demo:Quantity" /></demo:Quantity>
	          <demo:ItemDiscount><xsl:value-of select="demo:ItemDiscount" /></demo:ItemDiscount>
	          <demo:ItemPrice><xsl:value-of select="demo:ItemPrice" /></demo:ItemPrice>
	        </demo:Items>
        </xsl:for-each>
      </demo:Office>
      <demo:Furniture>
        <demo:OrderRef><xsl:value-of select="demo:OrderRef" /></demo:OrderRef>
        <demo:OrderDate><xsl:value-of select="demo:OrderDate" /></demo:OrderDate>
        <demo:ClientId><xsl:value-of select="demo:Client/demo:ClientId" /></demo:ClientId>
        <xsl:for-each select="demo:Items[demo:ProductFamily='Furniture']">
	        <demo:Items>
	          <demo:ItemRef><xsl:value-of select="replace(demo:ItemRef,'jsx_','')" /></demo:ItemRef>
	          <demo:ProductId><xsl:value-of select="demo:ProductId" /></demo:ProductId>
	          <demo:ProductFamily><xsl:value-of select="demo:ProductFamily" /></demo:ProductFamily>
	          <demo:ProductName><xsl:value-of select="demo:ProductName" /></demo:ProductName>
	          <demo:ProductPrice><xsl:value-of select="demo:ProductPrice" /></demo:ProductPrice>
	          <demo:Quantity><xsl:value-of select="demo:Quantity" /></demo:Quantity>
	          <demo:ItemDiscount><xsl:value-of select="demo:ItemDiscount" /></demo:ItemDiscount>
	          <demo:ItemPrice><xsl:value-of select="demo:ItemPrice" /></demo:ItemPrice>
	        </demo:Items>
        </xsl:for-each>
      </demo:Furniture>
      <demo:Electronics>
        <demo:OrderRef><xsl:value-of select="demo:OrderRef" /></demo:OrderRef>
        <demo:OrderDate><xsl:value-of select="demo:OrderDate" /></demo:OrderDate>
        <demo:ClientId><xsl:value-of select="demo:Client/demo:ClientId" /></demo:ClientId>
        <xsl:for-each select="demo:Items[demo:ProductFamily='Electronics']">
	        <demo:Items>
	          <demo:ItemRef><xsl:value-of select="replace(demo:ItemRef,'jsx_','')" /></demo:ItemRef>
	          <demo:ProductId><xsl:value-of select="demo:ProductId" /></demo:ProductId>
	          <demo:ProductFamily><xsl:value-of select="demo:ProductFamily" /></demo:ProductFamily>
	          <demo:ProductName><xsl:value-of select="demo:ProductName" /></demo:ProductName>
	          <demo:ProductPrice><xsl:value-of select="demo:ProductPrice" /></demo:ProductPrice>
	          <demo:Quantity><xsl:value-of select="demo:Quantity" /></demo:Quantity>
	          <demo:ItemDiscount><xsl:value-of select="demo:ItemDiscount" /></demo:ItemDiscount>
	          <demo:ItemPrice><xsl:value-of select="demo:ItemPrice" /></demo:ItemPrice>
	        </demo:Items>
        </xsl:for-each>
      </demo:Electronics>
    </demo:SalesOrderByFamily>
  </xsl:template>
<!-- 
      <demo:Office>
        <demo:OrderRef>string</demo:OrderRef>
        <demo:OrderDate>date</demo:OrderDate>
        <demo:ClientId>int</demo:ClientId>
        <demo:Items>
          <demo:ItemRef>string</demo:ItemRef>
          <demo:ProductId>string</demo:ProductId>
          <demo:ProductFamily>string</demo:ProductFamily>
          <demo:ProductName>string</demo:ProductName>
          <demo:ProductPrice>double</demo:ProductPrice>
          <demo:Quantity>int</demo:Quantity>
          <demo:ItemDiscount>double</demo:ItemDiscount>
          <demo:ItemPrice>double</demo:ItemPrice>
        </demo:Items>
      </demo:Office>
      <demo:Furniture>
        <demo:OrderRef>string</demo:OrderRef>
        <demo:OrderDate>date</demo:OrderDate>
        <demo:ClientId>int</demo:ClientId>
        <demo:Items>
          <demo:ItemRef>string</demo:ItemRef>
          <demo:ProductId>string</demo:ProductId>
          <demo:ProductFamily>string</demo:ProductFamily>
          <demo:ProductName>string</demo:ProductName>
          <demo:ProductPrice>double</demo:ProductPrice>
          <demo:Quantity>int</demo:Quantity>
          <demo:ItemDiscount>double</demo:ItemDiscount>
          <demo:ItemPrice>double</demo:ItemPrice>
        </demo:Items>
      </demo:Furniture>
      <demo:Electronics>
        <demo:OrderRef>string</demo:OrderRef>
        <demo:OrderDate>date</demo:OrderDate>
        <demo:ClientId>int</demo:ClientId>
        <demo:Items>
          <demo:ItemRef>string</demo:ItemRef>
          <demo:ProductId>string</demo:ProductId>
          <demo:ProductFamily>string</demo:ProductFamily>
          <demo:ProductName>string</demo:ProductName>
          <demo:ProductPrice>double</demo:ProductPrice>
          <demo:Quantity>int</demo:Quantity>
          <demo:ItemDiscount>double</demo:ItemDiscount>
          <demo:ItemPrice>double</demo:ItemPrice>
        </demo:Items>
      </demo:Electronics>
    </demo:SalesOrderByFamily>
  </xsl:template>
-->
</xsl:stylesheet>
