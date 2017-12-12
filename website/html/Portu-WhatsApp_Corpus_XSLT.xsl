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
                <p>
                    <h2>Conversation 1</h2>
                    <xsl:apply-templates select="//q[@n = '1']"/>
                </p>
                <p>
                    <h2>Conversation 2</h2>
                    <xsl:apply-templates select="//q[@n = '2']"/>
                </p>
                <p>
                    <h2>Conversation 3</h2>
                    <xsl:apply-templates select="//q[@n = '3']"/>
                </p>
                <p>
                    <h2>Conversation 4</h2>
                    <xsl:apply-templates select="//q[@n = '4']"/>
                </p>
                <p>
                    <h2>Conversation 5</h2>
                    <xsl:apply-templates select="//q[@n = '5']"/>
                </p>
                <p>
                    <h2>Conversation 6</h2>
                    <xsl:apply-templates select="//q[@n = '6']"/>
                </p>
                <p>
                    <h2>Conversation 7</h2>
                    <xsl:apply-templates select="//q[@n = '7']"/>
                </p>
                <p>
                    <h2>Conversation 8</h2>
                    <xsl:apply-templates select="//q[@n = '8']"/>
                </p>
                <p>
                    <h2>Conversation 9</h2>
                    <xsl:apply-templates select="//q[@n = '9']"/>
                </p>
                <p>
                    <h2>Conversation 10</h2>
                    <xsl:apply-templates select="//q[@n = '10']"/>
                </p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="q/u[@who = 'am']"> American: <span class="american"
            ><xsl:apply-templates/></span>
        <xsl:if test="following-sibling::u"><br/></xsl:if>
    </xsl:template>
    <xsl:template match="q/u[@who = 'br']"> Brazilian: <span class="brazilian"
            ><xsl:apply-templates/></span><br/>
    </xsl:template>
    <xsl:template match="q/u/abbr[@type = 'textese']">
        <span class="textese">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/abbr[@type = 'informal']">
        <span class="informal">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/abbr[@type = 'contraction']">
        <span class="contraction">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/expan[@type = 'full']">
        <span class="full">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/expan[@type = 'formal']">
        <span class="formal">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/abbr[@type = 'uncontracted']">
        <span class="uncontracted">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/pc">
        <span class="pc">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/hi[@type = 'k | rs']">
        <span class="blaughter">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/hi[@type = 'ha | lol']">
        <span class="alaughter">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/sic[@type = 'selfcorr']">
        <span class="selfcorr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/sic[@type = 'impcorr']">
        <span class="impcorr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/sic[@type = 'expcorr']">
        <span class="expcorr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/sic[@type = 'uncorr']">
        <span class="uncorr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/corr[@type = 'explicit']">
        <span class="explicit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/corr[@type = 'implicit']">
        <span class="implicit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="q/u/foreign">
        <span class="foreign">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>