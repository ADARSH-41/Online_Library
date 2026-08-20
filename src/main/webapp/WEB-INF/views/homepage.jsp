<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Homepage</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; max-width: 900px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f5f5f5; }
        caption { font-size: 1.5em; margin-bottom: 12px; }
        .empty { color: #555; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>Library Homepage</h1>
    <c:choose>
        <c:when test="${not empty books}">
            <table>
                <caption>Available Books</caption>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Author</th>
                        <th>Publisher / Year</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.name}</td>
                            <td>${book.author}</td>
                            <td>${book.publisher} / ${book.year}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p class="empty">No books available at the moment.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
