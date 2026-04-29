<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/">
{
  "teamsSummary": [
    <xsl:for-each select="sportsClub/teams/team">
      <xsl:variable name="tId" select="@id"/>
      {
        "teamId": "<xsl:value-of select="@id"/>",
        "teamName": "<xsl:value-of select="name"/>",
        "coachId": "<xsl:value-of select="@coachID"/>",
        "totalMembers": <xsl:value-of select="count(/sportsClub/members/member[@teamId=$tId])"/>
      }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
  ]
}
</xsl:template>

</xsl:stylesheet>