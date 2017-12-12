<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Portu-WhatsApp Corpus</title>
                <link rel="stylesheet" type="text/css" href="rodgers_11-03_xslt-07.css"/>
            </head>
            <body>

                <h1>Portu-WhatsApp</h1>
                <xsl:apply-templates select="//q"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="q">
       <div type="converstion">
           <h2>Conversation <xsl:value-of select="@n"/></h2>
           <div type="convoTranscript"><xsl:apply-templates/></div></div>
    </xsl:template>
        
        <xsl:template match="u">
        <xsl:if test="@who='am'">
            American: 
            <span class="american">
                <xsl:apply-templates/>
                <xsl:if test="following-sibling::u">   
                <br/>
                </xsl:if>    
            </span>
        </xsl:if>
        <xsl:if test="@who='br'">
            Brazilian: 
            <span class="brazilian">
                <xsl:apply-templates/><xsl:if test="following-sibling::u"><br/></xsl:if>    
            </span>
        </xsl:if>
        </xsl:template>
    

           
</xsl:stylesheet>
