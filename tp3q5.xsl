<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8"/>
    
    <!--entete-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Mes livres - Question 5</title>
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
                <th>Image</th>
                <th>Langue</th>
                <th>CD inclus</th>
                <th>Auteurs</th>
            </tr>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!--on ajoute le contenu ds table -->
    <xsl:template match="livre">     
        <xsl:if  test="@langue='francais'">
            <tr style="background-color:gray;">
               <td><xsl:value-of select="titre"/></td>
               <td>
                   <xsl:apply-templates select="image"/>
               </td>
               <td><xsl:value-of select="@langue"/></td>
               <td>
                   <xsl:call-template name="cd_inclus">
                       <xsl:with-param name="no_livre">
                           <xsl:value-of select="position()"/>
                       </xsl:with-param>
                   </xsl:call-template> 
               </td>
               <!--on ajoute auteur qui est definie plus bas -->
                <xsl:apply-templates select="auteurs"/>
           </tr>
        </xsl:if>
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
    <xsl:template match="livres/livre/image">
        <img>
            <xsl:attribute name="src">images/<xsl:value-of select="@src"/></xsl:attribute>
        </img>
    </xsl:template>    
    <xsl:template name="cd_inclus">
        <xsl:param name="no_livre">0</xsl:param>
 
         Oui<input type="radio" value="oui">
                <xsl:attribute name="name">cd_inclus<xsl:value-of select="$no_livre"/></xsl:attribute>
                <xsl:if test="cd_inclus='oui'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
          Non<input type="radio" value="non">
                <xsl:attribute name="name">cd_inclus<xsl:value-of select="$no_livre"/></xsl:attribute>
                <xsl:if test="cd_inclus='non'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
        
    </xsl:template> 
    
</xsl:stylesheet>



        

