<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Index all TEAM elements by their child ID element -->
    <xsl:key name="teamById" match="TEAM" use="ID"/>

    <!-- Output as HTML with indentation -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template: matches the document root and builds the full HTML page -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Competition Calendar</title>
            </head>
            <body>
                <h2>Competition Calendar</h2>
                <table border="1">
                    <!-- Table header row -->
                    <tr>
                        <th>Competition ID</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Team</th>
                    </tr>

                    <!-- Iterate over every COMPETITION node -->
                    <xsl:for-each select="CLUB/COMPETITIONS/COMPETITION">
                        <xsl:sort select="DATE" order="ascending"/>
                        <xsl:variable name="team" select="key('teamById', TEAMID)"/>

                        <!-- One table row per competition -->
                        <tr>
                            <td><xsl:value-of select="ID"/></td>
                            <td><xsl:value-of select="NAME"/></td>
                            <td><xsl:value-of select="DATE"/></td>
                            <!-- Team name resolved via key lookup -->
                            <td><xsl:value-of select="$team/NAME"/></td>
                        </tr>
                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
