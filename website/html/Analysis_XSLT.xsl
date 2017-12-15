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
                <link rel="stylesheet" type="text/css" href="../css/analysis.css"/>
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
                        <p>Our main question entering this proejct was what the difference was
                            between the interactions of the Americans and the Brazilians. Initially,
                            we anticipated more errors along with corrections from the Brazilians;
                            however, as we combed through we did not notice many errors in the
                            Americans' messages and, often, the Brazilians did not correct the
                            Americans outwardly. We also noted the use of emojis and laughter and
                            tracked these, anticipating that Brazilians would utilize them more than
                            the American students. What then struck us was the overt use of
                            'textese', or forms simplified for the writer's convenience, and took
                            interest in that use of abbreviated forms, as well.</p>
                        <p>Something important to note before diving into our results is that the
                            Brazilians, on average, outspoke their American conversation partners
                            within our data. The Americans sent a total of 435 messsages and 18,898
                            characters, while the Brazilians sent 601 messages and approximately
                            21,122 characters. Thus, the Brazilians sent 166 more messages and
                            around 2,224 more characters, as well. Brazilians, on average sent 166
                            more messages than the and an estimated 2,224 more characters, as well.
                            In fact, only one American sent more messages than their Brazilian
                            language partner. In Conversation 6, the American student sent 15
                            messages, while the Brazilian partner only sent 8. This is the only
                            instance of an American out-messaging their partner.</p>
                    </div>

                </div>
                <div class="main"> Here we will discuss some of our original research questions. The
                    main topics that we decided to look at within the data include <a
                        class="internal" href="#abbreviations">the use of abbreviations</a>, <a
                        href="#emojiUse" class="internal">use of Emojis</a> made by the non-native
                    speaker, <a href="#laugh" class="internal">usage of laughter</a> between links
                    of text, and <a href="#corrections" class="internal">any corrections</a>, and
                    the use of <a class="internal" href="#expanForms">expanded forms</a>
                    <h2>The Use of Abbreviations in Texting</h2>
                    <!--  <div class="description">
                        <p>Below is a graph that represents the amount of times that any notable
                            form of an abbreviation was used within the texting partner groups. This
                            selection is only representative of a few of the converstaions that were
                            captured in the WhatsApp screenshots that we processed.</p>
                    </div> -->
                    <div id="abbreviations">
                        <div id="abbr1">
                            <!-- nationality comparison -->
                            <xsl:variable name="totabbr" select="count(//abbr)"/>
                            <xsl:variable name="amAbbr" select="count(//u[@who = 'am']//abbr)"/>
                            <xsl:variable name="brAbbr" select="count(//u[@who = 'br']//abbr)"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <polyline
                                        points="0,{max(($amAbbr, $brAbbr))-10} 0,400 {30*$xspace},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    <!-- Labels -->
                                    <text x="20" y="{max(($amAbbr, $brAbbr))-20}">Abbreviations by
                                        Nationality</text><!-- title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">The number
                                        of Abbreviations Used</text><!-- y axis -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="{400-count(//u[@who='am']//abbr)-20}"
                                        text-anchor="middle"><xsl:value-of
                                            select="count(//u[@who = 'am']//abbr)"/></text><!-- Am Count -->
                                    <text x="{20*$xspace}" y="{400-count(//u[@who='br']//abbr)-20}"
                                        text-anchor="middle"><xsl:value-of
                                            select="count(//u[@who = 'br']//abbr)"/></text><!-- Br Count -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >American</text><!-- x axis variable American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)"
                                        >Brazilian</text><!-- x axis variable Brazilian -->
                                    <!-- Bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400 - count(//u[@who='am']//abbr)}" stroke-width="3"
                                        stroke="black"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400 - count(//u[@who='br']//abbr)}" stroke-width="3"
                                        stroke="black"/><!-- Brazilian -->
                                </g>
                            </svg>
                        </div>
                        <div id="abbr2">
                            <!-- types of abbreviation comparison -->
                            <xsl:variable name="contra"
                                select="count(//abbr[@type = 'contraction'])"/>
                            <xsl:variable name="inf" select="count(//abbr[@type = 'informal'])"/>
                            <xsl:variable name="txtese" select="count(//abbr[@type = 'textese'])"/>
                            <xsl:variable name="numVar"
                                select="count(distinct-values(//abbr/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <!-- labels for the graphs -->
                                    <text x="25" y="{max(($contra, $inf, $txtese))-25}">Types of
                                        Abbreviations Used</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Number of
                                        Each Type of Abbreviation</text>
                                    <!-- y axis label -->
                                    <text x="0" y="480">Types of Abbreviations</text>
                                    <!-- x axis label -->
                                    <polyline
                                        points="0,{max(($contra, $inf, $txtese))-10} 0,400 {15*$xspace*$numVar},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$contra}" stroke="black" stroke-width="3"/><!-- contraction -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$inf}" stroke-width="3" stroke="black"/><!-- informal -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}"
                                        y2="{400-$txtese}" stroke="black" stroke-width="3"/><!-- textese -->
                                    <!-- labels for variabls -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >Contraction</text><!-- contractions -->
                                    <text x="{10*$xspace}" y="{400-$contra - 10}"
                                        text-anchor="middle"><xsl:value-of
                                            select="count(//abbr[@type = 'contraction'])"/></text><!-- contraction values -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)"
                                        >Informal</text><!-- informal -->
                                    <text x="{20*$xspace}" y="{400-$inf - 25}" text-anchor="middle"
                                            ><xsl:value-of
                                            select="count(//abbr[@type = 'informal'])"/></text><!-- informal values -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150, 425)"
                                        >Textese</text><!-- textese -->
                                    <text x="{30*$xspace}" y="{400-$txtese -25}"
                                        text-anchor="middle"><xsl:value-of
                                            select="count(//abbr[@type = 'textese'])"
                                    /></text><!-- textese values -->
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="abbrDesc">
                        <p> Under the umbrella term of abbreviations, three types of occurrences
                            were observed and separated into three categories: 'textese',
                            informalities, and contractions. Textese is the most commonly used
                            abbreviation found and refers to "text speak". The use of <i>vc</i> in
                            place of <i>você</i> was the most common example of textese. Textese
                            served only to shorten words for convenience. A table is included below
                            in order to show the textese abbreviations and their expanded
                            forms.<br/> Informalities were aspects of Portuguese which would be
                            accepted, even expected, in day-to-day speech, but not in writing.
                            Examples of informalities are the use <i>tava</i> in place of the
                                <i>estava</i> or the shortening of <i>para</i> to <i>pra</i>
                            when not preceding an article. The beginning <i>es</i>-' of the verb
                                <i>estar</i> is often dropped in speech but isn't considered
                            acceptable in formal writing; however, it was observed frequently
                            throughout the conversations. There were a few instances of writers
                            using <i>brigado</i> in place of <i>obrigado</i>. It is common in
                            speech to hear individuals drop the initial 'o' in pronouncing this
                            word.<br/> Finally, contractions are ubiquitous and, often, obligatory
                            in Portuguese, though only two were tracked during our project: <i>não
                                é</i> into <i>né</i> and <i>para</i> + <i>o</i>/<i>a</i> into
                                <i>pro</i>/<i>pra</i>. These were chosen as they are aspects of
                            colloquial Portuguese, non-obligatory, and uncommon in writing.</p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    <h2>The Use of Expanded Forms in Texting</h2>
                    <!-- <div class="description">
                            <p>This is the chart talking about the use of Expanded Forms within the
                                corpus</p>
                        </div> -->
                    <div id="expanForms">
                        <div id="expanded1"><!-- nationality comparrison -->
                            <xsl:variable name="amExpan" select="count(//u[@who = 'am']//expan)"/>
                            <xsl:variable name="brExpan" select="count(//u[@who = 'br']//expan)"/>
                            <xsl:variable name="numVar" select="count(distinct-values(//u/@who))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <!-- graph axis -->
                                    <polyline
                                        points="0,{400-max(($amExpan*(.5), $brExpan*(.5)))-50} 0,400 {10*$xspace*$numVar +20},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$amExpan*.5}" stroke-width="3" stroke="black"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$brExpan*.5}" stroke-width="3" stroke="black"/><!-- brazilian -->
                                    <!-- labels -->
                                    <text x="0" y="{400-max(($amExpan*(.5), $brExpan*(.5)))-70}"
                                        >Expanded Forms by Nationality</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of
                                        Expanded Forms Used</text><!-- y axis -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >American</text><!-- x axis American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)"
                                        >Brazilian</text><!-- x axis Brazilian -->
                                    <text x="{10*$xspace}" y="{(400-$amExpan*.5)-15}"
                                        text-anchor="middle"><xsl:value-of select="$amExpan"
                                        /></text><!-- american Number -->
                                    <text x="{20*$xspace}" y="{(400-$brExpan*.5)-15}"
                                        text-anchor="middle"><xsl:value-of select="$brExpan"
                                        /></text><!-- brazilian Number -->
                                </g>
                            </svg>
                        </div>
                        <div id="expanded2">
                            <!-- comparing types of expanded forms -->
                            <xsl:variable name="exFormal" select="count(//expan[@type = 'formal'])"/>
                            <xsl:variable name="exFull" select="count(//expan[@type = 'full'])"/>
                            <xsl:variable name="exUncon"
                                select="count(//expan[@type = 'uncontracted'])"/>
                            <xsl:variable name="numVar"
                                select="count(distinct-values(//expan/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <!-- graph axis -->
                                    <polyline
                                        points="0,{400-max(($exFormal*(.5), $exFull*(.5), $exUncon*(.5)))-50} 0,400 {10*$xspace*$numVar +20},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$exFormal*(.5)}" stroke="black" stroke-width="3"/><!-- formal -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$exFull*(.5)}" stroke="black" stroke-width="3"/><!-- full -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}"
                                        y2="{400-$exUncon*(.5)}" stroke="black" stroke-width="3"/><!-- uncontracted -->
                                    <!-- labels -->
                                    <text x="15"
                                        y="{400-max(($exFormal*(.5), $exFull*(.5), $exUncon*(.5)))-50}"
                                        >Types of Expanded Forms</text><!-- chart title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20, 400)">Amount of
                                        Expanded Forms Used</text><!-- y axis -->
                                    <text x="0" y="475">Type of Expanded Form</text><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >Formal</text><!-- x axis formal -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)"
                                        >Full</text><!-- x axis full -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150,425)"
                                        >Uncontracted</text><!-- x axis uncontracted -->
                                    <text x="{10*$xspace}" y="{400-$exFormal*(.5)-15}"
                                        text-anchor="middle"><xsl:value-of select="$exFormal"
                                        /></text><!-- formal number -->
                                    <text x="{20*$xspace}" y="{400-$exFull*(.5)-15}"
                                        text-anchor="middle"><xsl:value-of select="$exFull"/></text><!-- full number -->
                                    <text x="{30*$xspace}" y="{400-$exUncon*(.5)-15}"
                                        text-anchor="middle"><xsl:value-of select="$exUncon"
                                        /></text><!-- uncontracted number -->
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="expanDisc">
                        <p> In contrast with the use of abbreviations, we thought that it would be a
                            good idea to look at the use of expanded forms of words as well. It
                            wouldn't be out of line to expect a trend inversely related to what is
                            shown in the abbreviations charts where Americans tended to use more
                            abbreviations than the Brazilians. In fact, this is a very similar trend
                            as the Brazilians tended to use more expanded forms than the Americans
                            but not overwhemlingly so. </p>
                        <p> The most common expanded forms used were those of 'textese' forms, such
                            as <i>você</i> rather than <i>vc</i>. These were marked as 'full'.
                            Expanded forms of contractions were marked as 'uncontracted' and those
                            of informal language were marked as 'formal'.</p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    <h2>The Use of Emojis in Texting</h2>
                    <!-- <div class="description">
                        <p>This is the chart talking about the use of Emojis within the
                            corpus</p>
                    </div> -->
                    <div id="emojiUse">
                        <div id="emoji1"><!-- nationality comparison -->
                            <xsl:variable name="brEmoji"
                                select="count(.//u[@who = 'br']/g) + sum(.//u[@who = 'br']/g/@n) - count(.//u[@who = 'br']/g[@n])"/>
                            <xsl:variable name="amEmoji"
                                select="count(.//u[@who = 'am']/g) + sum(.//u[@who = 'am']/g/@n) - count(.//u[@who = 'am']/g[@n])"/>
                            <xsl:variable name="emojiNum" select="count(distinct-values(//g/@ref))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <polyline
                                        points="0,{400 - max(($brEmoji*(.5*$yspace), $amEmoji*(.5*$yspace)))-50} 0,400 {30*$xspace},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    <!-- the bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$amEmoji*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- american use of emojis -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$brEmoji*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- brazilian use of Emojis -->
                                    <!-- labels-->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >American</text><!-- x axis label American -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)"
                                        >Brazilian</text><!-- x axis label Brazilian -->
                                    <text x="0"
                                        y="{400 - max(($brEmoji*(.5*$yspace), $amEmoji*(.5*$yspace)))-70}"
                                        >Use of Emojis by Nationality</text>
                                    <!-- chart title -->
                                    <text x="37" y="475" text-anchor="middle">Nationality</text><!-- x axis label  -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Number of
                                        Emojis Used</text><!-- y axis label -->
                                    <text x="{10*$xspace}" y="{400-$amEmoji*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$amEmoji"
                                        /></text><!-- num label American -->
                                    <text x="{20*$xspace}" y="{400-$brEmoji*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$brEmoji"
                                        /></text><!-- num label Brazilian -->
                                </g>
                            </svg>
                        </div>
                        <div id="emoji2">
                            <xsl:variable name="cleNumAm"
                                select="count(//u[@who = 'am']//g[@ref = '#cle'])"/>
                            <xsl:variable name="emojiNum" select="count(distinct-values(//g/@ref))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <polyline points="0,200 0,400 100,400" stroke="#5F8AC6"
                                        stroke-width="3" fill="none"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="emojidesc">
                        <p> When we looked at the raw texting data that we received, it seemed like
                            there was an overwhelming amount of emoji's used throughout the text and
                            we thought thtat this would be interesting to look at further. By just
                            looking through the data, we thought that there were many more instances
                            where the Brazilian speakers were using emojis than where the American
                            speakers did. However, when we ran the functions, it appears that the
                            Brazilians did in fact, use more emojis than their American
                            counterparts, but not by a large count. </p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    <h2>The Use of Laughter Notation in Texting</h2>
                    <!-- <div class="description">
                        <p>This is the chart talking about the use of Laughter Notation within the
                            corpus</p>
                    </div> -->
                    <div id="laugh">
                        <div id="laugh1">
                            <xsl:variable name="amHi" select="count(//u[@who = 'am']//hi)"/>
                            <xsl:variable name="brHi" select="count(//u[@who = 'br']//hi)"/>
                            <xsl:variable name="amHa"
                                select="count(//u[@who = 'am']//hi[@type = 'ha'])"/>
                            <xsl:variable name="brHa"
                                select="count(//u[@who = 'br']//hi[@type = 'ha'])"/>
                            <xsl:variable name="amK"
                                select="count(//u[@who = 'am']//hi[@type = 'k'])"/>
                            <xsl:variable name="brK"
                                select="count(//u[@who = 'br']//hi[@type = 'k'])"/>
                            <xsl:variable name="amRs"
                                select="count(//u[@who = 'am']//hi[@type = 'rs'])"/>
                            <xsl:variable name="brRs"
                                select="count(//u[@who = 'br']//hi[@type = 'rs'])"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400"><!-- nationality comparrison -->
                                <g>
                                    <polyline
                                        points="0,{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-10} 0,400 {30*$xspace},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- graph axis -->
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$amHi*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- American -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$brHi*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- Brazilian -->
                                    <!-- Labels -->
                                    <text x="{10*$xspace}" y="{400-$amHi*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$amHi"/></text><!-- american count -->
                                    <text x="{20*$xspace}" y="{400-$brHi*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$brHi"/></text><!-- Brazilian Count -->
                                    <text x="25"
                                        y="{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-30}"
                                        >The Occurance of Laughter</text><!-- chart title -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >American</text><!-- american x axis label -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)"
                                        >Brazilian</text><!-- Brazilian x axis label -->
                                    <text x="0" y="375" transform="rotate(-90 0,400)">Instances of
                                        Laughter</text><!-- y axis label -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                </g>
                            </svg>
                        </div>
                        <div id="laugh2"><!-- types of laughter used by each nationality -->
                            <xsl:variable name="amHi" select="count(//u[@who = 'am']//hi)"/>
                            <xsl:variable name="brHi" select="count(//u[@who = 'br']//hi)"/>
                            <xsl:variable name="amHa"
                                select="count(//u[@who = 'am']//hi[@type = 'ha'])"/>
                            <xsl:variable name="brHa"
                                select="count(//u[@who = 'br']//hi[@type = 'ha'])"/>
                            <xsl:variable name="amK"
                                select="count(//u[@who = 'am']//hi[@type = 'k'])"/>
                            <xsl:variable name="brK"
                                select="count(//u[@who = 'br']//hi[@type = 'k'])"/>
                            <xsl:variable name="amRs"
                                select="count(//u[@who = 'am']//hi[@type = 'rs'])"/>
                            <xsl:variable name="brRs"
                                select="count(//u[@who = 'br']//hi[@type = 'rs'])"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400">
                                <g>
                                    <!-- bars -->
                                    <line x1="{5*$xspace}" y1="400" x2="{5*$xspace}"
                                        y2="{400-$amHa*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american ha -->
                                    <line x1="{8*$xspace}" y1="400" x2="{8*$xspace}"
                                        y2="{400-$brHa*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- brazilian ha -->
                                    <line x1="{16*$xspace}" y1="400" x2="{16*$xspace}"
                                        y2="{400-$amK*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american k -->
                                    <line x1="{19*$xspace}" y1="400" x2="{19*$xspace}"
                                        y2="{400-$brK*(.5*$yspace)}" stroke="black" stroke-width="3"/><!-- brazilian k -->
                                    <line x1="{28*$xspace}" y1="400" x2="{28*$xspace}"
                                        y2="{400-$amRs*(.5*$yspace)}" stroke="red" stroke-width="3"/><!-- american rs -->
                                    <line x1="{31*$xspace}" y1="400" x2="{31*$xspace}"
                                        y2="{400-$brRs*(.5*$yspace)}" stroke="black"
                                        stroke-width="3"/><!-- brazilian rs -->
                                    <!-- labels -->
                                    <text x="{6.5*$xspace}" y="425" text-anchor="middle">ha</text><!-- Ha -->
                                    <text x="{17.5*$xspace}" y="425" text-anchor="middle">k</text><!-- k -->
                                    <text x="{30.5*$xspace}" y="425" text-anchor="middle">rs</text><!-- rs -->
                                    <text x="25"
                                        y="{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-20}"
                                        >The Varieties of Laughter Used</text><!-- Title -->
                                    <text x="-30" y="360" transform="rotate(-90 0,375)">Instances
                                        Used</text><!-- y axis -->
                                    <text x="0" y="450">Type of Laughter</text><!-- x axis -->
                                    <text x="{5*$xspace}" y="{400-$amHa*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$amHa"/></text><!-- a ha count -->
                                    <text x="{8*$xspace}" y="{400-$brHa*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$brHa"/></text><!-- b ha count -->
                                    <text x="{16*$xspace}" y="{400-$amK*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$amK"/></text><!-- a k count -->
                                    <text x="{19*$xspace}" y="{400-$brK*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$brK"/></text><!-- b k count -->
                                    <text x="{28*$xspace}" y="{400-$amRs*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$amRs"/></text><!-- a rs count -->
                                    <text x="{31*$xspace}" y="{400-$brRs*(.5*$yspace) -10}"
                                        text-anchor="middle"><xsl:value-of select="$brRs"/></text><!-- b rs count -->
                                    <!-- graph axis -->
                                    <polyline
                                        points="0,{400 - max(($amHi*(.5*$yspace), $brHi*(.5*$yspace)))-10} 0,400 {40*$xspace},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="laughDesc">
                        <p> One of the interesting aspects of communication through some static
                            medium is the communication of emotions, something that emoji characters
                            have recently been able to do more succinctly. Before the development of
                            the emojis, one of the better communication methods for describing
                            laughter was a transcription of what the speaker would perceive as
                            laughter, much like the 'haha' that English speakers may commonly use.
                            This form differes across the languages of the world, so it would be of
                            interest to see the different styles that people of different cultures
                            might employ. In this case, the different styles of laughter notation
                            included 'ha/lol' 'k'  and 'rs' (standing for <i>risos</i> meaning
                            'laughter'). </p>
                        <p>Generally, the Americans seemed to use more instances of any sort of
                            laughter notations and they considerably favored the 'ha' method which
                            is commonly used throughout English texting conventions. The Brazilian speakers also favored the
                            convention that is more commonly used in their environment, 'k'. Other
                            Brazilian speakers have noted though, that they may also commonly use
                            the 'ha' notation which would explain why there's still a significant
                            amount of Brazilian uses of 'ha'. The occurance of Americans using 'k'
                            may be an indication of the speakers attempt to speak (via text) as the
                            Brazilians do and sound as native as possible. The third laughter
                            notation, 'rs', presents an interesting instance because it was so
                            scarcely used and used only by Americans.</p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    <h2>The Use of Corrections in Texting</h2>
                    <!-- <div class="description">
                            <p>This is the chart talking about the use of Correction within the
                                corpus</p>
                        </div> -->
                    <div id="corrections">
                        <div id="corrections1">
                            <xsl:variable name="amCorr" select="count(//u[@who = 'am']/corr)"/>
                            <xsl:variable name="brCorr" select="count(//u[@who = 'br']/corr)"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400"><!-- nationality comparon -->
                                <g>
                                    <!-- graph axis -->
                                    <polyline
                                        points="0,{400 - max(($amCorr, $brCorr))*$yspace -50} 0,400 {30*$xspace},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- Bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{(400-$amCorr*$yspace)}" stroke="black" stroke-width="3"/><!-- american -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$brCorr*$yspace}" stroke="black" stroke-width="3"/><!-- brazilian -->
                                    <!-- labels -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50,425)"
                                        >American</text>
                                    <!-- american x axis -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100,425)"
                                        >Brazilian</text><!-- brazilian x axis -->
                                    <text x="{10*$xspace}" y="{400-$amCorr*$yspace -15}"
                                        text-anchor="middle"><xsl:value-of select="$amCorr"/></text><!-- american number -->
                                    <text x="{20*$xspace}" y="{400-$brCorr*$yspace -15}"
                                        text-anchor="middle"><xsl:value-of select="$brCorr"/></text><!-- brazilian Number -->
                                    <text x="25" y="{400 - max(($amCorr, $brCorr))*$yspace -70}">The
                                        Use of Corrections</text><!-- chart title -->
                                    <text x="0" y="475">Nationality</text><!-- x axis -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of
                                        Corrections</text><!-- y axis -->
                                </g>
                            </svg>
                        </div>
                        <div id="corrections2">
                            <xsl:variable name="exp" select="count(//corr[@type = 'explicit'])"/>
                            <xsl:variable name="imp" select="count(//corr[@type = 'implicit'])"/>
                            <xsl:variable name="self" select="count(//corr[@type = 'self'])"/>
                            <xsl:variable name="varNum"
                                select="count(distinct-values(//corr/@type))"/>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 100 500 400"><!-- types of corrections comparrison -->
                                <g>
                                    <!-- graph axis -->
                                    <polyline
                                        points="0,{400 - max(($exp, $imp, $self))*$yspace -50} 0,400 {10*$xspace*$varNum +10},400"
                                        stroke="black" stroke-width="3" fill="none"/>
                                    <!-- bars -->
                                    <line x1="{10*$xspace}" y1="400" x2="{10*$xspace}"
                                        y2="{400-$exp*$yspace}" stroke="black" stroke-width="3"/><!-- explicit corrections -->
                                    <line x1="{20*$xspace}" y1="400" x2="{20*$xspace}"
                                        y2="{400-$imp*$yspace}" stroke="black" stroke-width="3"/><!-- implicit corrections -->
                                    <line x1="{30*$xspace}" y1="400" x2="{30*$xspace}"
                                        y2="{400-$self*$yspace}" stroke="black" stroke-width="3"/><!-- self corrections -->
                                    <!-- labels -->
                                    <text x="25" y="{400 - max(($exp, $imp, $self))*$yspace -70}"
                                        >Types of Corrections Used</text><!-- title -->
                                    <text x="-20" y="400" transform="rotate(-90 -20,400)">Amount of
                                        Corrections</text><!-- y axis -->
                                    <text x="0" y="475"/><!-- x axis -->
                                    <text x="{10*$xspace}" y="425" transform="rotate(30 50, 425)"
                                        >Explicit</text><!-- x axis exp -->
                                    <text x="{20*$xspace}" y="425" transform="rotate(30 100, 425)"
                                        >Implicit</text><!-- x axis imp -->
                                    <text x="{30*$xspace}" y="425" transform="rotate(30 150, 425)"
                                        >Self</text><!-- x axis self -->
                                    <text x="{10*$xspace}" y="{400-$exp*$yspace -15}"
                                        text-anchor="middle"><xsl:value-of select="$exp"/></text><!-- exp number -->
                                    <text x="{20*$xspace}" y="{400-$imp*$yspace -15}"
                                        text-anchor="middle"><xsl:value-of select="$imp"/></text><!-- imp number -->
                                    <text x="{30*$xspace}" y="{400-$self*$yspace -15}"
                                        text-anchor="middle"><xsl:value-of select="$self"
                                    /></text><!-- self number -->
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div id="corrDesc">
                        <p> Noting the amount and distribution of the addressed corrections didn't
                            necessarily present any drastically new information, since we were
                            looking at data where there was discourse between L1 and L2 speakers.
                            Naturally, the L1 speakers will be the ones to address corrections more
                            so than the L2 speakers and the data here confirms that. What might be
                            of interest is how the corrections were addressed because constantly
                            correcting grammar and spelling mistakes in conversation can greatly
                            dampen the enthusiasm or flow of a conversation.. There were three
                            different methods that speakers used to address a correction: Explicit,
                            Implicit, and Self. </p>
                        <p> Explicit corrections were instances where the L1 Brazilian speaker
                            acknowledges that the L2 American speaker has made some sort of
                            grammatical or spelling mistake and directly addresses this. The
                            WhatsApp app allows users to highlight portions of text to display to
                            the other user which is how the majority of these corrections were done.
                            Usually, the L2 speaker corrects their mistake, sometimes accompanied
                            with more questions, and moves on with the conversation. </p>
                        <p> Implicit corrections are instances where the L1 Brazilian speaker
                            notices a mistake on the part of the L2 American speaker, but doesn't
                            directly confront them about this mistake. Instead, the L1 Brazilian
                            speaker makes an effort to use the correct form of the word or
                            grammatical element in thier own dialogue in the hopes that the L2
                            American speaker will see how to properly use that. It would be good ot
                            not that this is one of the more efficient methods for correcting speech
                            errors when learning a language because it does not hinder the flow of
                            the conversation or diminsh the sprits of the mistaken speaker. </p>
                        <p> Self corrections are rather self explanatory and are instances where a
                            speaker notices their own mistake and corrects it before the other
                            speaker addresses it. This is the type that makes up the entirety of the
                            American speakers' corrections (1). </p>
                    </div><a href="#topImg" class="internal">Top</a>
                    <h2>Table of Textese Abbreviats with Expanded Forms and Usage:</h2>
                    <div id="textese">
                        <table id="textTable">
                            <tr>
                                <th>Abbreviated Form</th>
                                <th>Expanded Form</th>
                                <th>American Usage</th>
                                <th>Brazilian Usage</th>
                            </tr>
                            <tr>
                                <td>vc(s)</td>
                                <td> você(s) </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'vc']) + count(//u[@who = 'am']/abbr/text()[. = 'vcs']) + count(//u[@who = 'am']/abbr/text()[. = 'Vc']) + count(//u[@who = 'am']/abbr/text()[. = 'Vcs'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'vc']) + count(//u[@who = 'br']/abbr/text()[. = 'vcs']) + count(//u[@who = 'br']/abbr/text()[. = 'Vc']) + count(//u[@who = 'br']/abbr/text()[. = 'Vcs'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>obg</td>
                                <td> obrigado/obrigada </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'Obg']) + count(//u[@who = 'am']/abbr/text()[. = 'obg'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'Obg']) + count(//u[@who = 'br']/abbr/text()[. = 'obg'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>tvz</td>
                                <td> talvez </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'tvz']) + count(//u[@who = 'am']/abbr/text()[. = 'Tvz'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'tvz']) + count(//u[@who = 'br']/abbr/text()[. = 'Tvz'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>hj</td>
                                <td> hoje </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'hj']) + count(//u[@who = 'am']/abbr/text()[. = 'Hj'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'hj']) + count(//u[@who = 'br']/abbr/text()[. = 'Hj'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>pq</td>
                                <td> porque/porquê/por que/por quê </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'pq']) + count(//u[@who = 'am']/abbr/text()[. = 'Pq'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'pq']) + count(//u[@who = 'br']/abbr/text()[. = 'Pq'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>tb/tbm</td>
                                <td>também</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'tb']) + count(//u[@who = 'am']/abbr/text()[. = 'Tb']) + count(//u[@who = 'am']/abbr/text()[. = 'tbm']) + count(//u[@who = 'am']/abbr/text()[. = 'Tbm'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'tb']) + count(//u[@who = 'br']/abbr/text()[. = 'Tb']) + count(//u[@who = 'br']/abbr/text()[. = 'tbm']) + count(//u[@who = 'br']/abbr/text()[. = 'Tbm'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>fds</td>
                                <td>fim de semana</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'fds'])"/>
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'fds'])"/>
                                </td>
                            </tr>
                            <tr>
                                <td>n</td>
                                <td>não</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'N']) + count(//u[@who = 'am']/abbr/text()[. = 'n']) + count(//u[@who = 'am']/abbr/text()[. = 'nn'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'N']) + count(//u[@who = 'br']/abbr/text()[. = 'n']) + count(//u[@who = 'br']/abbr/text()[. = 'nn'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>q/oq/doq</td>
                                <td>que/o que/do que</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'q']) + count(//u[@who = 'am']/abbr/text()[. = 'Q']) + count(//u[@who = 'am']/abbr/text()[. = 'oq']) + count(//u[@who = 'am']/abbr/text()[. = 'Oq']) + count(//u[@who = 'am']/abbr/text()[. = 'doq'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'q']) + count(//u[@who = 'br']/abbr/text()[. = 'Q']) + count(//u[@who = 'br']/abbr/text()[. = 'oq']) + count(//u[@who = 'br']/abbr/text()[. = 'Oq']) + count(//u[@who = 'br']/abbr/text()[. = 'doq'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>mt/mto/mta(s)</td>
                                <td>muito/muita(s)</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'mt']) + count(//u[@who = 'am']/abbr/text()[. = 'MT']) + count(//u[@who = 'am']/abbr/text()[. = 'mto']) + count(//u[@who = 'am']/abbr/text()[. = 'mta']) + count(//u[@who = 'am']/abbr/text()[. = 'mtos']) + count(//u[@who = 'am']/abbr/text()[. = 'mtas'])"
                                    />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'mt']) + count(//u[@who = 'br']/abbr/text()[. = 'MT']) + count(//u[@who = 'br']/abbr/text()[. = 'mto']) + count(//u[@who = 'br']/abbr/text()[. = 'mta']) + count(//u[@who = 'br']/abbr/text()[. = 'mtos']) + count(//u[@who = 'br']/abbr/text()[. = 'mtas'])"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td>vdd</td>
                                <td>verdade</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'vdd'])"/>
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'vdd'])"/>
                                </td>
                            </tr>
                            <tr>
                                <td>dps</td>
                                <td>depois</td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'am']/abbr/text()[. = 'dps'])"/>
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count(//u[@who = 'br']/abbr/text()[. = 'dps'])"/>
                                </td>
                            </tr>
                            <tr><td/><td/>
                                <td>TOTAL:</td>
                                <td>
                                <xsl:value-of select="count(//abbr[@type = 'textese'])"/></td>
                            </tr>
                        </table>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                    <div id="totalAnalysis">
                        <h2>Sweeping Genralizations and Blanket Statements</h2>
                        <p>The Americans utilized more texting conventions, especially 'textese', than their language partners. We were initially
                        surprised by this, as the Americans wrote less on average while still out-using Brazilians in texting conventions of their
                        native language. We expected to find a more significant difference in the use of emojis and laughter, particularly anticipating
                        the Brazilians to use more of each. </p>
                    </div>
                    <a href="#topImg" class="internal">Top</a>
                </div>
                <!--#include virtual="../ssi/creativeCommons.html" -->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
