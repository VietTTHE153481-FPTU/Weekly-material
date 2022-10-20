<%-- 
    Document   : ViewFeedback
    Created on : Nov 2, 2021, 12:05:40 AM
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
        <title>View Feedback</title>
        <style>
            td{
                padding-right:3em;
                padding:10px; border: 1px solid;
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
                border-bottom:  1px solid #ddd; 
            }

            #feedback tr:nth-child(even){background-color: #f2f2f2;}

            #feedback tr:hover {background-color: #ddd;}

            #feedback th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #21aed1;
                color: white;
            }

            .checked {
                color: orange;
            }
            .form-group{
                padding:2px;
            }
        </style>
    </head>
    <body style="font-family: 'Poppins',sans-serif">
        <%@include file="model/header.jsp" %>

        <div class="container-fuild">
            <div class="row">
                <hr>
                <div class="row">

                    <div class="col-md-4">
                        <img src="./resources/img/products/${requestScope.feedback.product.url}" style="width: 50%;  margin-left: 40px; ">
                        <div class="card-body p-5">
                            <h3 class="card-title mb-3">${requestScope.feedback.product.productName}</h3>
                            <p class="price-detail-wrap"> 
                                <span class="price h4 text-warning"> 
                                    <span class="currency">${requestScope.feedback.product.sellPrice}</span>
                                </span> 
                            </p> 

                        </div>
                    </div>


                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Feedback about product</h5>
                            <table class="table border">

                                <tr class="form-group">
                                    <td class="col-md-3"><b>Order ID</b></td>
                                    <td class="col-md-9">${requestScope.feedback.orderID}</td>
                                </tr>
                                <tr class="form-group">
                                    <td class="col-md-3"><b>User</b></td>
                                    <td class="col-md-9">${requestScope.feedback.user.userName}</td>
                                </tr>
                                <tr class="form-group" >
                                    <td class="col-md-3"><b>Rating</b></td>
                                    <td class="col-md-9">
                                        <c:forEach begin="1" end="${requestScope.feedback.star}">
                                            <span>
                                                <i class="fa fa-star checked" style="font-size: 10px"></i>
                                            </span>  
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr  class="form-group">
                                    <td class="col-md-3"><b>Feedback Detail</b></td>
                                    <td class="col-md-9">${requestScope.feedback.feedbackDetail}</td>
                                </tr>
                                <tr  class="form-group">
                                    <td class="col-md-3"><b>Reply</b></td>
                                    <td class="col-md-9">${requestScope.rep}</td>
                                </tr>
                            </table>
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
        <script>
            window.onload = function () {
                formatCurrency();
            };
            var formatter = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'VND',

                // These options are needed to round to whole numbers if that's what you want.
                //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
            });
            function formatCurrency() {

                var listCurrency = document.getElementsByClassName("currency");
                for (let i = 0; i < listCurrency.length; i++) {
                    listCurrency[i].innerHTML = formatter.format(listCurrency[i].innerHTML);
                }

            }

        </script>
    </body>
</html>
