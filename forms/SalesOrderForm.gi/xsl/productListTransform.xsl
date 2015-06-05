<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="data">
        <data jsxid="jsxroot">
            <xsl:apply-templates/>
        </data>
    </xsl:template>
    <xsl:template match="record">
        <xsl:element name="record">
            <xsl:attribute name="jsxid">
                <xsl:value-of select="@productId"/>
            </xsl:attribute>
            <xsl:attribute name="jsxtext">
                <xsl:value-of select="@productName"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>