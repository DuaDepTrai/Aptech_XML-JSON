<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="1.0">
    <xsl:output method="html"/>
    <xsl:key name="LopKey" match="Lop" use="malop" />

    <xsl:template match="/DsSinhVien">
        <html>
            <head>
                <title>Thong Tin Sinh Vien</title>
                <style>
                    h3 {
                        text-align: center;
                        margin-top: 30px;
                    }
                    table {
                        width: 50%;
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
                <h3>Thong Tin Sinh Vien</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Ho va ten</th>
                            <th>Ma SV</th>
                            <th>Ngay Sinh</th>
                            <th>Gioi Tinh</th>
                            <th>So Dien Thoai</th>
                            <th>Lop</th>
                            <th>GVCN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="SinhVien">
                            <xsl:sort select="key('LopKey', malop)/tenlop" data-type="text" order="ascending"/>
                            <xsl:sort select="masv" data-type="text" order="ascending"/> <!-- Sắp xếp thêm theo họ tên nếu cần -->
                            
                            <tr>
                                <td><xsl:value-of select="hoten"/></td>
                                <td><xsl:value-of select="masv"/></td>
                                <td><xsl:value-of select="ngaysinh"/></td>
                                <td><xsl:value-of select="gioitinh"/></td>
                                <td><xsl:value-of select="sodienthoai"/></td>
                                <td>
                                    <xsl:value-of select="key('LopKey', malop)/tenlop" />
                                </td>
                                <td>
                                    <xsl:value-of select="key('LopKey', malop)/hoten_gvcn" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>