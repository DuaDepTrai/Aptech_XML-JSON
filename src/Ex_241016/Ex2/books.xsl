<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/books">
        <html>
            <head>
                <title>Books</title>
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
                        font-size: 14px;
                        color: #333;
                        max-width: 400px;
                        white-space: normal; /* Cho phép xuống dòng nếu cần */
                    }
                </style>
            </head>
            <body>
                <h1>List of Books</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Tác giả</th>
                            <th>Thể loại</th>
                            <th>Giá</th>
                            <th>Ngày xuất bản</th>
                            <th>Ảnh bìa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="book">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="author"/></td>
                                <td><xsl:value-of select="genre"/></td>
                                <td><xsl:value-of select="price"/></td>
                                <td>
                                    <span class="description">
                                        <xsl:choose>
                                            <xsl:when test="string-length(description) &gt; 80">
                                                <xsl:value-of select="concat(substring(description, 1, 77), '...')" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="description" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </span>
                                </td>
                                <td><xsl:value-of select="publicationDate"/></td>
                                <td>
                                    <img src="{coverImage}" alt="Cover Image"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>