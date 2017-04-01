<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
<xsl:template match="/response">
  <html>
  <body>
    <table border="1">
      <xsl:apply-templates select="result">
        <xsl:sort select="number/value" />
      </xsl:apply-templates>
    </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="result">
	<tr>
	  <xsl:element name="td">
      <xsl:value-of select="number/value"/>
	  </xsl:element>
	  <td><xsl:value-of select="short_description/value" /></td>
	</tr>
</xsl:template>

</xsl:stylesheet>