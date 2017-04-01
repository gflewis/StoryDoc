<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

  <xsl:template match="/response">
    <xsl:element name="release">
      <xsl:apply-templates select="result">
        <xsl:sort select="number/value"/>
      </xsl:apply-templates>
    </xsl:element>
  </xsl:template>

  <xsl:template match="result">
    <xsl:element name="story">
      <xsl:element name="number">
        <xsl:value-of select="number/value"/>
      </xsl:element>
      <xsl:element name="status">
        <xsl:value-of select="state/display_value"/>
      </xsl:element>
      <xsl:element name="short_description">
        <xsl:value-of select="short_description/value"/>
      </xsl:element>
      <xsl:element name="description">
        <xsl:value-of select="description/value"/>
      </xsl:element>
      <xsl:element name="acceptance_criteria">
        <xsl:value-of select="acceptance_criteria/value"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
