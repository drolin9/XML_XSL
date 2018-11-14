<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8"/>
    
    <!--entete-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Mes livres - Question 2</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!--titre et nom de colonne -->
    <xsl:template match="livres">
        <h1>Mes Livres - Question2</h1>
        <table border="1">
            <tr style="background: #9acd32">
                <th>Titre</th>
                <th>Langue</th>
                <th>Edition</th>
                <th>ISBN</th>
                <th>Auteurs</th>
                <th>Contenu</th>
            </tr>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!--on ajoute le contenu ds table -->
    <xsl:template match="livre">
        <tr>
            <td><xsl:value-of select="titre"/></td>
            <td><xsl:value-of select="@langue"/></td>
            <td><xsl:value-of select="edition"/></td>
            <td><xsl:value-of select="isbn"/></td>
            <!--on ajoute auteur qui est definie plus bas -->
            <xsl:apply-templates/>
            <td><xsl:value-of select="contenu"/></td>
        </tr>
    </xsl:template>   
   
    <xsl:template match="*|text()">
        
    </xsl:template>
 
    <xsl:template match="auteurs">
        <td style="margin-left:2px;">
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



        

