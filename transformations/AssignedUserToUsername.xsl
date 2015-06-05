<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	version="2.0" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:tns="http://tempo.intalio.org/security/RBACQueryService/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:demo="http://demo.intalio.com/base_types" >
  <!--XSL Skeleton generated on Fri Jan 31 18:30:26 EST 2014
 for F/BPMS_DEMO/processes/system/NofityRole.bpm
   pool:Notify
   activity: ExtractUsername
 Complete doXslTransform: bpel:doXslTransform("../../transformations/AssignedUserToUsername.xsl", $tnsGetAssignedUsersResponseMsg.payload, "index", $emptyCounter)
 Input document as defined in the mapper: $tnsGetAssignedUsersResponseMsg.payload-->
    <xsl:output method="xml" indent="yes"/>
  <xsl:param name="index">
    <!--Parameter defined in mapper as $emptyCounter variable type: xs:unsignedInt-->
    <error>Parameter index no initialized</error>
  </xsl:param>
  <xsl:template match="/tns:getAssignedUsersResponse">
    <demo:Username><xsl:value-of select="tns:user[position()=$index]" /></demo:Username>
  </xsl:template>
</xsl:stylesheet>
