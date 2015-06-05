<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:products_db="__project:///schemas/products_db.xsd" xmlns:demo="http://demo.intalio.com/integration_elements" xmlns:QueryimplicitPartner="http://demo.intalio.com/processes/integration/GetProductList/QueryimplicitPartner" xmlns:this="http://demo.intalio.com/processes/integration/GetProductList/Query" xmlns:bpms_demo_base_types="http://demo.intalio.com/base_types" xmlns:consumer="http://demo.intalio.com/processes/integration/GetProductList/consumer" xmlns:diag="http://demo.intalio.com/processes/integration/GetProductList" xmlns:read_all_products="http://demo.intalio.com/services/read_all_products.rest">
  <!--XSL Skeleton generated on Fri Apr 17 21:23:39 EDT 2015
 for F/BPMS_DEMO/processes/integration/GetProductList.bpm
   pool:Query
   activity: Send reply
 Complete doXslTransform: bpel:doXslTransform("../../transformations/SelectProductsQueryToProductList.xsl", $read_all_productsRead_all_productsResponseMsg.response)
 Input document as defined in the mapper: $read_all_productsRead_all_productsResponseMsg.response-->
  <xsl:output/>
  <!--No parameters are currently passed to doXslTransform.-->
  <xsl:template match="/iob_response_root">
    <this:Recieve_queryResponse>
		<xsl:apply-templates />
    </this:Recieve_queryResponse>
  </xsl:template>
  <xsl:template match="iob_element">
	<demo:Product>
	  <bpms_demo_base_types:ProductId><xsl:value-of select="dev_product_id/raw" /></bpms_demo_base_types:ProductId>
	  <bpms_demo_base_types:ProductFamily><xsl:value-of select="dev_family/name" /></bpms_demo_base_types:ProductFamily>
	  <bpms_demo_base_types:ProductName><xsl:value-of select="dev_name/raw" /></bpms_demo_base_types:ProductName>
	  <bpms_demo_base_types:ProductPrice><xsl:value-of select="dev_price/value" /></bpms_demo_base_types:ProductPrice>
	</demo:Product>
  </xsl:template>
</xsl:stylesheet>
