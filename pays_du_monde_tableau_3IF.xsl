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
				Mise en forme par : BUTRUILLE Solene, GALL Roxane, SADER Bruno, (B3149)

				<xsl:apply-templates select="//metadonnees"/>
				<br/>
				Pays avec 6 voisins :

				<xsl:for-each select="//country">
					<xsl:if test="borders[count(neighbour)=6]">
						<xsl:value-of select="name/common"/>,
					</xsl:if>
				</xsl:for-each>
				<br/>
				<br/>
				Pays ayant le nom le plus court : //manque la requête
				<br/>
				<br/> 
				<xsl:for-each select = ".//continent[not(.=preceding::*)]"> 
				<li> Pays du continent : <xsl:value-of select = "." /> par sous-régions :</li>
				<xsl:variable name="conti">
					<xsl:value-of select="//continent"/>
				</xsl:variable>
				<xsl:variable name="region">
					<xsl:value-of select="//subregion"/>
				</xsl:variable>
				<table border="3" width="100%" align="center">
					<tr>
						<th>N°</th>
						<th>Nom</th>
						<th>Capitale</th>
						<th>Voisins</th>
						<th>Coordonnées</th>
						<th>Drapeau</th>
					</tr>

					<xsl:call-template name= "remplirTab"> </xsl:call-template> 
				</table>
				 </xsl:for-each>

			</body>
		</html>
	</xsl:template>

	<xsl:template match="metadonnees">
		<p style="text-align:center; color:blue;">
			Objectif :

			<xsl:value-of select="objectif"/>
		</p>
		<hr/>
	</xsl:template>

	<xsl:template match="lal">
	<h1>Les pays du monde</h1>
		faire un for each de chaque continent, dedans un for each de chaque sous continent, dedans créer un tableau et appeler un template qui va mettre tous les pays restant dans le tableau
		
		<xsl:for-each select="infosContinent/continent">
			<text>Pays du continent :
			</text>

			<xsl:value-of select="continent"/>
			<text>
				par sous-régions :
			</text>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name ="remplirTab">
	il faut surement faire un template avec paramètre et mettre le nom de continent en paramètre puis faire une selection sur les pays. 
		<xsl:for-each select="//country">
		<tr>
			<td><xsl:number/></td>
			<td>
			<span style="color:green">
			<xsl:value-of select="name/common"/>
			</span>
				(<xsl:value-of select="name/official"/>)</td>
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
			<td>

				<xsl:choose>

					<xsl:when test="borders[count(neighbour)>0]">

						<xsl:for-each select="borders/neighbour">
							
							<xsl:value-of select="."/>,
						</xsl:for-each>
					</xsl:when>

					<xsl:otherwise>

						<xsl:choose>

							<xsl:when test="landlocked='false'">
								Île
							</xsl:when>

							<xsl:otherwise></xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>

				</xsl:choose>
			</td>
			<td>
				Latitude:

				<xsl:value-of select="coordinates/@lat"/>
				<br/>
				Longitude:

				<xsl:value-of select="coordinates/@long"/>
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
	</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
