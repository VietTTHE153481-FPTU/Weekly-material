<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : DeliveryDetail
    Created on : 08-11-2021, 04:55:12
    Author     : BEAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
        <link rel="stylesheet" href="css/Delivery.css" />
        <title>DeliveryDetail</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">

                <div class="sidebar-header">

                    <h3>Shope</h3>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="home">Home
                            <i class="bi bi-house float-end"></i>
                        </a>

                    </li>

                    <li>
                        <a href="">JOBS <i class="bi bi-bag-fill float-end"></i></a>
                    </li>
                </ul>

                <ul class="list-unstyled CTAs">
                   <li><a href="${pageContext.request.contextPath}/logout" class="download">Log out</a></li>
                </ul>
            </nav>

            <!-- Page Content Holder -->
            <div id="content" style="width: 100%;">

                <nav class="navbar navbar-default">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                                <i class="glyphicon glyphicon-align-left"></i>
                                <span>Delivering </span>
                            </button>
                        </div>
                    </div>
                </nav>


                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-md-12 mb-3 ">
                            <div class="card">
                                <div class="card-header bg-primary ">
                                    <p class="text-white p-0 m-0"><i class="bi bi-cart4"></i> Order Details</p>
                                </div>
                            </div>

                            <div class="col-md-12 mb-3 p-3 mt-5 bg-light d-flex  flex-nowrap justify-content-md-around">
                                <div class="col-5 p-3  m-3 bg-white ">
                                    <h3 class="text-center text-primary">Order</h3>
                                    <div class="d-flex">
                                        <div class="" style="width: 50%;">
                                            <p class="text-black fw-bold">Order ID: </p>
                                            <p class="text-black fw-bold">Order Date: </p>

                                        </div>
                                        <div class="" style="width: 50%;">
                                            <p class="text-black">${ship.orderID}</p>
                                            <p class="text-black">${order.date}</p>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-5 p-3  m-3 bg-white ">
                                    <h3 class="text-center text-primary">Custommer</h3>
                                    <div class="d-flex">
                                        <div class="" style="width: 50%;">
                                            <p class="text-black fw-bold">Customer Name :</p>
                                            <p class="text-black fw-bold">Phone :</p>
                                            <p class="text-black fw-bold">Address :</p>
                                            <p class="text-black fw-bold">City :</p>
                                        </div>
                                        <div class="" style="width: 50%;">
                                            <p class="text-black">${ship.customerName}</p>
                                            <p class="text-black">${ship.phoneNum}</p>
                                            <p class="text-black">${ship.shippingAddress}</p>
                                            <c:forEach var="o" items="${listShip}">
                                                <c:if test="${o.id ==ship.shipCityID}">
                                                    <p class="text-black">${o.cityName}</p>
                                                </c:if> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-11 mb-3 p-3 bg-white" style="margin: auto;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Order ID</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Ship TO</th>
                                            <th scope="col">Ship Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td> ${ship.orderID}</td>
                                            <td> ${order.productName}</td>
                                            <td> ${ship.shippingAddress}</td>
                                            <c:forEach var="o" items="${listShip}">
                                                <c:if test="${o.id ==ship.shipCityID}">
                                                    <td class="text-black">${o.shipPrice}</td>
                                                </c:if> 
                                            </c:forEach>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


        </div>

        <!--jQuery CDN-->  
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!--Bootstrap Js CDN--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--jQuery Custom Scroller CDN--> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>

        <script src="./js/jquery.dataTables.min.js"></script>
        <script src="./js/dataTables.bootstrap5.min.js"></script>
        <script src="./js/script1.js"></script>
    </body>
</html>
