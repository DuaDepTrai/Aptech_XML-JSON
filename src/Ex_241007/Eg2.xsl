<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Eg2.xsl</title>
                <style>
                    h3 {
                        text-align: center;
                        margin-top: 30px;
                    }
                    table {
                        width: 30%;
                        margin: 0 auto;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #000;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <h3>DEMO</h3>
                <table>
                    <thead>
                        <tr>
                            <th>MaSV</th>
                            <th>TenSV</th>
                            <th>Tuoi</th>
                            <th>Gioi Tinh</th>
                            <th>Dia Chi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="DsSinhVien/SinhVien">
                            <tr>
                                <td><xsl:value-of select="MaSV"/></td>
                                <td><xsl:value-of select="TenSV"/></td>
                                <td><xsl:value-of select="Tuoi"/></td>
                                <td><xsl:value-of select="GioiTinh"/></td>
                                <td><xsl:value-of select="DiaChi"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>