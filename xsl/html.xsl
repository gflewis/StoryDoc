<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
  
  <xsl:template match="/release">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="../css/storydoc.css" />
    </head>
    <body id="content">
      <!--
       This only works in Firefox, sort of
	    <div id="page-footer">
	      Copyright 2017 Aptris - all rights reserved - Page  
	    </div>
	     -->
      <xsl:apply-templates select="story" />
    </body>
  </html>
  
  </xsl:template>
  
  <xsl:template match="story">
    <article class="story">
      <table class="form">
        <tr class="title">
          <td class="title" colspan="5"><xsl:value-of select="short_description" /></td>
        </tr>
        <tr class="row-2col">
	        <th class="labl">Number</th>
	        <td class="data"><xsl:value-of select="number" /></td>
	        <td class="gully"/>
	        <th class="labl">Status</th>
	        <td class="data"><xsl:value-of select="status" /></td>
        </tr>
        <tr class="row-2col">
          <th class="labl">Estimate</th>
          <td class="data"><xsl:value-of select="estimate" /></td>
          <td class="gully"/>
          <th class="labl">Priority</th>
          <td class="data"><xsl:value-of select="priority" /></td>
        </tr>
        <tr class="row-1col">
          <th class="labl">Description</th>
          <td class="data" colspan="4"><xsl:value-of select="description" /></td>
        </tr>
        <tr class="row-1col">
          <th class="labl">Acceptance Criteria</th>
          <td class="data" colspan="4"><xsl:value-of select="acceptance_criteria" /></td>
        </tr>
      </table>
    </article>
  </xsl:template>  

</xsl:stylesheet>