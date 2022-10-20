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
        <link rel="stylesheet" href="css/Delivery.css" />
        <title>Delivering</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">

                <div class="sidebar-header">

                    <h3>Shope</h3>
                </div>

                <ul class="list-unstyled components">
                    <p>Shipping Manager</p>
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
                                <span>Delivering</span>
                            </button>
                        </div>
                    </div>
                </nav>


                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-primary ">
                                    <p class="text-white p-0 m-0"><i class="bi bi-cart4"></i> <span class="ps-2"> SHIPPING JOB</span> </p>
                                </div>
                            </div>
                        </div>

                        <div class="row pt-5">
                            <div class="col-md-12 mb-3">
                                <div class="card">

                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="example" class="table table-striped data-table" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Order ID</th>
                                                        <th>Ship to</th>
                                                        <th>City</th>
                                                        <th>Price</th>
                                                        <th>Details</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="o" items="${listShipInfo}">
                                                        <tr>
                                                            <td>${o.orderID}</td>
                                                            <td>${o.shippingAddress}</td>
                                                            <c:forEach var="s" items="${listShip}">
                                                                <c:if test="${o.shipCityID == s.id}">
                                                                    <td>${s.cityName}</td>
                                                                    <td>${s.shipPrice}</td>
                                                                </c:if>   
                                                            </c:forEach>
                                                            <td><a href="DeliveryDetail?oid=${o.orderID}" class="btn btn-sm btn-primary">See details</a></td>  
                                                            <td><a href="DeliverConfirm?oid=${o.orderID}" class="btn btn-sm btn-success">Take</a>
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
