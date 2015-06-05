<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:demo="http://demo.intalio.com/integration_elements" xmlns:QueryimplicitPartner="http://demo.intalio.com/processes/integration/GetProductList/QueryimplicitPartner" xmlns:this="http://demo.intalio.com/processes/integration/GetProductList/Query" xmlns:ns="urn:intalio.com:connectors:database:bpms_demo:selectproductsservice" xmlns:bpms_demo_base_types="http://demo.intalio.com/base_types" xmlns:diag="http://demo.intalio.com/processes/integration/GetProductList">
  <!--XSL Skeleton generated on Tue Jan 21 09:15:14 EST 2014
 for F/BPMS_DEMO/processes/integration/GetProductList.bpm
   pool:Query
   activity: Send reply
 Complete doXslTransform: bpel:doXslTransform("../../transformations/SelectProductsToProductList.xsl", $nsSelectProductsResponseMsg.parameters/ns:rows)
 Input document as defined in the mapper: $nsSelectProductsResponseMsg.parameters/ns:rows-->
  <xsl:output/>
  <!--No parameters are currently passed to doXslTransform.-->
  <xsl:template match="/ns:rows">
    <demo:ProductList>
    	<xsl:apply-templates />
    </demo:ProductList>
  </xsl:template>
  <xsl:template match="ns:row">
      <demo:Product>
        <bpms_demo_base_types:ProductId><xsl:value-of select="ns:ProductId" /></bpms_demo_base_types:ProductId>
        <bpms_demo_base_types:ProductFamily><xsl:value-of select="ns:Family" /></bpms_demo_base_types:ProductFamily>
        <bpms_demo_base_types:ProductName><xsl:value-of select="ns:Name" /></bpms_demo_base_types:ProductName>
        <bpms_demo_base_types:ProductPrice><xsl:value-of select="ns:Price" /></bpms_demo_base_types:ProductPrice>
      </demo:Product>
  
  </xsl:template>
</xsl:stylesheet>
