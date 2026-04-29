<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <publicMembers>
    <xsl:for-each select="sportsClub/members/member">
      <member>
        <xsl:attribute name="teamId"><xsl:value-of select="@teamId"/></xsl:attribute>
        <name><xsl:value-of select="name"/></name>
      </member>
    </xsl:for-each>
  </publicMembers>
</xsl:template>

</xsl:stylesheet>