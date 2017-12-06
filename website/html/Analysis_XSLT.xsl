<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xpath-default-namespace="http://www.tei-c.org/ns/1.0"
exclude-result-prefixes="xs"
xmlns="http://www.w3.org/2000/svg">
<xsl:output method="xml" indent="yes"/>
    <xsl:variable name="xspace" select="5"/>
    <xsl:variable name="yspace" select="5"/>



<xsl:template match="/">
    
    <html xmlns="http://www.w3.org/1999/xhtml">
        
        <head>
            <title>Analysis</title>
            <link rel="stylesheet" type="text/css" href="Brooks_SVG4_CSS.css" />
        </head>
        <body>
            <div class="header">
                <h1>Analysis</h1>
                <hr />
                <h2>The Use of Abbreviations in Texting</h2>
            </div>
            <div class="description">
                <p>Below is a graph that represents the amount of times that any notable form of a abbreviation was used within the texting partner groups. This selection is only representative of a few of the converstaions that were captured in the WhatsApp screenshots that we processed.</p>
            </div>
            <div id="abbr1"> <!-- nationalislity comparison --> 
                <xsl:variable name="totabbr" select="count(//abbr)"/>
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-250 50 1400 250">
                    <g>
                        <polyline points="0,0 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                        <!-- graph axis -->
                        
                        <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400 - count(//u[@who='am']//abbr)}" stroke-width="3" stroke="black"/> <!-- American -->
                        <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400 - count(//u[@who='br']//abbr)}" stroke-width="3" stroke="black"/> <!-- Brazilian -->
                        <!-- x axis values -->
                        
                        <text x="100" y="450">American</text>
                        <text x="300" y="450">Brazilian</text>
                        <!-- x axis labels -->
                    </g>
                </svg>
            </div>
            <div id="abbr2"> <!-- types of abbreviation comparison -->
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-250 50 1400 250">
                    <g>
                        
                    </g>
                </svg>
            </div>
        </body>
    </html>
    
    
    
    
    
    
    
    
</xsl:template>



</xsl:stylesheet>