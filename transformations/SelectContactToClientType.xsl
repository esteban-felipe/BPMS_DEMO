<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:SelectContact="urn:intalio.com:connectors:database:bpms_demo:selectcontactservice" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:demo="http://demo.intalio.com/integration_elements" xmlns:QueryimplicitPartner="http://demo.intalio.com/processes/integration/GetClientList/QueryimplicitPartner" xmlns:this="http://demo.intalio.com/processes/integration/GetClientList/Query" xmlns:bpms_demo_base_types="http://demo.intalio.com/base_types" xmlns:diag="http://demo.intalio.com/processes/integration/GetClientList" xmlns:ns="urn:intalio.com:connectors:database:bpms_demo:selectclientservice">
  <!--XSL Skeleton generated on Mon Jan 20 13:46:35 EST 2014
 for F/BPMS_DEMO/processes/integration/GetClientList.bpm
   pool:Query
   activity: Extract contact
 Complete doXslTransform: bpel:doXslTransform("../../transformations/SelectContactToClientType.xsl", $selectContactSelectContactResponseMsg.parameters/SelectContact:rows, "client_id", $Client/bpms_demo_base_types:ClientId, "client_name", $Client/bpms_demo_base_types:ClientName)
 Input document as defined in the mapper: $selectContactSelectContactResponseMsg.parameters/SelectContact:rows-->
  <xsl:output/>
  <xsl:param name="client_id">
    <!--Parameter defined in mapper as $Client/bpms_demo_base_types:ClientId variable type: demo:Client-->
    <error>Parameter client_id no initialized</error>
  </xsl:param>
  <xsl:param name="client_name">
    <!--Parameter defined in mapper as $Client/bpms_demo_base_types:ClientName variable type: demo:Client-->
    <error>Parameter client_name no initialized</error>
  </xsl:param>
  <xsl:template match="/SelectContact:rows">
    <demo:Client>
      <bpms_demo_base_types:ClientId><xsl:value-of select="$client_id/text()"></xsl:value-of></bpms_demo_base_types:ClientId>
      <bpms_demo_base_types:ClientName><xsl:value-of select="$client_name/text()"></xsl:value-of></bpms_demo_base_types:ClientName>
      <bpms_demo_base_types:Contact>
        <bpms_demo_base_types:ContactName><xsl:value-of select="SelectContact:row[position()=1]/SelectContact:Name"></xsl:value-of></bpms_demo_base_types:ContactName>
        <bpms_demo_base_types:ContactPhone><xsl:value-of select="SelectContact:row[position()=1]/SelectContact:Phone"></xsl:value-of></bpms_demo_base_types:ContactPhone>
        <bpms_demo_base_types:ContactEmail><xsl:value-of select="SelectContact:row[position()=1]/SelectContact:Email"></xsl:value-of></bpms_demo_base_types:ContactEmail>
      </bpms_demo_base_types:Contact>
    </demo:Client>
  </xsl:template>
</xsl:stylesheet>
