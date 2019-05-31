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
  <table border="3" width="50%" align="center">
    <tr>
      <td>
      <xsl:value-of select=".//name/official"/>
    </td>
    <td>
      <xsl:value-of select=".//capital"/>
    </td>
    <td>
        <xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xsl:variable>

              <xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

              <xsl:variable name="code">
                <xsl:value-of select="translate(codes/cca2,$ucletters,$lcletters)"/>
              </xsl:variable>
              <img src="http://www.geonames.org/flags/x/{$code}.gif" alt="" height="40" width="60"/>
    </td>
   </tr>
  </table>
</xsl:template>

</xsl:stylesheet>