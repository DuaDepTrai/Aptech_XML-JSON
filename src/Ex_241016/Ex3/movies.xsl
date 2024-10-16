<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/movies">
        <html>
            <head>
                <title>Movies</title>
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
                <h1>List of Movies</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Poster</th>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Genre</th>
                            <th>Director</th>
                            <th>Release Date</th>
                            <th>Rating</th>
                            <th>Duration</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="movie">
                            <tr>
                                <td>
                                    <img src="{poster}" alt="Movie Poster"></img>
                                </td>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="genre"/></td>
                                <td><xsl:value-of select="director"/></td>
                                <td><xsl:value-of select="releaseDate"/></td>
                                <td><xsl:value-of select="rating"/></td>
                                <td><xsl:value-of select="duration"/></td>
                                <td class="description"><xsl:value-of select="description"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>