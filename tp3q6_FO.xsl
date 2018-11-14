<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" xml:space="preserve"/>
    
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">    
                <!-- definition de la mise en page -->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="maPage" margin="0.5in" page-height="11in"
                    page-width="8.5in">
                    <fo:region-body margin-top="20mm" margin-bottom="5mm"/>
                    <fo:region-before extent="20mm"/>
                    <fo:region-after extent="5mm"/>
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="couverture" page-height="11in"
                    page-width="8.5in" margin="0.5in">
                    <fo:region-body margin="5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>>
            
                <!-- contenu de la page genere par XSLT -->
            <fo:page-sequence master-reference="couverture" force-page-count="no-force">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" space-after="4cm">
                        Travail Pratique #3
                    </fo:block>
                    <fo:block text-align="center" space-after="0.5cm">
                        
                    </fo:block>
                    <fo:block text-align="center" space-after="8cm">
                        dans le cadre du cours IFT1152 - Technologie XML
                    </fo:block>        
                    <fo:block text-align="center">
                        par Karl Rushford
                    </fo:block>
                    <fo:block text-align="center">
                        P1071717
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>  
            
            <fo:page-sequence master-reference="maPage" initial-page-number="1">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block border-bottom-style="solid">Travail Pratique question6</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block border-top-style="solid" text-align="right">
                        <fo:inline>Technologies XML - 2016/2017 - </fo:inline>
                        <fo:inline>Page <fo:page-number/>
                        </fo:inline>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>               
                
            
        </fo:root>   
    </xsl:template>
        
        
    <xsl:template match="livres">
        <fo:block font-size="24 pt">Mes livres en inventaire</fo:block>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="livre">
        <fo:block border-style="solid" break-after="page">
            <xsl:attribute name="background-color">
                <xsl:choose>
                    <xsl:when test="@langue='anglais'">#00FF00</xsl:when>
                    <xsl:otherwise>#0000FF</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="titre"/>
            <xsl:apply-templates select="image"/>
            <xsl:apply-templates select="@langue"/>
            <xsl:apply-templates select="auteurs"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="image">
        <fo:block font-weight="normal" text-align="left">
            <fo:external-graphic  content-height="3cm"  >
                <xsl:attribute name="src">images/<xsl:value-of select="@src"/></xsl:attribute>
            </fo:external-graphic>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="titre">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="@langue">
        <fo:block><fo:inline>Livre en </fo:inline>
            <fo:inline><xsl:value-of select="."/></fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="auteurs">
        <fo:block>Auteurs:</fo:block>
        <fo:list-block>
            <xsl:apply-templates select="auteur"/>
        </fo:list-block>
    </xsl:template>
    
    <xsl:template match="auteur">
        <fo:list-item>
            <fo:list-item-label start-indent="0.5cm">
                <fo:block><xsl:value-of select="position()">
                </xsl:value-of>.</fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="1cm">
                <fo:block> 
                    <xsl:apply-templates select="prenom"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="nom"/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>
    
    <xsl:template match="prenom|nom">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="*|text()">
    </xsl:template>       
    
</xsl:stylesheet>