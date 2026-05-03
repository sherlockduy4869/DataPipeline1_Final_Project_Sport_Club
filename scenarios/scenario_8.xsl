<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <teamsHierarchy>
    <xsl:for-each select="CLUB/TEAMS/TEAM">
      <xsl:variable name="tId" select="ID"/>
      <team>
        <id><xsl:value-of select="$tId"/></id>
        <name><xsl:value-of select="NAME"/></name>
        <coachId><xsl:value-of select="MES/@idref"/></coachId>
        <roster>
          <xsl:for-each select="MEMBERS/MEMBER">
            <member>
              <id><xsl:value-of select="ID"/></id>
              <name><xsl:value-of select="NAME"/></name>
              <email><xsl:value-of select="EMAIL"/></email>
              <membership><xsl:value-of select="MEMBERSHIPS"/></membership>
            </member>
          </xsl:for-each>
        </roster>
      </team>
    </xsl:for-each>
  </teamsHierarchy>
</xsl:template>

</xsl:stylesheet>