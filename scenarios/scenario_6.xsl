<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Index all TRAININGSESSION elements by their FACILITYID child element -->
    <xsl:key name="sessionByFacility" match="TRAININGSESSION" use="FACILITYID"/>

    <!-- Index all TEAM elements by their child ID element -->
    <xsl:key name="teamById" match="TEAM" use="ID"/>

    <!-- Output as HTML with indentation -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template: matches the document root and builds the full HTML page -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Facility Usage Report</title>
            </head>
            <body>
                <h2>Facility Usage Report</h2>
                <table border="1">
                    <!-- Table header row -->
                    <tr>
                        <th>Facility</th>
                        <th>Location</th>
                        <th>Capacity</th>
                        <th>Session ID</th>
                        <th>Team</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>

                    <!-- Iterate over every FACILITY node -->
                    <xsl:for-each select="CLUB/FACILITIES/FACILITY">
                        <xsl:sort select="CAPACITY" data-type="number" order="descending"/>

                        <!-- Retrieve all TRAININGSESSION nodes whose FACILITYID matches the current facility's ID -->
                        <xsl:variable name="sessions" select="key('sessionByFacility', ID)"/>
                        <xsl:variable name="facilityName" select="NAME"/>
                        <xsl:variable name="facilityLocation" select="LOCATION"/>
                        <xsl:variable name="facilityCapacity" select="CAPACITY"/>

                        <xsl:choose>
                            <!--
                                Case 1: this facility has at least one session.
                                Produce one row per session, repeating facility info on each row.
                            -->
                            <xsl:when test="$sessions">
                                <xsl:for-each select="$sessions">
                                    <xsl:sort select="TIME" order="ascending"/>
                                    <xsl:variable name="team" select="key('teamById', TEAMID)"/>

                                    <!-- Split ISO 8601 dateTime (e.g. 2026-03-25T08:00:00) -->
                                    <xsl:variable name="datePart" select="substring-before(TIME, 'T')"/>
                                    <xsl:variable name="timePart" select="substring-after(TIME,  'T')"/>

                                    <tr>
                                        <!-- Facility info from saved variables (context is now a session) -->
                                        <td><xsl:value-of select="$facilityName"/></td>
                                        <td><xsl:value-of select="$facilityLocation"/></td>
                                        <td><xsl:value-of select="$facilityCapacity"/></td>
                                        <!-- Session info for this row -->
                                        <td><xsl:value-of select="ID"/></td>
                                        <!-- Team name resolved via key lookup -->
                                        <td><xsl:value-of select="$team/NAME"/></td>
                                        <td><xsl:value-of select="$datePart"/></td>
                                        <td><xsl:value-of select="$timePart"/></td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:when>

                            <!--
                                Case 2: this facility has no sessions scheduled.
                                Still produce a row so the facility is visible in the output,
                                with empty dashes in the session columns.
                            -->
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="$facilityName"/></td>
                                    <td><xsl:value-of select="$facilityLocation"/></td>
                                    <td><xsl:value-of select="$facilityCapacity"/></td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
