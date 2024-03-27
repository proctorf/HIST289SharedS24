<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    
    <xsl:template match="/">
        <html>
            <table border = "1">
                
                    <tr>
                        <xsl:apply-templates select="xml/header/citationInfo/journalTitle"/>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="xml/header/citationInfo/publicationPlace"/>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="xml/header/citationInfo/publicationDate"/>
                    </tr>
                    <tr>
                        <td align="center"><img height="450" src="{/xml/header/citationInfo/adUrl}"></img></td>
                    </tr>
                </table>
        </html>
    </xsl:template>
</xsl:stylesheet>