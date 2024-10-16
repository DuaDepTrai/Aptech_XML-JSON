<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/tours">
        <html>
            <head>
                <title>Tours</title>
                <style>
                    /* Định dạng cho bảng */
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                        font-family: Arial, sans-serif;
                        font-size: 16px;
                    }

                    th, td {
                        border: 1px solid #ddd;
                        padding: 12px;
                        text-align: center;
                    }

                    /* Tiêu đề bảng */
                    th {
                        background-color: #e0f7fa; /* Xanh nhạt */
                        font-weight: bold;
                        color: #00796b; /* Xanh đậm */
                    }

                    /* Màu nền xen kẽ giữa các dòng */
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }

                    /* Định dạng ảnh trong bảng */
                    img {
                        display: block;
                        margin: 0 auto; /* Căn giữa ảnh */
                        max-width: 150px;
                        max-height: 150px;
                    }

                    /* Cắt bớt mô tả nếu quá dài */
                    .description {
                        white-space: nowrap;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        max-width: 400px; /* Giới hạn chiều rộng */
                        display: inline-block;
                        vertical-align: top;
                    }
                </style>
            </head>
            <body>
                <h1> Tours Information</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên tour</th>
                            <th>Địa điểm</th>
                            <th>Mô tả</th>
                            <th>Giá</th>
                            <th>Thời lượng</th>
                            <th>Ảnh</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="tour">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="location"/></td>
                                <td class="description">
                                    <xsl:value-of select="description"/>
                                </td>
                                <td><xsl:value-of select="price"/></td>
                                <td><xsl:value-of select="duration"/></td>
                                <td>
                                    <img src="{image}" alt="Tour Image"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>