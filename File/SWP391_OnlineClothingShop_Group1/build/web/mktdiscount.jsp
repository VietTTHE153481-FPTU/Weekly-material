<%-- 
    Document   : managediscount
    Created on : Nov 11, 2021, 4:14:18 PM
    Author     : CHAUBNMHE153019
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
        <title>Manage Discount</title>
        <!-- Icon -->
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico" type="image/x-icon">
            <!-- Google Fonts -->
            <link
              href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
              rel="stylesheet"
            />
         <!--BOOTSTRAP5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css" />
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--CSS-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/queries.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar Holder -->
           

            <!-- Page Content Holder -->
            <div id="content">
                 <%@include file="model/SidebarMarketing.jsp" %>
                

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Discount</h4>
                        </div>
                    </div>
                    <div class="row">
                        <table id="table_id" class="display">
                            <colgroup>
                                <col span="1" style="width: 5%;"/>
                                <col span="1" style="width: 25%;"/>
                                <col span="1" style="width: 30%;"/>
                                <col span="1" style="width: 10%;"/>
                                <col span="1" style="width: 10%;"/>
                                <col span="1" style="width: 10%;"/>
                                <col span="1" style="width: 10%;"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Original Price</th>
                                    <th>Sale Price</th>
                                    <th>Sale</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${products}" var="product" varStatus="i">
                                    <tr>
                                        <td>${i.count}</td>
                                        <td><img class="d-none d-sm-block img-thumbnail img-fluid" style="max-width: 200px" src="${pageContext.request.contextPath}/resources/img/products/${product.getUrl()}"></td>
                                        <td>${product.getProductName()}</td>
                                        <td class="currency">${product.getOriginPrice()}</td>
                                        <td class="currency">${product.getSellPrice()}</td>
                                        <td>${product.getSalePercent()}%</td>
                                        <td>
                                            <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#DiscountModal${i.count}">
                                                <i class="far fa-edit"></i>&nbsp;Edit
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                        <c:forEach items="${products}" var="product" varStatus="i">
                            <div class="modal fade" id="DiscountModal${i.count}" tabindex="-1" aria-labelledby="DiscountModal${i.count}" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Edit sale</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                  <form id="form${i.count}" class="form-floating" method="post" action="${pageContext.request.contextPath}/mkt/editsale" >
                                    <div class="modal-body">
                                          <div class="input-group">
                                            <input required  type="text" name="sale" class="form-control" id="sale${i.count}" value="${product.getSalePercent()}">
                                            <div class="input-group-text">%</div>
                                          </div>
                                          <input type="hidden" name="productID" value="${product.getProductID()}"/>
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                      <button type="button" class="btn btn-primary" onclick="myFunction(${i.count})">Save changes</button>
                                    </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </c:forEach> 
                    </div>
                    
                </div>

            </div>
         </div>                               
        <div class="overlay"></div>
        <!-- BOOTSTRAP5-->
        <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"
        ></script>
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Data Table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
        <script>
            function myFunction( a ) {
                let id = "sale"+a;
                // Get the value of the input field with id="numb"
                let x = document.getElementById(id).value;
                // If x is Not a Number or less than one or greater than 10
                let text;
                if (isNaN(x) || x < 0 || x > 100 || x == "" ) {
                  alert("Input not valid");
                } 
                else{
                    var form = document.getElementById("form"+a);
                    form.submit();
                }
              }
            window.onload= function() {formatCurrency();};
            window.onclick= function() {formatCurrency();};
            var formatter = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'VND',

                // These options are needed to round to whole numbers if that's what you want.
                //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
              });
            function formatCurrency() {

                var listCurrency = document.getElementsByClassName("currency");
                for(let i = 0; i < listCurrency.length; i++){
                    if(listCurrency[i].innerHTML[0]!="₫")
                        listCurrency[i].innerHTML=formatter.format(listCurrency[i].innerHTML);
                }

            }

        </script>
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
            $(document).ready( function () {
                $('#table_id').DataTable();
            } );
        </script>
        
        
        <script src="${pageContext.request.contextPath}/js/script1.js"></script>
        
    </body>
</html>
