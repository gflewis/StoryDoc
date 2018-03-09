<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xalan="http://xml.apache.org/xslt"
    version="1.0">
  <xsl:output method="html" indent="yes" omit-xml-declaration="no"/>

  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="data/story[@number='STRY0024935']"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="story">
    <xsl:value-of select="description"/>
  </xsl:template>

</xsl:stylesheet>
