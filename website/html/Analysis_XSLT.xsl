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
                <link rel="stylesheet" type="text/css" href="../css/index.css" />
            </head>
            <body>
                <div class="header">
                    <h1>Analysis</h1>
                    <hr />
                    
                </div>
                
                <h2>The Use of Abbreviations in Texting</h2>
                <div class="description">
                    <p>Below is a graph that represents the amount of times that any notable form of an abbreviation was used within the texting partner groups. This selection is only representative of a few of the converstaions that were captured in the WhatsApp screenshots that we processed.</p>
                </div>
                <div id="abbr">
                    <div id="abbr1"> <!-- nationality comparison --> 
                        <xsl:variable name="totabbr" select="count(//abbr)"/>
                        <xsl:variable name="amAbbr" select="count(//u[@who='am']//abbr)"/>
                        <xsl:variable name="brAbbr" select="count(//u[@who='br']//abbr)"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                <polyline points="0,{max(($amAbbr, $brAbbr))-10} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                <!-- graph axis -->
                                
                                
                                <!-- Labels -->
                                <text x="20" y="{max(($amAbbr, $brAbbr))-20}">The use of Abbreviations by Nationality</text><!-- title -->
                                <text x="-20" y="400" transform="rotate(-90 -20,400)">The number of Abbreviations Used</text><!-- y axis -->
                                <text x="0" y="475">Nationality</text><!-- x axis -->
                                <text x="{10*$xspace}" y="{400-count(//u[@who='am']//abbr)-20}" text-anchor="middle"><xsl:value-of select="count(//u[@who='am']//abbr)"/></text><!-- Am Count -->
                                <text x="{20*$xspace}" y="{400-count(//u[@who='br']//abbr)-20}" text-anchor="middle"><xsl:value-of select="count(//u[@who='br']//abbr)"/></text><!-- Br Count -->
                                <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- x axis variable American -->
                                <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Brazilian</text><!-- x axis variable Brazilian -->
                                
                                <!-- Bars -->
                                <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400 - count(//u[@who='am']//abbr)}" stroke-width="3" stroke="black"/> <!-- American -->
                                <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400 - count(//u[@who='br']//abbr)}" stroke-width="3" stroke="black"/> <!-- Brazilian -->
                            </g>
                        </svg>
                    </div>
                    <div id="abbr2"> <!-- types of abbreviation comparison -->
                        <xsl:variable name="contra" select="count(//abbr[@type='contraction'])"/>
                        <xsl:variable name="inf" select="count(//abbr[@type='informal'])"/>
                        <xsl:variable name="txtese" select="count(//abbr[@type='textese'])"/>
                        <xsl:variable name="numVar" select="count(distinct-values(//abbr/@type))"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                <!-- labels for the graphs -->
                                <text x="25" y="{max(($contra, $inf, $txtese))-25}">Types of Abbreviations Used</text>
                                <text x="-20" y="400" transform="rotate(-90 -20,400)">Number of Each Type of Abbreviation</text>
                                <text x="0" y="475">Types of Abbreviations</text>
                                
                                <polyline points="0,{max(($contra, $inf, $txtese))-10} 0,400 {15*$xspace*$numVar},400" stroke="black" stroke-width="3" fill="none"/> <!-- graph axis -->
                                
                                <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$contra}" stroke="black" stroke-width="3" /><!-- contraction -->
                                <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">Contraction</text>
                                <text x="{10*$xspace}" y="{400-$contra - 10}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type='contraction'])"/></text>
                                
                                <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$inf}" stroke-width="3" stroke="black"/> <!-- informal -->
                                <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Informal</text>
                                <text x="{20*$xspace}" y="{400-$inf - 25}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type='informal'])"/></text>
                                
                                <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}" y2="{400-$txtese}" stroke="black" stroke-width="3"/><!-- textese -->
                                <text x="{30*$xspace}" y="425" transform="rotate(30 150, 425)">Textese</text>
                                <text x="{30*$xspace}" y="{400-$txtese -25}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type='textese'])"/></text>
                            </g>
                        </svg>
                    </div>
                </div>
                <div id="emojiUse">
                    <h2>The Use of Emojis in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Emojis within the corpus</p>
                    </div>
                    <div id="emoji1"><!-- nationality comparison -->
                        <xsl:variable name="brEmoji" select="count(//u[@who='br']//g)"/>
                        <xsl:variable name="amEmoji" select="count(//u[@who='am']//g)"/>
                        <xsl:variable name="emojiNum" select="count(distinct-values(//g/@ref))"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                <polyline points="0,{400 - max(($brEmoji, $amEmoji))-10} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/> <!-- graph axis -->
                                
                                <!-- the bars -->
                                <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$amEmoji}" stroke="black" stroke-width="3"/><!-- american use of emojis -->
                                <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brEmoji}" stroke="black" stroke-width="3"/><!-- brazilian use of Emojis -->
                                
                                <!-- labels-->
                                <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- x axis label American -->
                                <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Brazilian</text><!-- x axis label Brazilian -->
                                <text x="{10*$xspace}" y="{400-$amEmoji -10}" text-anchor="middle"><xsl:value-of select="count(//u[@who='am']//g)"/></text><!-- bar label American -->
                                <text x="{20*$xspace}" y="{400-$brEmoji -10}" text-anchor="middle"><xsl:value-of select="count(//u[@who='br']//g)"/></text><!-- bar label Brazilian -->
                            </g>
                        </svg>
                    </div>
                    <div id="emoji2">
                        <xsl:variable name="cleNumAm" select="count(//u[@who='am']//g[@ref='#cle'])"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                            </g>
                        </svg>
                        
                    </div>
                    
                </div>
                
                    <h2>The Use of Laughter Notation in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Laughter Notation within the corpus</p>
                    </div>
                <div id="laughterUse">
                    <div id="laughter1">
                        <xsl:variable name="amHi" select="count(//u[@who='am']//hi)"/>
                        <xsl:variable name="brHi" select="count(//u[@who='br']//hi)"/>
                        <xsl:variable name="amHa" select="count(//u[@who='am']//hi[@type='ha'])"/>
                        <xsl:variable name="brHa" select="count(//u[@who='br']//hi[@type='ha'])"/>
                        <xsl:variable name="amK" select="count(//u[@who='am']//hi[@type='k'])"/>
                        <xsl:variable name="brK" select="count(//u[@who='br']//hi[@type='k'])"/>
                        <xsl:variable name="amRs" select="count(//u[@who='am']//hi[@type='rs'])"/>
                        <xsl:variable name="brRs" select="count(//u[@who='br']//hi[@type='rs'])"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500"><!-- nationality comparrison -->
                            <g>
                                <polyline points="0,{400 - max(($amHi, $brHi))-10} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/> <!-- graph axis -->
                                
                                <!-- bars -->
                                <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$amHi}" stroke="black" stroke-width="3"/><!-- American -->
                                <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brHi}" stroke="black" stroke-width="3"/><!-- Brazilian -->
                                
                                <!-- Labels -->
                                <text x="{10*$xspace}" y="{400-$amHi -10}" text-anchor="middle"><xsl:value-of select="$amHi"/></text><!-- american count -->
                                <text x="{20*$xspace}" y="{400-$brHi -10}" text-anchor="middle"><xsl:value-of select="$brHi"/></text><!-- Brazilian Count -->
                                <text x="25" y="{400 - max(($amHi, $brHi))-30}">The Occurance of Laughter</text> <!-- chart title -->
                                <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- american x axis label -->
                                <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)">Brazilian</text><!-- Brazilian x axis label -->
                                <text x="0" y="375" transform="rotate(-90 0,400)">Number of Instances of Laughter</text><!-- y axis label -->
                            </g>
                        </svg>
                    </div>
                    <div id="laughter2"><!-- types of laughter used by each nationality -->
                        <xsl:variable name="amHi" select="count(//u[@who='am']//hi)"/>
                        <xsl:variable name="brHi" select="count(//u[@who='br']//hi)"/>
                        <xsl:variable name="amHa" select="count(//u[@who='am']//hi[@type='ha'])"/>
                        <xsl:variable name="brHa" select="count(//u[@who='br']//hi[@type='ha'])"/>
                        <xsl:variable name="amK" select="count(//u[@who='am']//hi[@type='k'])"/>
                        <xsl:variable name="brK" select="count(//u[@who='br']//hi[@type='k'])"/>
                        <xsl:variable name="amRs" select="count(//u[@who='am']//hi[@type='rs'])"/>
                        <xsl:variable name="brRs" select="count(//u[@who='br']//hi[@type='rs'])"/>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                                
                                <!-- bars -->
                                <line x1="{5*$xspace}" y1="400" x2="{5*$xspace}" y2="{400-$amHa}" stroke="red" stroke-width="3"/><!-- american ha -->
                                <line x1="{8*$xspace}" y1="400" x2="{8*$xspace}" y2="{400-$brHa}" stroke="black" stroke-width="3"/><!-- brazilian ha -->
                                <line x1="{16*$xspace}" y1="400" x2="{16*$xspace}" y2="{400-$amK}" stroke="red" stroke-width="3"/><!-- american k -->
                                <line x1="{19*$xspace}" y1="400" x2="{19*$xspace}" y2="{400-$brK}" stroke="black" stroke-width="3"/><!-- brazilian k -->
                                <line x1="{28*$xspace}" y1="400" x2="{28*$xspace}" y2="{400-$amRs}" stroke="red" stroke-width="3"/><!-- american rs -->
                                <line x1="{31*$xspace}" y1="400" x2="{31*$xspace}" y2="{400-$brRs}" stroke="black" stroke-width="3"/><!-- brazilian rs -->
                                
                                <!-- labels -->
                                <text x="{6.5*$xspace}" y="425" text-anchor="middle">ha</text><!-- american Ha -->
                                <text x="{17.5*$xspace}" y="425" text-anchor="middle">k</text><!-- k -->
                                <text x="{30.5*$xspace}" y="425" text-anchor="middle">rs</text><!-- american rs -->
                                <text x="25" y="{400 - max(($amHi, $brHi))-20}">The Varieties of Laughter Used</text><!-- Title -->
                                <text x="-30" y="360" transform="rotate(-90 0,375)">Instances Used</text><!-- y axis -->
                                <text x="0" y="450">Type of Laughter</text><!-- x axis -->
                                <text x="{5*$xspace}" y="{400-$amHa -10}" text-anchor="middle"><xsl:value-of select="$amHa"/></text><!-- a ha count -->
                                <text x="{8*$xspace}" y="{400-$brHa -10}" text-anchor="middle"><xsl:value-of select="$brHa"/></text><!-- b ha count -->
                                <text x="{16*$xspace}" y="{400-$amK -10}" text-anchor="middle"><xsl:value-of select="$amK"/></text><!-- a k count -->
                                <text x="{19*$xspace}" y="{400-$brK -10}" text-anchor="middle"><xsl:value-of select="$brK"/></text><!-- b k count -->
                                <text x="{28*$xspace}" y="{400-$amRs -10}" text-anchor="middle"><xsl:value-of select="$amRs"/></text><!-- a rs count -->
                                <text x="{31*$xspace}" y="{400-$brRs -10}" text-anchor="middle"><xsl:value-of select="$brRs"/></text><!-- b rs count -->
                                
                                <polyline points="0,{400 - max(($amHi, $brHi))-10} 0,400 {40*$xspace},400" stroke="black" stroke-width="3" fill="none"/> 
                                <!-- graph axis -->
                                
                            </g>
                        </svg>
                    </div>
                    
                </div>
                <div id="correctionsUse">
                    <h2>The Use of Corrections in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Correction within the corpus</p>
                    </div>
                    <div id="correction1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                            </g>
                        </svg>
                    </div>
                    <div id="correction2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                            </g>
                        </svg>
                    </div>
                </div>
                <div id="expandedForms">
                    <h2>The Use of Expanded Forms in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Expanded Forms within the corpus</p>
                    </div>
                    <div id="expanded1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                            </g>
                        </svg>
                    </div>
                    <div id="expanded2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                            <g>
                                
                            </g>
                        </svg>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>