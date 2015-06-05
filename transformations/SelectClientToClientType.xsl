<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:SelectContact="urn:intalio.com:connectors:database:bpms_demo:selectcontactservice" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:demo="http://demo.intalio.com/integration_elements" xmlns:QueryimplicitPartner="http://demo.intalio.com/processes/integration/GetClientList/QueryimplicitPartner" xmlns:this="http://demo.intalio.com/processes/integration/GetClientList/Query" xmlns:bpms_demo_base_types="http://demo.intalio.com/base_types" xmlns:diag="http://demo.intalio.com/processes/integration/GetClientList" xmlns:ns="urn:intalio.com:connectors:database:bpms_demo:selectclientservice">
  <!--XSL Skeleton generated on Mon Jan 20 13:37:53 EST 2014
 for F/BPMS_DEMO/processes/integration/GetClientList.bpm
   pool:Query
   activity: ExtractClient
 Complete doXslTransform: bpel:doXslTransform("../../transformations/SelectClientToClientType.xsl", $nsSelectClientResponseMsg.parameters/ns:rows, "position", $emptyCounter)
 Input document as defined in the mapper: $nsSelectClientResponseMsg.parameters/ns:rows-->
  <xsl:output/>
  <xsl:param name="position">
    <!--Parameter defined in mapper as $emptyCounter variable type: xs:unsignedInt-->
    <error>Parameter position no initialized</error>
  </xsl:param>
  <xsl:template match="/ns:rows">
    <demo:Client>
      <bpms_demo_base_types:ClientId><xsl:value-of select="ns:row[position()=$position]/ns:client_id" ></xsl:value-of></bpms_demo_base_types:ClientId>
      <bpms_demo_base_types:ClientName><xsl:value-of select="ns:row[position()=$position]/ns:client_name" ></xsl:value-of></bpms_demo_base_types:ClientName>
      <bpms_demo_base_types:Contact>
        <bpms_demo_base_types:ContactName></bpms_demo_base_types:ContactName>
        <bpms_demo_base_types:ContactPhone></bpms_demo_base_types:ContactPhone>
        <bpms_demo_base_types:ContactEmail></bpms_demo_base_types:ContactEmail>
      </bpms_demo_base_types:Contact>
    </demo:Client>
  </xsl:template>
</xsl:stylesheet>
