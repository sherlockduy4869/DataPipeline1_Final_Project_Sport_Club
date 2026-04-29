<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" />

    <xsl:template match="/">
        <html>
            <body>
                <h2>Membership Distribution</h2>

                <ul>
                    <li>GOLD: <xsl:value-of select="count(//MEMBER[MEMBERSHIPS='GOLD'])" /></li>
                    <li>SILVER: <xsl:value-of select="count(//MEMBER[MEMBERSHIPS='SILVER'])" /></li>
                    <li>BRONZE: <xsl:value-of select="count(//MEMBER[MEMBERSHIPS='BRONZE'])" /></li>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>