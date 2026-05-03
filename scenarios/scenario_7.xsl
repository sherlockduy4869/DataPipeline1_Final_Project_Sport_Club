<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

  <xsl:template match="/CLUB">
    <publicDirectory>
      <xsl:for-each select="TEAMS/TEAM">
        <team>
          <id><xsl:value-of select="ID"/></id>
          <name><xsl:value-of select="NAME"/></name>
          <coachId><xsl:value-of select="MES/@idref"/></coachId>

          <members>
            <xsl:for-each select="MEMBERS/MEMBER">
              <member>
                <id><xsl:value-of select="ID"/></id>
                <name><xsl:value-of select="NAME"/></name>
                <email><xsl:value-of select="EMAIL"/></email>
                <membershipLevel><xsl:value-of select="MEMBERSHIPS"/></membershipLevel>
              </member>
            </xsl:for-each>
          </members>
        </team>
      </xsl:for-each>
    </publicDirectory>
  </xsl:template>

</xsl:stylesheet>