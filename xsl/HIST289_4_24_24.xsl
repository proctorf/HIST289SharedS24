<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://proctorf.github.io/HIST289SharedS24/html/hist289.css"></link>
                
               </head>
            <body>
                <div class="container">
                    <div class="sub-container"> <!-- this subcontainer contains the Citation Info, the image, and the transcription -->
                        <div class="bucket"> <!-- This bucket contains the Citation Info -->
                            <div class="bucket-half" span="2">
                                <span class="half-bucket-title">
                                <span class="citation">
                                    <span class="journal-title"><xsl:apply-templates select="xml/header/citationInfo/journalTitle"/></span>
                                    <xsl:text>, </xsl:text>
                                    <xsl:apply-templates select="xml/header/citationInfo/publicationPlace"/>
                                    <xsl:text>, </xsl:text>
                                    <xsl:apply-templates select="xml/header/citationInfo/publicationDate"/>
                                </span>
                                    
                                    <div><span class="not-bold"><a href="example.xml" style="unbold">Link to XML</a></span></div>
                                </span>
                            </div>
                        </div>    
                            
                        
                        
                    <div class="bucket"> <!-- this bucket contains the image and transcription -->
                        <div class="bucket-half">
                        <span class="image-container"><img height="450" src="{/xml/header/citationInfo/adUrl}" /></span>
                    </div>
                    <div class="bucket-half">
                        <span class="text"><xsl:apply-templates select="xml/transcript" /></span>
                    </div>
                    </div></div>
                    <div class="sub-container">    <!-- this subcontainer contains the Bio, Pysical, Personality, and other infor for each enslaved person in the ad -->
                        
                        <xsl:for-each select="xml/footer/listPerson//persName[@role='enslaved']">                        
                            <div class="bucket"> <!-- this bucket contains the Biographical Info and Physical Characteristics -->
                        <div class="bucket-half">
                            <span class="half-bucket-title">Biographical Info</span> <!-- this half bucket contains the Biographical Info -->
                        
                        <div class="nested-column">
                                <div class="item">
                                    <div class="field"><span class="label">First Name:</span>
                                        <span class="value"><xsl:value-of select="@foreName"/></span>
                                    </div>
                                    
                                    <div class="field"><span class="label">Last Name:</span>
                                        <span class="value"><xsl:value-of select="@surName"/></span></div>
                                    
                                    
                                    <div class="field"><span class="label">Alias:</span>
                                        <span class="value"><xsl:value-of select="@alias"/></span></div>
                                </div>
                            </div>
                            
                            <div class="nested-column">
                                <div class="item">
                                    <div class="field"><span class="label">Phenotype:</span>
                                        <span class="value"><xsl:value-of select="characteristics/physical/phenotype"/></span>
                                    </div>
                                    
                                    <div class="field"><span class="label">Sex:</span>
                                        <span class="value">
                                            <xsl:if test="@sex='m'"><xsl:text>Male</xsl:text></xsl:if>
                                            <xsl:if test="@sex='f'"><xsl:text>Female</xsl:text></xsl:if><!-- Sex -->
                                        </span></div>
                                                                        
                                    <div class="field"><span class="label">Age:</span>
                                        <span class="value"><xsl:value-of select="characteristics/physical/minAge/@years"/></span></div>
                                </div>
                            </div>
                        
                    </div>
                    
                        <div class="bucket-half">
                            <span class="half-bucket-title">Physical Characteristics</span> <!-- this bucket contains Physical Characteristics -->
                        
                        
                            <div class="nested-column">
                                <div class="item">
                                    <div class="field"><span class="label">Height:</span>
                                        <span class="value">
                                            <xsl:value-of select="characteristics/physical/minHeight/@inches"/>
                                            <xsl:choose>
                                                <xsl:when test="characteristics/physical/maxHeight">
                                                    <xsl:text>-</xsl:text>
                                                    <xsl:value-of select="characteristics/physical/maxHeight/@inches"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            inches
                                        </span>
                                    </div>
                                    
                                    <div class="field double"><span class="label">Build:</span>
                                        <span class="value"><xsl:value-of select="characteristics/physical/build"/></span>
                                    </div>
                                    <div></div>
                                    
                                </div>
                            </div>
                            <div class="field triple">
                                <span class="label">Scars:</span>
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/physical/scars) != ''">
                                            <xsl:value-of select="characteristics/physical/scars"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </div>
                           
                            
                        
                    </div>
                    </div>
                    <div class="bucket"> <!-- this bucket contains the Personality and Possession? -->
                        <div class="bucket-half">
                            <span class="half-bucket-title">Personality</span> <!-- this half bucket contains Personality -->
                        
                        
                            <div class="field triple">
                                <span class="label">Speech:</span>
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/countenance/speech) != ''">
                                            <xsl:value-of select="characteristics/countenance/speech"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                 </span>
                            </div>
                            
                            <div class="field triple">
                                <span class="label">Behavior:</span>
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/countenance/behavior) != ''">
                                            <xsl:value-of select="characteristics/countenance/behavior"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                </span>
                            </div>
                                    
                            <div class="field triple">
                                <span class="label">Literate?</span>
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="characteristics/otherFeatures//literate[@canRead='y']">
                                            <xsl:text>Yes</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                </span>
                            </div>   
                            
                            <xsl:if test="characteristics/countenance//passAsFree[@pass='y']">
                                <div class="field-triple"><span class="label">Will attempt to pass as free?</span>
                                <span class="value"><xsl:text>Yes</xsl:text></span></div>
                            </xsl:if>   
                            
                            <xsl:if test="characteristics/otherFeatures//papersDesc[@papers='y']">
                                <div class="field-triple"><span class="label">Will produce papers?</span>
                                    <span class="value"><xsl:value-of select="characteristics/otherFeatures//papersDesc"/></span></div>
                            </xsl:if>
                            
                           </div>
                        
                        <div class="bucket-half">
                            <span class="half-bucket-title">Other Info</span> <!-- this half bucket contains Other Info -->
                            
                            
                            <div class="nested-column">
                                <div class="item">
                                <div class="field-triple">
                                <span class="label">Possessions:</span>
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/physical/possessions) != ''">
                                            <xsl:value-of select="characteristics/physical/possessions"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    
                                </span>
                            </div>
                            </div>
                            
                            <div class="item">
                                <div class="field-triple">
                                    <span class="label">Clothing:</span>
                                
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/physical/clothing) != ''">
                                            <xsl:value-of select="characteristics/physical/clothing"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span></div>
                            </div>
                            
                            <div class="item"> 
                                <div class="field-triple">
                                    <span class="label">Skills?</span>
                                    <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="string(characteristics/otherFeatures/skills) != ''">
                                            <xsl:value-of select="characteristics/otherFeatures/skills"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span></div>
                            </div>
                            <div class="item"> 
                                
                                <div class="field-triple"><span class="label">Had a horse?</span>
                                
                                <span class="value">
                                    <xsl:choose>
                                        <xsl:when test="characteristics/otherFeatures//horse[@hadHorse='y']">
                                            <xsl:text>Yes</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Not Provided</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span></div>
                            </div>
                           </div>
                        </div>
                        </div>
                   </xsl:for-each>
                        <div class="bucket"> <!-- this bucket contains the Enslaver and Geographical Information and Possession? -->
                            
                                                       
                            <xsl:for-each select="xml/footer/listPerson//persName[@role='enslaver']">
                            
                                <div class="bucket-half">
                                    <span class="half-bucket-title">Enslaver Information</span> <!-- this half bucket contains the Biographical Info -->
                                    
                                    <div class="nested-column">
                                        <div class="item">
                                            <div class="field">
                                                <span class="label">Name</span>
                                                <span class="value"><xsl:value-of select="@foreName"/><xsl-text> </xsl-text><xsl:value-of select="@surName"/>
                                                    <xsl:choose>
                                                        <xsl:when test="string(enslaverInfo) != ''">
                                                            <xsl:text>, </xsl:text><xsl:value-of select="enslaverInfo"/>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </span>
                                            </div>
                                       </div>
                                    </div>
                                    
                                    
                                    
                                </div>
                            </xsl:for-each>
                                                
                        <div class="bucket-half">
                                    <span class="half-bucket-title">Geographical Information</span> <!-- this half bucket contains the Biographical Info -->
                                    <xsl:for-each select="xml/footer/listPlace/placeName">
                                    <div class="nested-column">
                                        <div class="item">
                                            <div class="field">
                                                <span class="label">Location Type - <xsl:value-of select="@placeType"/></span>
                                         
                                                <span class="value">
                                                    
                                                        <xsl:if test="string(.) != ''">
                                                            <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                                        </xsl:if>
                                                        <xsl:if test="string(@settlement) != ''">
                                                            <xsl:value-of select="@settlement"/><xsl:text>, </xsl:text>
                                                        </xsl:if>
                                                        <xsl:if test ="string(@county) !=''">
                                                          <xsl:value-of select="@county"/><xsl-text> County, </xsl-text>
                                                        </xsl:if>
                                                    
                                                    <xsl:value-of select="@state"/></span>
                                            </div>
                                        </div>
                                    </div>
                                    </xsl:for-each>
                                    <div class="nested-column">
                                        <div class="item">
                                            <div class="field"> 
                                            <span class="label">Location Type - Publication Location (Presumed Direction)</span>
                                            
                                                <span class="value">
                                                    <xsl:apply-templates select="xml/header/citationInfo/publicationPlace/@settlement"/>
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:apply-templates select="xml/header/citationInfo/publicationPlace/@state"/>
                                                </span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template to handle paragraph elements specifically -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/> <!-- This will process any child nodes of <p> -->
        </p>
    </xsl:template>
</xsl:stylesheet>
