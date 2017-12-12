<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="xspace" select="5"/>
    <xsl:variable name="yspace" select="5"/>
    
    
    
    
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            
            <head>
                <title>Analysis</title>
                <link rel="stylesheet" type="text/css" href="../css/index.css"/>
            </head>
            <body>
                <a id="topImg" href="http://portu-whatsapp.newtfire.org/index.html">
                    <img src="Corcovado.jpg" alt="Rio de Janeiro"/>
                </a>
                <!--#include virtual="../ssi/ssi_menu_other_pages.html" -->
                <div class="header" id="header">
                    <h1>Analysis</h1>
                    <hr/>
                    <div class="description">
                        <p>At this stage in our production, there are still plenty of research
                            questions that we are interested in pursuing. There are several
                            possibilities, such as looking at the use of emojis within the texting
                            conventions, any speech errors made by the non native speakers (and
                            whether or not they are corrected by the native speaker), extended
                            pauses between links of text, and any characteristic use of
                            punctuation.</p>
                    </div>
                    
                </div>
                <div class="main"> Here we will discuss some of our original research questions. The
                    main topics that we decided to look at within the data include <a class="internal" href="#abbreviations">the use of abbreviations</a>, 
                    <a href="#emojiUse" class="internal">speech errors</a> made by the non-native speaker, <a href="#laugh" class="internal">usage of laughter</a> between links
                    of text, and <a href="#corrections" class="internal">any corrections</a>, and the use of <a class="internal" href="#expanForms"
                        >expanded forms</a>
                    <h2>The Use of Abbreviations in Texting</h2>
                    <div class="description">
                        <p>Below is a graph that represents the amount of times that any notable
                            form of an abbreviation was used within the texting partner groups. This
                            selection is only representative of a few of the converstaions that were
                            captured in the WhatsApp screenshots that we processed.</p>
                    </div>
                    <div id="abbreviations">
                        <div id="abbr1">
                            <!-- nationality comparison -->
                            <xsl:variable name="totabbr" select="count(//abbr)"/>
                            <xsl:variable name="amAbbr" select="count(//u[@who = 'am']//abbr)"/>
                            <xsl:variable name="brAbbr" select="count(//u[@who = 'br']//abbr)"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-50 150 200 500">
                                <g>
                                    <polyline points="0,{max(($amAbbr, $brAbbr))-10} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    
                                    <!-- Labels -->
                                    <text x="20" y="{max(($amAbbr, $brAbbr))-20}">Abbreviations by Nationality</text><!-- title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">The number of Abbreviations Used</text><!-- y axis -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="{400-count(//u[@who='am']//abbr)-20}" text-anchor="middle"><xsl:value-of select="count(//u[@who = 'am']//abbr)"/></text><!-- Am Count -->
                                    <text x="{20*$xspace}" y="{400-count(//u[@who='br']//abbr)-20}" text-anchor="middle"><xsl:value-of select="count(//u[@who = 'br']//abbr)"/></text><!-- Br Count -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- x axis variable American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Brazilian</text><!-- x axis variable Brazilian -->
                                    
                                    <!-- Bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400 - count(//u[@who='am']//abbr)}" stroke-width="3" stroke="black"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400 - count(//u[@who='br']//abbr)}" stroke-width="3" stroke="black"/><!-- Brazilian -->
                                </g>
                            </svg>
                        </div>
                        <div id="abbr2">
                            <!-- types of abbreviation comparison -->
                            <xsl:variable name="contra" select="count(//abbr[@type = 'contraction'])"/>
                            <xsl:variable name="inf" select="count(//abbr[@type = 'informal'])"/>
                            <xsl:variable name="txtese" select="count(//abbr[@type = 'textese'])"/>
                            <xsl:variable name="numVar" select="count(distinct-values(//abbr/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g>
                                    <!-- labels for the graphs -->
                                    <text x="25" y="{max(($contra, $inf, $txtese))-25}">Types of Abbreviations Used</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Number of Each Type of Abbreviation</text> <!-- y axis label -->
                                    <text x="0" y="480">Types of Abbreviations</text> <!-- x axis label -->
                                    
                                    <polyline points="0,{max(($contra, $inf, $txtese))-10} 0,400 {15*$xspace*$numVar},400" stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis --> 
                                    
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$contra}" stroke="black" stroke-width="3"/><!-- contraction -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$inf}" stroke-width="3" stroke="black"/><!-- informal -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}" y2="{400-$txtese}" stroke="black" stroke-width="3"/><!-- textese -->
                                    
                                    
                                    <!-- labels for variabls -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">Contraction</text><!-- contractions -->
                                    <text x="{10*$xspace}" y="{400-$contra - 10}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type = 'contraction'])"/></text><!-- contraction values -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Informal</text><!-- informal -->
                                    <text x="{20*$xspace}" y="{400-$inf - 25}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type = 'informal'])"/></text><!-- informal values -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150, 425)">Textese</text><!-- textese -->
                                    <text x="{30*$xspace}" y="{400-$txtese -25}" text-anchor="middle"><xsl:value-of select="count(//abbr[@type = 'textese'])"/></text><!-- textese values -->
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="abbrDesc">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et viverra ante, sed iaculis libero. Curabitur vel ligula molestie, iaculis nulla ullamcorper, vehicula nulla. Morbi eleifend suscipit est, a ultrices tellus ultrices eget. In a porttitor tortor, vel tincidunt lorem. Etiam mollis, magna a molestie varius, est turpis auctor nulla, sed pharetra sapien justo in risus. Nunc sed efficitur ipsum. Aliquam ut nunc viverra, sodales turpis id, efficitur odio. Donec non ultricies lorem. Suspendisse potenti. Suspendisse potenti. Fusce tempor sollicitudin viverra. Suspendisse metus nisi, pharetra a lacus vel, mollis imperdiet nisi. Vivamus at volutpat mi. Nulla eget lacus non ex mattis efficitur id vitae justo. Morbi tincidunt purus non mauris posuere, in mattis elit euismod. Nam accumsan enim diam, quis euismod dolor efficitur id. Ut facilisis faucibus quam, at volutpat ex tincidunt sed. Nam ac ipsum orci. Nunc turpis sem, semper et consectetur eu, aliquet ut metus. Sed ultrices tellus sit amet risus feugiat placerat. Curabitur at aliquet diam. Mauris varius ultrices nisl non feugiat. Aliquam condimentum libero eu augue sollicitudin, a molestie nisl finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi egestas efficitur enim, eget posuere odio. Ut vehicula lacus non pulvinar accumsan. Etiam sodales ultrices sapien, sit amet auctor risus cursus quis. Vestibulum vulputate odio ex, sodales lobortis odio tristique dictum. Maecenas vestibulum egestas quam a ultrices. Phasellus bibendum consequat nisi, id viverra ante rutrum at. Aliquam auctor massa sit amet neque elementum, et volutpat odio varius. Nulla nec vestibulum augue. Mauris bibendum purus lacus, sit amet auctor dolor fringilla et. Duis vel viverra dolor. Phasellus accumsan ligula nisl. Suspendisse eget est non diam pharetra malesuada sed a enim. Sed non eros lobortis, maximus libero a, semper dui. Praesent ut nisi et justo tincidunt venenatis in ac neque. In sit amet erat urna. Duis ultricies semper dictum. Duis porta erat vestibulum mauris efficitur pulvinar. Praesent molestie porta lacus, eget convallis augue dictum vel. Morbi id iaculis tellus. Suspendisse auctor accumsan nunc in lacinia. Mauris ut vehicula sem, eget interdum dui. Maecenas vehicula nec risus non ornare. Sed eget viverra ex. Donec interdum elementum tortor, in hendrerit nisl varius in. Nullam vulputate urna ante, et dapibus ex congue vitae. Cras dignissim, odio imperdiet tristique dapibus, tellus tortor porta sem, et sollicitudin diam turpis in tortor. Cras mauris odio, volutpat fringilla sagittis sed, varius in elit. Nulla facilisi. Aliquam condimentum, lorem a mattis laoreet, mi urna rhoncus quam, vitae cursus enim magna non eros. Vivamus tincidunt ultrices consectetur. In hac habitasse platea dictumst. Nullam sed pharetra ante, vel rutrum lacus. Vestibulum ornare dictum risus. Nullam convallis iaculis nisi. Cras semper turpis nec ex aliquam auctor. Vestibulum faucibus, magna eget maximus venenatis, dolor erat rhoncus lectus, id suscipit ante sem ac eros.</p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    
                    <h2>The Use of Emojis in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Emojis within the
                            corpus</p>
                    </div>
                    <div id="emojiUse">
                        <div id="emoji1"><!-- nationality comparison -->
                            <xsl:variable name="brEmoji" select="count(.//u[@who='br']/g)+sum(.//u[@who='br']/g/@n)-count(.//u[@who='br']/g[@n])"/>
                            <xsl:variable name="amEmoji" select="count(.//u[@who='am']/g)+sum(.//u[@who='am']/g/@n)-count(.//u[@who='am']/g[@n])"/>
                            <xsl:variable name="emojiNum" select="count(distinct-values(//g/@ref))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g>
                                    <polyline
                                        points="0,{400 - max(($brEmoji*(.5*$yspace), $amEmoji*(.5*$yspace)))-50} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    
                                    <!-- the bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$amEmoji*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- american use of emojis -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brEmoji*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- brazilian use of Emojis -->
                                    
                                    <!-- labels-->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- x axis label American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Brazilian</text><!-- x axis label Brazilian -->
                                    <text x="0" y="{400 - max(($brEmoji*(.5*$yspace), $amEmoji*(.5*$yspace)))-70}">Use of Emojis by Nationality</text> <!-- chart title -->
                                    <text x="37" y="475" text-anchor="middle">Nationality</text><!-- x axis label  -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Number of Emojis Used</text><!-- y axis label -->
                                    <text x="{10*$xspace}" y="{400-$amEmoji*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$amEmoji"/></text><!-- num label American -->
                                    <text x="{20*$xspace}" y="{400-$brEmoji*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$brEmoji"/></text><!-- num label Brazilian -->
                                </g>
                            </svg>
                        </div>
                        <!-- <div id="emoji2">
                            <xsl:variable name="cleNumAm" select="count(//u[@who = 'am']//g[@ref = '#cle'])"/>
                            <xsl:variable name="emojiNum" select="count(distinct-values(//g/@ref))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g>
                                    <polyline points="0,0 0,400 {$emojiNum*$xspace*10},400" stroke="black" stroke-width="3" fill="none"/> 
                                </g>
                            </svg>
                        </div> -->
                    </div>
                    <div id="emojidesc">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et viverra ante, sed iaculis libero. Curabitur vel ligula molestie, iaculis nulla ullamcorper, vehicula nulla. Morbi eleifend suscipit est, a ultrices tellus ultrices eget. In a porttitor tortor, vel tincidunt lorem. Etiam mollis, magna a molestie varius, est turpis auctor nulla, sed pharetra sapien justo in risus. Nunc sed efficitur ipsum. Aliquam ut nunc viverra, sodales turpis id, efficitur odio. Donec non ultricies lorem. Suspendisse potenti. Suspendisse potenti. Fusce tempor sollicitudin viverra. Suspendisse metus nisi, pharetra a lacus vel, mollis imperdiet nisi. Vivamus at volutpat mi. Nulla eget lacus non ex mattis efficitur id vitae justo. Morbi tincidunt purus non mauris posuere, in mattis elit euismod. Nam accumsan enim diam, quis euismod dolor efficitur id. Ut facilisis faucibus quam, at volutpat ex tincidunt sed. Nam ac ipsum orci. Nunc turpis sem, semper et consectetur eu, aliquet ut metus. Sed ultrices tellus sit amet risus feugiat placerat. Curabitur at aliquet diam. Mauris varius ultrices nisl non feugiat. Aliquam condimentum libero eu augue sollicitudin, a molestie nisl finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi egestas efficitur enim, eget posuere odio. Ut vehicula lacus non pulvinar accumsan. Etiam sodales ultrices sapien, sit amet auctor risus cursus quis. Vestibulum vulputate odio ex, sodales lobortis odio tristique dictum. Maecenas vestibulum egestas quam a ultrices. Phasellus bibendum consequat nisi, id viverra ante rutrum at. Aliquam auctor massa sit amet neque elementum, et volutpat odio varius. Nulla nec vestibulum augue. Mauris bibendum purus lacus, sit amet auctor dolor fringilla et. Duis vel viverra dolor. Phasellus accumsan ligula nisl. Suspendisse eget est non diam pharetra malesuada sed a enim. Sed non eros lobortis, maximus libero a, semper dui. Praesent ut nisi et justo tincidunt venenatis in ac neque. In sit amet erat urna. Duis ultricies semper dictum. Duis porta erat vestibulum mauris efficitur pulvinar. Praesent molestie porta lacus, eget convallis augue dictum vel. Morbi id iaculis tellus. Suspendisse auctor accumsan nunc in lacinia. Mauris ut vehicula sem, eget interdum dui. Maecenas vehicula nec risus non ornare. Sed eget viverra ex. Donec interdum elementum tortor, in hendrerit nisl varius in. Nullam vulputate urna ante, et dapibus ex congue vitae. Cras dignissim, odio imperdiet tristique dapibus, tellus tortor porta sem, et sollicitudin diam turpis in tortor. Cras mauris odio, volutpat fringilla sagittis sed, varius in elit. Nulla facilisi. Aliquam condimentum, lorem a mattis laoreet, mi urna rhoncus quam, vitae cursus enim magna non eros. Vivamus tincidunt ultrices consectetur. In hac habitasse platea dictumst. Nullam sed pharetra ante, vel rutrum lacus. Vestibulum ornare dictum risus. Nullam convallis iaculis nisi. Cras semper turpis nec ex aliquam auctor. Vestibulum faucibus, magna eget maximus venenatis, dolor erat rhoncus lectus, id suscipit ante sem ac eros.</p>
                    </div>  
                    <a href="#topImg" class="internal">Top</a>
                    <h2>The Use of Laughter Notation in Texting</h2>
                    <div class="description">
                        <p>This is the chart talking about the use of Laughter Notation within the
                            corpus</p>
                    </div>
                    <div id="laugh">
                        <div id="laugh1">
                            <xsl:variable name="amHi" select="count(//u[@who = 'am']//hi)"/>
                            <xsl:variable name="brHi" select="count(//u[@who = 'br']//hi)"/>
                            <xsl:variable name="amHa" select="count(//u[@who = 'am']//hi[@type = 'ha'])"/>
                            <xsl:variable name="brHa" select="count(//u[@who = 'br']//hi[@type = 'ha'])"/>
                            <xsl:variable name="amK"  select="count(//u[@who = 'am']//hi[@type = 'k'])"/>
                            <xsl:variable name="brK"  select="count(//u[@who = 'br']//hi[@type = 'k'])"/>
                            <xsl:variable name="amRs" select="count(//u[@who = 'am']//hi[@type = 'rs'])"/>
                            <xsl:variable name="brRs" select="count(//u[@who = 'br']//hi[@type = 'rs'])"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800"
                                viewBox="-100 100 500 500"><!-- nationality comparrison -->
                                <g>
                                    <polyline points="0,{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-10} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$amHi*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brHi*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- Brazilian -->
                                    
                                    <!-- Labels -->
                                    <text x="{10*$xspace}" y="{400-$amHi*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$amHi"/></text><!-- american count -->
                                    <text x="{20*$xspace}" y="{400-$brHi*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$brHi"/></text><!-- Brazilian Count -->
                                    <text x="25" y="{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-30}">The Occurance of Laughter</text><!-- chart title -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- american x axis label -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)">Brazilian</text><!-- Brazilian x axis label -->
                                    <text x="0" y="375" transform="rotate(-90 0,400)">Instances of Laughter</text><!-- y axis label -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                </g>
                            </svg>
                        </div>
                        <div id="laughter2"><!-- types of laughter used by each nationality -->
                            <xsl:variable name="amHi" select="count(//u[@who = 'am']//hi)"/>
                            <xsl:variable name="brHi" select="count(//u[@who = 'br']//hi)"/>
                            <xsl:variable name="amHa" select="count(//u[@who = 'am']//hi[@type = 'ha'])"/>
                            <xsl:variable name="brHa" select="count(//u[@who = 'br']//hi[@type = 'ha'])"/>
                            <xsl:variable name="amK" select="count(//u[@who = 'am']//hi[@type = 'k'])"/>
                            <xsl:variable name="brK" select="count(//u[@who = 'br']//hi[@type = 'k'])"/>
                            <xsl:variable name="amRs" select="count(//u[@who = 'am']//hi[@type = 'rs'])"/>
                            <xsl:variable name="brRs" select="count(//u[@who = 'br']//hi[@type = 'rs'])"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g>
                                    <!-- bars -->
                                    <line x1="{5*$xspace}" y1="400" x2="{5*$xspace}" y2="{400-$amHa*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american ha -->
                                    <line x1="{8*$xspace}" y1="400" x2="{8*$xspace}" y2="{400-$brHa*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- brazilian ha -->
                                    <line x1="{16*$xspace}" y1="400" x2="{16*$xspace}" y2="{400-$amK*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american k -->
                                    <line x1="{19*$xspace}" y1="400" x2="{19*$xspace}" y2="{400-$brK*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- brazilian k -->
                                    <line x1="{28*$xspace}" y1="400" x2="{28*$xspace}" y2="{400-$amRs*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american rs -->
                                    <line x1="{31*$xspace}" y1="400" x2="{31*$xspace}" y2="{400-$brRs*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- brazilian rs -->
                                    
                                    <!-- labels -->
                                    <text x="{6.5*$xspace}" y="425" text-anchor="middle">ha</text><!-- Ha -->
                                    <text x="{17.5*$xspace}" y="425" text-anchor="middle">k</text><!-- k -->
                                    <text x="{30.5*$xspace}" y="425" text-anchor="middle">rs</text><!-- rs -->
                                    <text x="25" y="{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-20}">The Varieties of Laughter Used</text><!-- Title -->
                                    <text x="-30" y="360" transform="rotate(-90 0,375)">Instances Used</text><!-- y axis -->
                                    <text x="0" y="450">Type of Laughter</text><!-- x axis -->
                                    <text x="{5*$xspace}" y="{400-$amHa*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$amHa"/></text><!-- a ha count -->
                                    <text x="{8*$xspace}" y="{400-$brHa*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$brHa"/></text><!-- b ha count -->
                                    <text x="{16*$xspace}" y="{400-$amK*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$amK"/></text><!-- a k count -->
                                    <text x="{19*$xspace}" y="{400-$brK*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$brK"/></text><!-- b k count -->
                                    <text x="{28*$xspace}" y="{400-$amRs*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$amRs"/></text><!-- a rs count -->
                                    <text x="{31*$xspace}" y="{400-$brRs*(.5*$yspace) -10}" text-anchor="middle"><xsl:value-of select="$brRs"/></text><!-- b rs count -->
                                    
                                    <!-- graph axis -->
                                    <polyline points="0,{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-10} 0,400 {40*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="laughDesc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et viverra ante, sed iaculis libero. Curabitur vel ligula molestie, iaculis nulla ullamcorper, vehicula nulla. Morbi eleifend suscipit est, a ultrices tellus ultrices eget. In a porttitor tortor, vel tincidunt lorem. Etiam mollis, magna a molestie varius, est turpis auctor nulla, sed pharetra sapien justo in risus. Nunc sed efficitur ipsum. Aliquam ut nunc viverra, sodales turpis id, efficitur odio. Donec non ultricies lorem. Suspendisse potenti. Suspendisse potenti. Fusce tempor sollicitudin viverra. Suspendisse metus nisi, pharetra a lacus vel, mollis imperdiet nisi. Vivamus at volutpat mi. Nulla eget lacus non ex mattis efficitur id vitae justo. Morbi tincidunt purus non mauris posuere, in mattis elit euismod. Nam accumsan enim diam, quis euismod dolor efficitur id. Ut facilisis faucibus quam, at volutpat ex tincidunt sed. Nam ac ipsum orci. Nunc turpis sem, semper et consectetur eu, aliquet ut metus. Sed ultrices tellus sit amet risus feugiat placerat. Curabitur at aliquet diam. Mauris varius ultrices nisl non feugiat. Aliquam condimentum libero eu augue sollicitudin, a molestie nisl finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi egestas efficitur enim, eget posuere odio. Ut vehicula lacus non pulvinar accumsan. Etiam sodales ultrices sapien, sit amet auctor risus cursus quis. Vestibulum vulputate odio ex, sodales lobortis odio tristique dictum. Maecenas vestibulum egestas quam a ultrices. Phasellus bibendum consequat nisi, id viverra ante rutrum at. Aliquam auctor massa sit amet neque elementum, et volutpat odio varius. Nulla nec vestibulum augue. Mauris bibendum purus lacus, sit amet auctor dolor fringilla et. Duis vel viverra dolor. Phasellus accumsan ligula nisl. Suspendisse eget est non diam pharetra malesuada sed a enim. Sed non eros lobortis, maximus libero a, semper dui. Praesent ut nisi et justo tincidunt venenatis in ac neque. In sit amet erat urna. Duis ultricies semper dictum. Duis porta erat vestibulum mauris efficitur pulvinar. Praesent molestie porta lacus, eget convallis augue dictum vel. Morbi id iaculis tellus. Suspendisse auctor accumsan nunc in lacinia. Mauris ut vehicula sem, eget interdum dui. Maecenas vehicula nec risus non ornare. Sed eget viverra ex. Donec interdum elementum tortor, in hendrerit nisl varius in. Nullam vulputate urna ante, et dapibus ex congue vitae. Cras dignissim, odio imperdiet tristique dapibus, tellus tortor porta sem, et sollicitudin diam turpis in tortor. Cras mauris odio, volutpat fringilla sagittis sed, varius in elit. Nulla facilisi. Aliquam condimentum, lorem a mattis laoreet, mi urna rhoncus quam, vitae cursus enim magna non eros. Vivamus tincidunt ultrices consectetur. In hac habitasse platea dictumst. Nullam sed pharetra ante, vel rutrum lacus. Vestibulum ornare dictum risus. Nullam convallis iaculis nisi. Cras semper turpis nec ex aliquam auctor. Vestibulum faucibus, magna eget maximus venenatis, dolor erat rhoncus lectus, id suscipit ante sem ac eros.</p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    
                        <h2>The Use of Corrections in Texting</h2>
                        <div class="description">
                            <p>This is the chart talking about the use of Correction within the
                                corpus</p>
                        </div>
                    <div id="corrections">
                        <div id="correction1">
                            <xsl:variable name="amCorr" select="count(//u[@who='am']/corr)"/>
                            <xsl:variable name="brCorr" select="count(//u[@who='br']/corr)"/>
                            
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500"><!-- nationality comparon -->
                                <g>
                                    <!-- graph axis -->
                                    <polyline points="0,{400 - max(($amCorr, $brCorr))*$yspace -50} 0,400 {30*$xspace},400" stroke="black" stroke-width="3" fill="none"/>
                                    
                                    
                                    <!-- Bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{(400-$amCorr*$yspace)}" stroke="black" stroke-width="3"/><!-- american -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brCorr*$yspace}" stroke="black" stroke-width="3"/><!-- brazilian -->
                                    
                                    <!-- labels -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text> <!-- american x axis -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)">Brazilian</text><!-- brazilian x axis -->
                                    <text x="{10*$xspace}" y="{400-$amCorr*$yspace -15}" text-anchor="middle"><xsl:value-of select="$amCorr"/></text><!-- american number -->
                                    <text x="{20*$xspace}" y="{400-$brCorr*$yspace -15}" text-anchor="middle"><xsl:value-of select="$brCorr"/></text><!-- brazilian Number -->
                                    <text x="25" y="{400 - max(($amCorr, $brCorr))*$yspace -70}">The Use of Corrections</text><!-- chart title -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of Corrections</text><!-- y axis -->
                                    
                                </g>
                            </svg>
                        </div>
                        <div id="correction2"> 
                            <xsl:variable name="exp" select="count(//corr[@type='explicit'])"/>
                            <xsl:variable name="imp" select="count(//corr[@type='implicit'])"/>
                            <xsl:variable name="self" select="count(//corr[@type='self'])"/>
                            <xsl:variable name="varNum" select="count(distinct-values(//corr/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500"><!-- types of corrections comparrison -->
                                <g> 
                                    <!-- graph axis -->
                                    <polyline points="0,{400 - max(($exp, $imp, $self))*$yspace -50} 0,400 {10*$xspace*$varNum +10},400" stroke="black" stroke-width="3" fill="none"/>
                                    
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$exp*$yspace}" stroke="black" stroke-width="3"/><!-- explicit corrections -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$imp*$yspace}" stroke="black" stroke-width="3"/><!-- implicit corrections -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}" y2="{400-$self*$yspace}" stroke="black" stroke-width="3"/><!-- self corrections -->
                                    
                                    <!-- labels -->
                                    <text x="25" y="{400 - max(($exp, $imp, $self))*$yspace -70}">Types of Corrections Used</text><!-- title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of Corrections</text><!-- y axis -->
                                    <text x="0" y="475"></text><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50, 425)">Explicit</text><!-- x axis exp -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)">Implicit</text><!-- x axis imp -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150, 425)">Self</text><!-- x axis self -->
                                    <text x="{10*$xspace}" y="{400-$exp*$yspace -15}" text-anchor="middle"><xsl:value-of select="$exp"/></text><!-- exp number -->
                                    <text x="{20*$xspace}" y="{400-$imp*$yspace -15}" text-anchor="middle"><xsl:value-of select="$imp"/></text><!-- imp number -->
                                    <text x="{30*$xspace}" y="{400-$self*$yspace -15}" text-anchor="middle"><xsl:value-of select="$self"/></text><!-- self number -->
                                    
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="corrDesc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et viverra ante, sed iaculis libero. Curabitur vel ligula molestie, iaculis nulla ullamcorper, vehicula nulla. Morbi eleifend suscipit est, a ultrices tellus ultrices eget. In a porttitor tortor, vel tincidunt lorem. Etiam mollis, magna a molestie varius, est turpis auctor nulla, sed pharetra sapien justo in risus. Nunc sed efficitur ipsum. Aliquam ut nunc viverra, sodales turpis id, efficitur odio. Donec non ultricies lorem. Suspendisse potenti. Suspendisse potenti. Fusce tempor sollicitudin viverra. Suspendisse metus nisi, pharetra a lacus vel, mollis imperdiet nisi. Vivamus at volutpat mi. Nulla eget lacus non ex mattis efficitur id vitae justo. Morbi tincidunt purus non mauris posuere, in mattis elit euismod. Nam accumsan enim diam, quis euismod dolor efficitur id. Ut facilisis faucibus quam, at volutpat ex tincidunt sed. Nam ac ipsum orci. Nunc turpis sem, semper et consectetur eu, aliquet ut metus. Sed ultrices tellus sit amet risus feugiat placerat. Curabitur at aliquet diam. Mauris varius ultrices nisl non feugiat. Aliquam condimentum libero eu augue sollicitudin, a molestie nisl finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi egestas efficitur enim, eget posuere odio. Ut vehicula lacus non pulvinar accumsan. Etiam sodales ultrices sapien, sit amet auctor risus cursus quis. Vestibulum vulputate odio ex, sodales lobortis odio tristique dictum. Maecenas vestibulum egestas quam a ultrices. Phasellus bibendum consequat nisi, id viverra ante rutrum at. Aliquam auctor massa sit amet neque elementum, et volutpat odio varius. Nulla nec vestibulum augue. Mauris bibendum purus lacus, sit amet auctor dolor fringilla et. Duis vel viverra dolor. Phasellus accumsan ligula nisl. Suspendisse eget est non diam pharetra malesuada sed a enim. Sed non eros lobortis, maximus libero a, semper dui. Praesent ut nisi et justo tincidunt venenatis in ac neque. In sit amet erat urna. Duis ultricies semper dictum. Duis porta erat vestibulum mauris efficitur pulvinar. Praesent molestie porta lacus, eget convallis augue dictum vel. Morbi id iaculis tellus. Suspendisse auctor accumsan nunc in lacinia. Mauris ut vehicula sem, eget interdum dui. Maecenas vehicula nec risus non ornare. Sed eget viverra ex. Donec interdum elementum tortor, in hendrerit nisl varius in. Nullam vulputate urna ante, et dapibus ex congue vitae. Cras dignissim, odio imperdiet tristique dapibus, tellus tortor porta sem, et sollicitudin diam turpis in tortor. Cras mauris odio, volutpat fringilla sagittis sed, varius in elit. Nulla facilisi. Aliquam condimentum, lorem a mattis laoreet, mi urna rhoncus quam, vitae cursus enim magna non eros. Vivamus tincidunt ultrices consectetur. In hac habitasse platea dictumst. Nullam sed pharetra ante, vel rutrum lacus. Vestibulum ornare dictum risus. Nullam convallis iaculis nisi. Cras semper turpis nec ex aliquam auctor. Vestibulum faucibus, magna eget maximus venenatis, dolor erat rhoncus lectus, id suscipit ante sem ac eros.</p>
                        
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    
                        <h2>The Use of Expanded Forms in Texting</h2>
                        <div class="description">
                            <p>This is the chart talking about the use of Expanded Forms within the
                                corpus</p>
                        </div>
                    <div id="expanForms">
                        <div id="expanded1"><!-- nationality comparrison -->
                            <xsl:variable name="amExpan" select="count(//u[@who='am']//expan)"/>
                            <xsl:variable name="brExpan" select="count(//u[@who='br']//expan)"/>
                            <xsl:variable name="numVar" select="count(distinct-values(//u/@who))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g> 
                                    <!-- graph axis -->
                                    <polyline points="0,{400-max(($amExpan*(.5), $brExpan*(.5)))-50} 0,400 {10*$xspace*$numVar +20},400" stroke="black" stroke-width="3" fill="none"/>
                                    
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$amExpan*.5}" stroke-width="3" stroke="black"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$brExpan*.5}" stroke-width="3" stroke="black"/><!-- brazilian -->
                                    
                                    <!-- labels -->
                                    <text x="0" y="{400-max(($amExpan*(.5), $brExpan*(.5)))-70}">Expanded Forms by Nationality</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of Expanded Forms Used</text><!-- y axis -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">American</text><!-- x axis American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)">Brazilian</text><!-- x axis Brazilian -->
                                    <text x="{10*$xspace}" y="{(400-$amExpan*.5)-15}" text-anchor="middle"><xsl:value-of select="$amExpan"/></text><!-- american Number -->
                                    <text x="{20*$xspace}" y="{(400-$brExpan*.5)-15}" text-anchor="middle"><xsl:value-of select="$brExpan"/></text><!-- brazilian Number -->
                                
                                </g>
                            </svg>
                        </div>
                        <div id="expanded2"> <!-- comparing types of expanded forms -->
                            <xsl:variable name="exFormal" select="count(//expan[@type='formal'])" />
                            <xsl:variable name="exFull" select="count(//expan[@type='full'])"/>
                            <xsl:variable name="exUncon" select="count(//expan[@type='uncontracted'])"/>
                            <xsl:variable name="numVar" select="count(distinct-values(//expan/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="-100 100 500 500">
                                <g> 
                                    <!-- graph axis -->
                                    <polyline points="0,{400-max(($exFormal*(.5), $exFull*(.5), $exUncon*(.5)))-50} 0,400 {10*$xspace*$numVar +20},400" stroke="black" stroke-width="3" fill="none"/>
                                    
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}" y2="{400-$exFormal*(.5)}" stroke="black" stroke-width="3"/><!-- formal -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}" y2="{400-$exFull*(.5)}" stroke="black" stroke-width="3"/><!-- full -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}" y2="{400-$exUncon*(.5)}" stroke="black" stroke-width="3"/><!-- uncontracted -->
                                    
                                    <!-- labels -->
                                    <text x="15" y="{400-max(($exFormal*(.5), $exFull*(.5), $exUncon*(.5)))-50}">Types of Expanded Forms</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20, 400)">Amount of Expanded Forms Used</text><!-- y axis -->
                                    <text x="0" y="475">Type of Expanded Form</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)">Formal</text><!-- x axis formal -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)">Full</text><!-- x axis full -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150,425)">Uncontracted</text><!-- x axis uncontracted -->
                                    <text x="{10*$xspace}" y="{400-$exFormal*(.5)-15}" text-anchor="middle"><xsl:value-of select="$exFormal"/></text><!-- formal number -->
                                    <text x="{20*$xspace}" y="{400-$exFull*(.5)-15}" text-anchor="middle"><xsl:value-of select="$exFull"/></text><!-- full number -->
                                    <text x="{30*$xspace}" y="{400-$exUncon*(.5)-15}" text-anchor="middle"><xsl:value-of select="$exUncon"/></text><!-- uncontracted number -->
                                   
                               </g>
                            </svg>
                        </div>
                    </div>
                    <div id="expanDisc">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et viverra ante, sed iaculis libero. Curabitur vel ligula molestie, iaculis nulla ullamcorper, vehicula nulla. Morbi eleifend suscipit est, a ultrices tellus ultrices eget. In a porttitor tortor, vel tincidunt lorem. Etiam mollis, magna a molestie varius, est turpis auctor nulla, sed pharetra sapien justo in risus. Nunc sed efficitur ipsum. Aliquam ut nunc viverra, sodales turpis id, efficitur odio. Donec non ultricies lorem. Suspendisse potenti. Suspendisse potenti. Fusce tempor sollicitudin viverra. Suspendisse metus nisi, pharetra a lacus vel, mollis imperdiet nisi. Vivamus at volutpat mi. Nulla eget lacus non ex mattis efficitur id vitae justo. Morbi tincidunt purus non mauris posuere, in mattis elit euismod. Nam accumsan enim diam, quis euismod dolor efficitur id. Ut facilisis faucibus quam, at volutpat ex tincidunt sed. Nam ac ipsum orci. Nunc turpis sem, semper et consectetur eu, aliquet ut metus. Sed ultrices tellus sit amet risus feugiat placerat. Curabitur at aliquet diam. Mauris varius ultrices nisl non feugiat. Aliquam condimentum libero eu augue sollicitudin, a molestie nisl finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi egestas efficitur enim, eget posuere odio. Ut vehicula lacus non pulvinar accumsan. Etiam sodales ultrices sapien, sit amet auctor risus cursus quis. Vestibulum vulputate odio ex, sodales lobortis odio tristique dictum. Maecenas vestibulum egestas quam a ultrices. Phasellus bibendum consequat nisi, id viverra ante rutrum at. Aliquam auctor massa sit amet neque elementum, et volutpat odio varius. Nulla nec vestibulum augue. Mauris bibendum purus lacus, sit amet auctor dolor fringilla et. Duis vel viverra dolor. Phasellus accumsan ligula nisl. Suspendisse eget est non diam pharetra malesuada sed a enim. Sed non eros lobortis, maximus libero a, semper dui. Praesent ut nisi et justo tincidunt venenatis in ac neque. In sit amet erat urna. Duis ultricies semper dictum. Duis porta erat vestibulum mauris efficitur pulvinar. Praesent molestie porta lacus, eget convallis augue dictum vel. Morbi id iaculis tellus. Suspendisse auctor accumsan nunc in lacinia. Mauris ut vehicula sem, eget interdum dui. Maecenas vehicula nec risus non ornare. Sed eget viverra ex. Donec interdum elementum tortor, in hendrerit nisl varius in. Nullam vulputate urna ante, et dapibus ex congue vitae. Cras dignissim, odio imperdiet tristique dapibus, tellus tortor porta sem, et sollicitudin diam turpis in tortor. Cras mauris odio, volutpat fringilla sagittis sed, varius in elit. Nulla facilisi. Aliquam condimentum, lorem a mattis laoreet, mi urna rhoncus quam, vitae cursus enim magna non eros. Vivamus tincidunt ultrices consectetur. In hac habitasse platea dictumst. Nullam sed pharetra ante, vel rutrum lacus. Vestibulum ornare dictum risus. Nullam convallis iaculis nisi. Cras semper turpis nec ex aliquam auctor. Vestibulum faucibus, magna eget maximus venenatis, dolor erat rhoncus lectus, id suscipit ante sem ac eros. 
                            </p>
                        </div>
                    <a href="#topImg" class="internal">Top</a>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
