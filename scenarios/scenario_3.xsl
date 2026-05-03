<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/CLUB">
        <html>
            <head>
                <title>Teams and Coaches</title>
            </head>
            <body>

                <h1>Teams with Their Coaches</h1>

                <table border="1">
                    <tr>
                        <th>Team Name</th>
                        <th>Coach Name</th>
                    </tr>

                    <!-- Loop through each team -->
                    <xsl:for-each select="TEAMS/TEAM">
                        <tr>
                            <td>
                                <xsl:value-of select="NAME"/>
                            </td>

                            <td>
                                <!-- Get coach id from REF -->
                                <xsl:variable name="coachId" select="REF/@idCoach"/>

                                <!-- Find matching coach -->
                                <xsl:value-of select="/CLUB/COACHES/COACH[ID=$coachId]/NAME"/>
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>