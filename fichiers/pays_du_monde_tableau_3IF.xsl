<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Wed Mar 20 16:51:30 CET 2019 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
			    Pays du monde 
			  </title>
			</head>
			<body style="background-color:white;">
				<h1>Les pays du monde</h1>
			      Mise en forme par : moi, mon binôme (B3149)
			      <xsl:apply-templates select="//metadonnees"/>
				<table border="3" width="100%" align="center">
					<tr>
						<th>N°</th>
						<th>Nom</th>
						<th>Capitale</th>
						<th>Voisins</th>
						<th>Coordonn</th>
						<th>Drapeau</th>
					</tr>
					<xsl:apply-templates select="//country"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="metadonnees">
		<p style="text-align:center; color:blue;">
       			 Objectif : <xsl:value-of select="objectif"/>
		</p>
		<hr/>
	</xsl:template>
	<xsl:template match="country">
	<tr>
	<td><xsl:number/></td>
	<td><xsl:value-of select="name/common"/> (<xsl:value-of select="name/official"/>)</td>
	<td>
	  <xsl:choose>
     		<xsl:when test="name/native_name[@lang='fra']">
		<span style="color:brown">
		<xsl:value-of select="capital"/>
		</span>
	     </xsl:when>
	     <xsl:otherwise>
		<xsl:value-of select="capital"/>
	     </xsl:otherwise>
	   </xsl:choose>
	</td>
	</tr>

	</xsl:template>
</xsl:stylesheet>
