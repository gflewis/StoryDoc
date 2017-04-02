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
       This only works in Firefox, sort of, 
       and it does not work in Chrome at all, so it was removed for now
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
          <td class="data" colspan="4">
            <xsl:call-template name='convert-double-linefeed-to-break'>
              <xsl:with-param name='text'>
                <xsl:value-of select="description" />
              </xsl:with-param>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="row-1col">
          <th class="labl">Acceptance Criteria</th>
          <td class="data" colspan="4">
            <xsl:call-template name='convert-double-linefeed-to-break'>
	            <xsl:with-param name='text'>
	              <xsl:value-of select="acceptance_criteria" />
	            </xsl:with-param>
            </xsl:call-template>
          </td>
        </tr>
      </table>
    </article>
  </xsl:template>  
  
  <xsl:template name="convert-linefeed-to-break">
    <xsl:param name="text" />
    <xsl:choose>
      <xsl:when test="contains($text, '&#xA;')">
        <xsl:value-of select="substring-before($text, '&#xA;')"/>
         <br />
        <xsl:call-template name="convert-linefeed-to-break">
          <xsl:with-param name="text" select="substring-after($text, '&#xA;')"/>
        </xsl:call-template>
       </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="convert-double-linefeed-to-break">
	  <!--
	     I am not sure why we are getting double linefeeds in the XML.
	     They do not appear in ServiceNow.
	     This is a workaround for a condition which I do not understand. 
	   -->
    <xsl:param name="text" />
    <xsl:choose>
      <xsl:when test="contains($text, '&#xA;&#xA;')">
        <xsl:value-of select="substring-before($text, '&#xA;&#xA;')"/>
          <br />
        <xsl:call-template name="convert-double-linefeed-to-break">
          <xsl:with-param name="text" select="substring-after($text, '&#xA;&#xA;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	
</xsl:stylesheet>