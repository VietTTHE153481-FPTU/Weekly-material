<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : Daskboard
    Created on : 12-10-2021, 21:59:57
    Author     : BEAN
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
        <link rel="stylesheet" href="css/dashboard.css" />
        <title>Dashboard</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->  


            <!-- Page Content Holder -->
            <div id="content">

                <%@include file="model/Sidebar.jsp" %>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Dashboard</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <div class="card bg-primary text-white h-100"> 
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Custom</h3>
                                    <p class="text-center text-white mt-3 mb-0 fs-3 "> ${totalCus} <i class="bi bi-person"></i></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card bg-warning text-dark h-100">
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Product </h3>
                                    <p class="text-center text-white mt-4 mb-0 fs-3 ">${totalPro} <i class="bi bi-archive"></i></p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <div class="card bg-danger text-white h-100">
                                <div class="card-body py-3">
                                    <h3 class="text-white text-center fs-5">Total Order</h3>
                                    <p class="text-center text-white mt-3 mb-0 fs-3 "> ${totalOrders} <i class="bi bi-bag-check"></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header">
                                    <span><i class="bi bi-table me-2"></i></span> Order Dashboard
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-striped data-table" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Product Name</th>
                                                    <th>Product price</th>
                                                    <th>Status</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="o" items="${listOrder}">
                                                    <tr>
                                                        <td>${o.id}</td>
                                                        <td>${o.productName}</td>
                                                        <td>${o.productPrice}</td>
                                                        <c:if test="${o.status == 1}">
                                                            <td><span class="badge rounded-pill bg-secondary">Waiting for Confirmation</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 2}">
                                                            <td><span class="badge rounded-pill bg-warning text-dark">Packing</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 3}">
                                                            <td><span class="badge rounded-pill bg-primary">Delivering</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 4}">
                                                            <td><span class="badge bg-danger">Canceled</span></td>
                                                        </c:if>
                                                        <c:if test="${o.status == 5}">
                                                            <td><span class="badge bg-success">completed</span></td>
                                                        </c:if>
                                                        <td>${o.date}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="overlay"></div>


        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Bootstrap Js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#dismiss, .overlay').on('click', function () {
                    $('#sidebar').removeClass('active');
                    $('.overlay').fadeOut();
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').addClass('active');
                    $('.overlay').fadeIn();
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>

        <script src="./js/jquery.dataTables.min.js"></script>
        <script src="./js/dataTables.bootstrap5.min.js"></script>
        <script src="./js/script1.js"></script>
    </body>
</html>
