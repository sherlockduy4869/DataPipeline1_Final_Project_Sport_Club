<?xml version="1.0" encoding="UTF-8"?>

<!--
Scenario 10:
Export training sessions into JSON format.
For each session:
- ID
- TIME
- TEAM NAME
- COACH NAME (via MES idref)
- FACILITY NAME
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" indent="yes"/>

    <xsl:template match="/">

{
  "sessions": [
<xsl:for-each select="CLUB/TRAININGSESSIONS/TRAININGSESSION">

    <xsl:variable name="teamId" select="TEAMID"/>
    <xsl:variable name="facilityId" select="FACILITYID"/>

    <!-- Find TEAM -->
    <xsl:variable name="team" select="/CLUB/TEAMS/TEAM[ID = $teamId]"/>

    <!-- Find COACH via MES -->
    <xsl:variable name="coachId" select="$team/MES/@idref"/>
    <xsl:variable name="coach" select="/CLUB/COACHES/COACH[@id = $coachId]"/>

    <!-- Find FACILITY -->
    <xsl:variable name="facility" select="/CLUB/FACILITIES/FACILITY[ID = $facilityId]"/>

    {
      "id": "<xsl:value-of select="ID"/>",
      "time": "<xsl:value-of select="TIME"/>",
      "team": "<xsl:value-of select="$team/NAME"/>",
      "coach": "<xsl:value-of select="$coach/NAME"/>",
      "facility": "<xsl:value-of select="$facility/NAME"/>"
    }<xsl:if test="position() != last()">,</xsl:if>

</xsl:for-each>
  ]
}

    </xsl:template>

</xsl:stylesheet>