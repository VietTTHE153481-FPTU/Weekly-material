<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : OrderDetail
    Created on : 02-11-2021, 21:15:15
    Author     : BEAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
        <link rel="stylesheet" href="css/dashboard.css" />
        <title>Order Details</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div id="dismiss">
                    <i class="bi bi-arrow-left"></i>
                </div>

                <div class="sidebar-header">

                    <h3>Shope</h3>
                </div>

                <ul class="list-unstyled components">
                    <p>Dummy Heading</p>
                    <li>
                        <a href="home">Home
                            <i class="bi bi-house float-end"></i>
                        </a>

                    </li>
                    <li>
                        <a href="ManagerOrder">Manager Order <i class="bi bi-cart-check float-end"></i></i></a>
                    </li>
                    <li>
                        <a href="ManagerProduct">Manager Product <i class="bi bi-bag-fill float-end"></i></a>
                    </li>
                    <li>
                        <a href="ManagerBlog">Manager Blog <i class="bi bi-bootstrap float-end"></i></a>
                    </li>
                    <li>
                        <a href="ManagerAccount">Manager Account<i class="bi bi-person float-end"></i></a>
                    </li>
                </ul>

                <ul class="list-unstyled CTAs">
                    <li><a href="home" class="download">Logout</a></li>
                </ul>
            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-default">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                                <i class="glyphicon glyphicon-align-left"></i>
                                <span>Open Sidebar</span>
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
                                    <div class="d-flex mt-2">
                                        <div class="" style="width: 50%;">
                                            <p class="text-black fw-bold">Order ID: </p>
                                            <p class="text-black fw-bold">Order Date: </p>
                                            <p class="text-black fw-bold">Order Status: </p>
                                            <p class="text-black fw-bold">Ship Address :</p>
                                            <p class="text-black fw-bold">Customer Name :</p>
                                            <p class="text-black fw-bold">Phone :</p>
                                        </div>
                                        <div class="" style="width: 50%;">
                                            <c:forEach var="o" items="${order}" begin="1" end="2" step="1">
                                                <p class="text-black">${o.id}</p>
                                                <p class="text-black">${o.date}</p>
                                                <p class="text-black">${o.status}</p>
                                            </c:forEach>
                                            <p class="text-black">${ship.shippingAddress}</p>
                                            <p class="text-black">${ship.customerName}</p>
                                            <p class="text-black">${ship.phoneNum}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-5 p-3  m-3 bg-white ">
                                    <h3 class="text-center text-primary">Product</h3>
                                    <div class="d-flex mt-2">
                                        <div class="" style="width: 50%;">
                                            <c:forEach var="o" items="${order}">
                                                <p class="text-black fw-bold">Product ID: </p>
                                                <p class="text-black fw-bold">Product Name: </p>
                                            </c:forEach>
                                        </div>
                                        <div class="" style="width: 50%;">
                                            <c:forEach var="o" items="${order}">
                                                <p class="text-black">${o.productID}</p>
                                                <p class="text-black">${o.productName}</p>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-11 mb-3 p-3 bg-white" style="margin: auto;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Product IMG</th>
                                            <th scope="col">Product Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="o" items="${order}">
                                            <tr>
                                                <th scope="row">${o.id}</th>
                                                <td>${o.productName}</td>
                                                <td>${o.productPrice}</td>
                                                <td>${o.quantity}</td>
                                                <c:forEach var="p" items="${listProduct}">
                                                    <c:if test="${o.productID == p.productID}">
                                                        <td><img src="./resources/img/${p.url}" alt="" width="120px"></td>
                                                        </c:if>

                                                </c:forEach>
                                                <td>300$</td>
                                            </tr>

                                        </c:forEach>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <p class="fs-4 fw-bold m-0 p-0 text-black">Total</p>
                                            </td>
                                            <td>
                                                <p class="fs-3 fw-normal m-0 p-0 text-success">${o.totalPrice}</p>
                                            </td>

                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <a class="btn btn-primary px-3" href="ManagerOrder" role="button" style="margin:50px;">Back </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="overlay "></div>


    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js "></script>
    <!-- Bootstrap Js CDN -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js "></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js "></script>

    <script type="text/javascript ">
        $(document).ready(function() {
        $("#sidebar ").mCustomScrollbar({
        theme: "minimal "
        });

        $('#dismiss, .overlay').on('click', function() {
        $('#sidebar').removeClass('active');
        $('.overlay').fadeOut();
        });

        $('#sidebarCollapse').on('click', function() {
        $('#sidebar').addClass('active');
        $('.overlay').fadeIn();
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
        });
    </script>
</body>
</html>
