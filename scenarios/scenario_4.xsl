<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Index all TEAM elements by their child ID element -->
    <xsl:key name="teamById" match="TEAM" use="ID"/>

    <!-- Index all FACILITY elements by their child ID element -->
    <xsl:key name="facilityById" match="FACILITY" use="ID"/>

    <xsl:output method="html" indent="yes"/>

    <!-- Root template: matches the document root and builds the full HTML page -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Training Schedule</title>
            </head>
            <body>
                <h2>Training Schedule</h2>
                <table border="1">
                    <!-- Table header row -->
                    <tr>
                        <th>Session ID</th>
                        <th>Team</th>
                        <th>Facility</th>
                        <th>Location</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Equipment</th>
                    </tr>

                    <!-- Iterate over every TRAININGSESSION node -->
                    <xsl:for-each select="CLUB/TRAININGSESSIONS/TRAININGSESSION">
                        <xsl:sort select="TIME" order="ascending"/>
                        <xsl:variable name="team" select="key('teamById', TEAMID)"/>
                        <xsl:variable name="facility" select="key('facilityById', FACILITYID)"/>
                        <xsl:variable name="datePart" select="substring-before(TIME, 'T')"/>
                        <xsl:variable name="timePart" select="substring-after(TIME,  'T')"/>

                        <!-- One table row per training session -->
                        <tr>
                            <td><xsl:value-of select="ID"/></td>
                            <!-- Team name resolved via key lookup -->
                            <td><xsl:value-of select="$team/NAME"/></td>
                            <!-- Facility name and location resolved via key lookup -->
                            <td><xsl:value-of select="$facility/NAME"/></td>
                            <td><xsl:value-of select="$facility/LOCATION"/></td>
                            <!-- Date and time displayed in separate columns -->
                            <td><xsl:value-of select="$datePart"/></td>
                            <td><xsl:value-of select="$timePart"/></td>
                            <td>
                                <!-- Iterate over each EQUIPMENT child element -->
                                <xsl:for-each select="EQUIPMENTS/EQUIPMENT">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
