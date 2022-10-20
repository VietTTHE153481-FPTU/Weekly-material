<%-- 
    Document   : layout
    Created on : Oct 27, 2021, 10:47:44 AM
    Author     : Duy Manh
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <jsp:include page="layout/_header.jsp"/>
            <jsp:include page="layout/_menu.jsp"/>

            <div class="row">
                <article class="col-sm-9">
                    <!--content-->
                    <h2>List Customers</h2>
                    <a href="UserServlet?action=AddOrEdit" class="btn btn-primary">Add Users</a>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Birthday</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Register Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${LIST_CUSTOMER}">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>${c.name}</td>
                                    <td>
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${c.birthday}" />
                                    </td>
                                    <td>
                                        <c:if test="${c.gender}">Nam</c:if>
                                        <c:if test="${not c.gender}">Nu</c:if>
                                        </td>
                                        <td>${c.email}</td>
                                    <td>${c.phone}</td>
                                    <td>                                       
                                        <fmt:formatDate pattern = "yyyy-MM-dd" 
                                                        value = "${c.registerDate}" />
                                    </td>                               
                                    <td><a class="btn btn-primary btn-sm" href="UserServlet?action=AddOrEdit&username=12">Edit</a> |
                                        <a class="btn btn-danger btn-sm" href="UserServlet?action=Delete&username=12">Del</a></td>
                                </tr>   
                            </c:forEach>


                        </tbody>
                    </table>
                    <!--end content-->              

                </article>
                <jsp:include page="layout/_aside.jsp"/>

            </div>
            <jsp:include page="layout/_footer.jsp"/>

        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>
