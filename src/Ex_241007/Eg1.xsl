<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Eg1.xsl
    Created on : October 7, 2024, 7:17 PM
    Author     : Admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:sinhvien="http://www.example.com/sinhvien"
                version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Eg1.xsl</title>
                <style>
                    table, td{
                        border: 1px solid #000;
                    }
                </style>
            </head>
            <body>
                <h3>DEMO</h3>
                <table>
                    <thead>
                        <td>MaSV</td>
                        <td>TenSV</td>
                        <td>Tuoi</td>
                        <td>Gioi tinh</td>
                        <td>Dia chi</td>
                    </thead>
                    <tbody>
                        <xsl:for-each select="sinhvien:SinhVien">
                            <tr>
                                <td><xsl:value-of select="sinhvien:MaSV"/></td>
                                <td><xsl:value-of select="sinhvien:TenSV"/></td>
                                <td><xsl:value-of select="sinhvien:Tuoi"/></td>
                                <td><xsl:value-of select="sinhvien:GioiTinh"/></td>
                                <td><xsl:value-of select="sinhvien:DiaChi"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <xsl:value-of select="SinhVien/MaSV"></xsl:value-of>
                <!--<xsl:for-each select="SinhVien"></xsl:for-each>-->
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
