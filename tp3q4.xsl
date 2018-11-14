<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8"/>
    
    <!--entete-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Mes livres - Question 4</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!--titre et nom de colonne -->
    <xsl:template match="livres">
        <h1>Mes Livres - Question3</h1>
        <table border="1">
            <tr style="background: #9acd32">
                <th>Titre</th>
                <th>Langue</th>
                <th>CD inclus</th>
                <th>Auteurs</th>
            </tr>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!--on ajoute le contenu ds table -->
    <xsl:template match="livre">     
        <tr>
            <xsl:attribute name="style">
                <xsl:text>background-color:</xsl:text>
                <xsl:choose>
                    <xsl:when test="@langue='francais'">gray</xsl:when>
                    <xsl:when test="@langue='anglais'">lightgray</xsl:when>
                </xsl:choose>
            </xsl:attribute> 
            <td><xsl:value-of select="titre"/></td>
            <td><xsl:value-of select="@langue"/></td>
            <td>
                <xsl:attribute name="style">
                    <xsl:text>color:</xsl:text>
                  <xsl:choose>
                      <xsl:when test="cd_inclus='oui'">blue</xsl:when>
                      <xsl:when test="cd_inclus='non'">red</xsl:when>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="cd_inclus"/>
            </td>
            <!--on ajoute auteur qui est definie plus bas -->
            <xsl:apply-templates/>
        </tr>
    </xsl:template>   
   
    <xsl:template match="*|text()">
        
    </xsl:template>
 
    <xsl:template match="auteurs">
        <td style="margin-left:2px;list-style-type: circle;">
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
   <!--  on caoncatenne un espace entre nom et prenom-->
    <xsl:template match="auteur">
                <li> 
                    <xsl:value-of select="prenom"/>
                    <xsl:value-of select="concat(' ',nom)"/>
                </li>
        
    </xsl:template>    
    

    
</xsl:stylesheet>



        

