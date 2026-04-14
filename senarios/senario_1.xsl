<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Team Sizes</title>
            </head>
            <body>
                <h2>Team Size Comparison</h2>
                <table border="1">
                    <tr>
                        <th>Team Name</th>
                        <th>Number of Members</th>
                    </tr>

                    <xsl:for-each select="CLUB/TEAMS/TEAM">
                        <tr>
                            <td>
                                <xsl:value-of select="NAME" />
                            </td>
                            <td>
                                <xsl:value-of select="count(MEMBERS/MEMBER)" />
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>