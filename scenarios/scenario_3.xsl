<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" />

    <xsl:key name="coachKey" match="COACH" use="ID" />

    <xsl:template match="/">
        <html>
            <body>
                <h2>Teams and Coaches</h2>

                <table border="1">
                    <tr>
                        <th>Team</th>
                        <th>Coach</th>
                        <th>Specialty</th>
                    </tr>

                    <xsl:for-each select="CLUB/TEAMS/TEAM">
                        <tr>
                            <td>
                                <xsl:value-of select="NAME" />
                            </td>
                            <td>
                                <xsl:value-of select="key('coachKey', COACHID)/NAME" />
                            </td>
                            <td>
                                <xsl:value-of select="key('coachKey', COACHID)/SPECIALTY" />
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>