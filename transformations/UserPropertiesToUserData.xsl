<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:this="http://demo.intalio.com/processes/system/NofityRole/Notify" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempo.intalio.org/security/RBACQueryService/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:NotifyimplicitPartner="http://demo.intalio.com/processes/system/NofityRole/NotifyimplicitPartner" xmlns:demo="http://demo.intalio.com/base_types" xmlns:diag="http://demo.intalio.com/processes/system/NofityRole">
  <!--XSL Skeleton generated on Fri Jan 31 18:39:08 EST 2014
 for F/BPMS_DEMO/processes/system/NofityRole.bpm
   pool:Notify
   activity: Extract details
 Complete doXslTransform: bpel:doXslTransform("../../transformations/UserPropertiesToUserData.xsl", $tnsGetUserPropertiesResponseMsg.payload)
 Input document as defined in the mapper: $tnsGetUserPropertiesResponseMsg.payload-->
  <xsl:output/>
  <!--No parameters are currently passed to doXslTransform.-->
  <xsl:template match="/tns:getUserPropertiesResponse">
    <demo:UserData>
      <demo:Name><xsl:value-of select="tns:property[tns:name='displayName']/tns:value" /></demo:Name>
      <demo:Email><xsl:value-of select="tns:property[tns:name='email']/tns:value" /></demo:Email>
    </demo:UserData>
  </xsl:template>
</xsl:stylesheet>
