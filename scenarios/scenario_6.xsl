<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:key name="sessionByFacility" match="TRAININGSESSION" use="FACILITYID"/>
    <xsl:key name="teamById" match="TEAM" use="ID"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Facility Usage Report</title>
            </head>
            <body>
                <h2>Facility Usage Report</h2>
                <table border="1">
                    <tr>
                        <th>Facility</th>
                        <th>Location</th>
                        <th>Capacity</th>
                        <th>Session ID</th>
                        <th>Team</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>

                    <xsl:for-each select="CLUB/FACILITIES/FACILITY">
                        <xsl:sort select="CAPACITY" data-type="number" order="descending"/>
                        <xsl:variable name="sessions" select="key('sessionByFacility', ID)"/>
                        <xsl:variable name="facilityName"     select="NAME"/>
                        <xsl:variable name="facilityLocation" select="LOCATION"/>
                        <xsl:variable name="facilityCapacity" select="CAPACITY"/>

                        <xsl:choose>
                            <xsl:when test="$sessions">
                                <xsl:for-each select="$sessions">
                                    <xsl:sort select="TIME" order="ascending"/>
                                    <xsl:variable name="team" select="key('teamById', TEAMID)"/>
                                    <xsl:variable name="datePart" select="substring-before(TIME, 'T')"/>
                                    <xsl:variable name="timePart" select="substring-after(TIME,  'T')"/>
                                    <tr>
                                        <td><xsl:value-of select="$facilityName"/></td>
                                        <td><xsl:value-of select="$facilityLocation"/></td>
                                        <td><xsl:value-of select="$facilityCapacity"/></td>
                                        <td><xsl:value-of select="ID"/></td>
                                        <td><xsl:value-of select="$team/NAME"/></td>
                                        <td><xsl:value-of select="$datePart"/></td>
                                        <td><xsl:value-of select="$timePart"/></td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="$facilityName"/></td>
                                    <td><xsl:value-of select="$facilityLocation"/></td>
                                    <td><xsl:value-of select="$facilityCapacity"/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
