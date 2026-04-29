<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <teamsHierarchy>
    <xsl:for-each select="sportsClub/teams/team">
      <xsl:variable name="tId" select="@id"/>
      <team>
        <name><xsl:value-of select="name"/></name>
        <roster>
          <!-- This copies the full XML node of any member matching this team -->
          <xsl:copy-of select="/sportsClub/members/member[@teamId=$tId]"/>
        </roster>
      </team>
    </xsl:for-each>
  </teamsHierarchy>
</xsl:template>

</xsl:stylesheet>