<?xml version="1.0"?>

<xsl:stylesheet version  ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

// Il faut déclarer le paramètre ! 
<xsl:param name="paysRecherche">
</xsl:param> 

<xsl:template match="/">
  <HTML>
  <BODY bgcolor="#FFFFCC">
  <H1> Informations </H1>
  <UL>
    <xsl:apply-templates select="//country[name/common = $paysRecherche]"/>
  </UL>
  </BODY>
  </HTML>			
</xsl:template>

<xsl:template match="country">
  <LI>
    <xsl:value-of select=".//name/official"/>
    <br/>
  </LI>
  <LI>
     <xsl:value-of select=".//capital"/>
    <br/>
    </LI>
    <LI>
     <xsl:value-of select=".//infosContinent/continent"/>
    <br/>
  </LI>
</xsl:template>

</xsl:stylesheet>