<%-- 
    Document   : ManageFeedbackBySeller
    Created on : Nov 1, 2021, 8:46:55 PM
    Author     : Ottelia
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- link Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
            rel="stylesheet"
            />
        <!--BOOTSTRAP5-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!--FONTAWESOME-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./css/style.css" />
        <link rel="stylesheet" type="text/css" href="./css/queries.css" />
        <link rel="stylesheet" type="text/css" href="./css/homepage.css" />
        <title>Manage Feedback</title>
        <style>
            td{
                padding-right:3em;
                padding:10px; border: 1px solid;
            }
            .row{
                margin-bottom: 40px;
            }
            .sort-form{
                margin: 40px;
            }
            #feedback {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                text-align: center;
            }

            #feedback td, #feedback th {
                border: 1px solid #ddd;
                padding: 5px;
                text-align: center;
            }

            #feedback tr:nth-child(even){background-color: #f2f2f2;}

            #feedback tr:hover {background-color: #ddd;}

            #feedback th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #d15321;
                color: white;
            }

            .checked {
                color: orange;
            }

        </style>
    </head>
    <body style="font-family: 'Poppins',sans-serif">
        <%@include file="model/header.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10">
                    <div style="margin:3em;">
                        <div class="btn-group" role="group">
                            <button id="btn" type="button" class="btn btn-outline-success dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
                                Rating
                            </button>
                            <ul class="dropdown-menu" >
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=1&sort-by-order=1">
                                        Asc
                                    </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=1&sort-by-order=2">
                                        Desc
                                    </a></li>
                            </ul>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="btn" type="button" class="btn btn-outline-success dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
                                User
                            </button>
                            <ul class="dropdown-menu" >
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=2&sort-by-order=1">
                                        Asc
                                    </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=2&sort-by-order=2">Desc</a></li>
                            </ul>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="btn" type="button" class="btn btn-outline-success dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
                                Product
                            </button>
                            <ul class="dropdown-menu" >
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=3&sort-by-order=1">
                                        Asc
                                    </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=3&sort-by-order=2">
                                        Desc
                                    </a></li>
                            </ul>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="btn" type="button" class="btn btn-outline-success dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
                                Time
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=4&sort-by-order=1">
                                        Oldest</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ManageFeedbackByCustomer?sort-flag=true&sort-order=4&sort-by-order=2">
                                        Latest</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row-fluid">

                        <div class="table-wrapper">
                            <center>
                                <table class="table table-striped table-hover" id="feedback" style="margin-left:3em; border: 1px solid; width: 100%;">
                                    <thead >
                                        <tr>
                                            <th style="text-align: center;">FeedbackID</th>
                                            <th style="text-align: center;">OrderID</th>
                                            <th style="text-align: center;"></th>
                                            <th style="text-align: center;">Product</th>
                                            <th style="text-align: center;">Star</th>
                                            <th style="text-align: center;">View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${requestScope.lsFeedback}" varStatus="x">
                                            <tr style="padding:2px; border: 1px solid">
                                                <td>${item.id}</td>
                                                <td>${item.orderID}</td>
                                                <td>
                                                        <img style="width: 100px" src="./resources/img/products/${item.product.url}">
                                                    </td>
                                                <td>
                                                    ${item.product.productName}
                                                </td>
                                                <td>
                                                    <c:forEach begin="1" end="${item.star}">
                                                        <span><i class="fa fa-star checked" style="font-size: 10px"></i></span>  
                                                        </c:forEach>
                                                </td>
                                                <td><a href="ViewFeedback?id=${item.id}">Detail</a></td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </center>
                        </div>   

                    </div>
                </div>

            </div>
        </div>      


        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
    </body>
</html>
