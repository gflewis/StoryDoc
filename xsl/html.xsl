<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
  
  <xsl:template match="/release">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="../css/storydoc.css" />
    </head>
    <body>
      <xsl:apply-templates select="story" />
    </body>
  </html>
  
  </xsl:template>
  
  <xsl:template match="story">
    <article>
      <h3><xsl:value-of select="short_description" /></h3>
      <div class="form">
        <div class="labl-2-1">Number</div>
        <div class="data-2-1"><xsl:value-of select="number" /></div>
        <div class="labl-2-2">Status</div>
        <div class="data-2-2"><xsl:value-of select="status" /></div>
        <div class="clear"/>
      </div>
    </article>
  </xsl:template>  

</xsl:stylesheet>