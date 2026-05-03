<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/">
{
  "teamsSummary": [
    <xsl:for-each select="CLUB/TEAMS/TEAM">
      {
        "teamId": <xsl:value-of select="ID"/>,
        "teamName": "<xsl:value-of select="NAME"/>",
        "coachId": <xsl:value-of select="MES/@idref"/>,
        "totalMembers": <xsl:value-of select="count(MEMBERS/MEMBER)"/>
      }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
  ]
}
</xsl:template>

</xsl:stylesheet>