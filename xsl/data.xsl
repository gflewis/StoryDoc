<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

  <xsl:param name="release" />
  <xsl:param name="releasedatafile" />
  <xsl:variable name="releasedoc" select="document($releasedatafile)" />

  <xsl:template match="/response">
    <xsl:element name="release">
      <xsl:attribute name="release">
        <xsl:value-of select="$release" />
      </xsl:attribute>
      <xsl:attribute name="releasedatafile">
        <xsl:value-of select="$releasedatafile" />
      </xsl:attribute>
      <xsl:call-template name="release">
        <xsl:with-param name="release" select="$releasedoc/response/result" />
      </xsl:call-template>
      <xsl:apply-templates select="result">
        <xsl:sort select="number/value"/>
      </xsl:apply-templates>
    </xsl:element>
  </xsl:template>

  <xsl:template name="release">
    <xsl:param name="release"/>
    <xsl:element name="number">
      <xsl:value-of select="$release/number/value"/>
    </xsl:element>
    <xsl:element name="status">
      <xsl:value-of select="$release/state/display_value" />
    </xsl:element>
    <xsl:element name="short_description">
      <xsl:value-of select="$release/short_description/value"/>
    </xsl:element>
    <xsl:element name="requested_by">
      <xsl:value-of select="$release/u_requested_by/display_value" />
    </xsl:element>
    <xsl:element name="assigned_to">
      <xsl:value-of select="$release/assigned_to/display_value" />
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
      <xsl:element name="priority">
        <xsl:value-of select="priority/display_value"/>
      </xsl:element>
      <xsl:element name="estimate">
        <xsl:value-of select="u_complexity/display_value"/>
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
