<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:this="http://demo.intalio.com/processes/system/ConvertToOrderDetail/Convert" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:bpms_demo_integration_types="http://demo.intalio.com/integration_elements" 
  xmlns:demo="http://demo.intalio.com/base_types" 
  version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="products"/>
   <xsl:param name="clients"/>
  <xsl:template match="/this:Recieve_conversion_requestRequest">
    <xsl:variable name="clientId"><xsl:value-of select="demo:Client" /></xsl:variable>
    <xsl:variable name="client"><xsl:copy-of select="$clients/bpms_demo_integration_types:Client[demo:ClientId= $clientId]"  /></xsl:variable>
    <this:Recieve_conversion_requestResponse>
      <demo:OrderRef><xsl:value-of select="demo:OrderRef" /></demo:OrderRef>
      <demo:OrderDate><xsl:value-of select="demo:OrderDate" /></demo:OrderDate>
      <demo:Client>
        <demo:ClientId><xsl:value-of select="demo:Client" /></demo:ClientId>
        <demo:ClientName><xsl:value-of select="$client/bpms_demo_integration_types:Client/demo:ClientName"/></demo:ClientName>
        <demo:ContactName><xsl:value-of select="$client/bpms_demo_integration_types:Client/demo:Contact/demo:ContactName"/></demo:ContactName>
        <demo:ContactPhone><xsl:value-of select="$client/bpms_demo_integration_types:Client/demo:Contact/demo:ContactPhone"/></demo:ContactPhone>
        <demo:ContactEmail><xsl:value-of select="$client/bpms_demo_integration_types:Client/demo:Contact/demo:ContactEmail"/></demo:ContactEmail>
      </demo:Client>
      <xsl:for-each select="demo:Items">
        <xsl:variable name="productId"><xsl:value-of select="demo:ProductId" /></xsl:variable>
        <xsl:variable name="product"><xsl:copy-of select="$products/bpms_demo_integration_types:Product[demo:ProductId/text()=$productId]" /></xsl:variable>  
        <xsl:variable name="quantity"><xsl:value-of select="demo:Quantity" /></xsl:variable>
        <xsl:variable name="discount"><xsl:value-of select="demo:ItemDiscount" /></xsl:variable>
        <xsl:variable name="price"><xsl:value-of select="$product/bpms_demo_integration_types:Product/demo:ProductPrice" /></xsl:variable>
        <xsl:variable name="productPrice"><xsl:value-of select="($price*(1-$discount))*$quantity" /></xsl:variable>
        <demo:Items>
          <demo:ItemRef><xsl:value-of select="demo:ItemRef" /></demo:ItemRef>
          <demo:ProductId><xsl:value-of select="demo:ProductId" /></demo:ProductId>
          <demo:ProductFamily><xsl:value-of select="$product/bpms_demo_integration_types:Product/demo:ProductFamily" /></demo:ProductFamily>
          <demo:ProductName><xsl:value-of select="$product/bpms_demo_integration_types:Product/demo:ProductName" /></demo:ProductName>
          <demo:ProductPrice><xsl:value-of select="$product/bpms_demo_integration_types:Product/demo:ProductPrice" /></demo:ProductPrice>
          <demo:Quantity><xsl:value-of select="$quantity" /></demo:Quantity>
          <demo:ItemDiscount><xsl:value-of select="demo:ItemDiscount" /></demo:ItemDiscount>
          <demo:ItemPrice><xsl:value-of select="$productPrice" /></demo:ItemPrice>
        </demo:Items>
      </xsl:for-each>
      <demo:GlobalDiscount><xsl:value-of select="demo:GlobalDiscount"  /></demo:GlobalDiscount>
      <demo:TotalPrice>0</demo:TotalPrice>
    </this:Recieve_conversion_requestResponse>
      <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="text()" />

</xsl:stylesheet>
    