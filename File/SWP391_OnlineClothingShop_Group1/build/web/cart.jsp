<%-- 
    Document   : cart
    Created on : Oct 14, 2021, 7:41:44 PM
    Author     : SAKURA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1" />
    <!-- icon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico" type="image/x-icon">
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
      rel="stylesheet"
    />
	  <!--BOOTSTRAP5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!--FONTAWESOME-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/queries.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartqueries.css">
    <title>Cart</title>
  </head>

  <body>
    <%@include file="/model/header.jsp" %>
    <!-- PROGRESS -->
    <section id="progress" style="background-color: whitesmoke;">
            <div class="row container-fluid justify-content-center text-center align-content-center m-0 p-0" style="height: 50px;">
                <div class="col-4 col-lg-2 ">
                    <div class="relative15px">
                        <strong>CART</strong> <br>
                        <span class="fas fa-check"></span>
                    </div>
                </div>
                <div class="col-4 col-lg-2">
                    <div class="relative15px">
                        <strong>CHECKOUT</strong> <br>
                    </div>
                </div>
                <div class="col-4 col-lg-2">
                    <div class="relative15px">
                        <strong>FINISH</strong> <br> 
                    </div>
                </div>
            </div>
        <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
    </section>
    <div class="content-width m-auto">
        <table class="table table-light">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col" colspan="2">Item</th>
                <th scope="col">Amount</th>
                <th scope="col">Price</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${carts}" var="cart" varStatus="i">
              <tr>
                <th scope="row">${i.count}</th>
                <td class="p-0 p-sm-3"><img class="d-none d-sm-block img-thumbnail img-fluid" style="max-width: 100px" src="${pageContext.request.contextPath}/resources/img/products/${cart.getProductImg()}"></td>
                <td>${cart.getProductName()}</td>
                <td>
                    <div class="btn-group flex-wrap">
                        <span class="btn btn-light">${cart.getAmount()}</span>
                        <a href="${pageContext.request.contextPath}/user/pluscart?productID=${cart.getProductID()}" class="btn btn-success"><i class="fas fa-plus"></i></a>
                        <a href="${pageContext.request.contextPath}/user/minuscart?productID=${cart.getProductID()}" class="btn btn-warning"><i class="fas fa-minus"></i></a>
                        <a href="${pageContext.request.contextPath}/user/deletecart?productID=${cart.getProductID()}" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                    </div>
                </td>
                <td class="currency">${cart.getAmount()*cart.getSellPrice()}</td>
              </tr>
              </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th scope="row" colspan="4">Total</th>
                    <td class="currency">${totalPrice}</td>
                  </tr>
            </tfoot>
          </table>
        <form method="post" action="${pageContext.request.contextPath}/user/checkout"> 
            <div class="row container-fluid justify-content-center p-0 p-lg-5 m-0">
                <div class="col-12 col-lg-6 bg-white p-5">
                    <h6 class="display-6 mb-3">Shipping information</h6>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="inputName" class="form-label">Name</label>
                            <input type="text" class="form-control" name="inputName" id="inputName" value="${ua.getShipName()}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="inputPhone" class="form-label">Phone</label>
                            <input type="tel" class="form-control" name="inputPhone" id="inputPhone" value="${ua.getPhoneNum()}" required>
                        </div>
                        <div class="col-md-8">
                            <label for="inputAddress" class="form-label">Address</label>
                            <input type="text" class="form-control" name="inputAddress" id="inputAddress" value="${ua.getShipAddress()}" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-4">
                            <label for="inputCity" class="form-label">City</label>
                            <select id="inputCity" name="inputCity" class="form-select" required>
                                <option value="" disabled selected>Choose a city</option>
                                <c:forEach items="${ships}" var="ship">
                                    <option value="${ship.getId()}" ${ship.getId()==ua.getShipCityID()?'selected':''}>${ship.getCityName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="inputNote" class="form-label">Note</label>
                            <input type="text" name="inputNote" class="form-control" id="inputNote">
                        </div>
                    </div>
                </div>
                <div class="col-12 offset-lg-1 col-lg-3 p-0 mt-5 mt-lg-0">
                    <table class="table-light table">
                        <thead>
                            <tr>
                                <th scope="col">Bill</th>
                                <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Product</td>
                                <td class="currency">${totalPrice}</td>
                            </tr>
                            <tr>
                                <td>Shipping fees</td>
                                <td id="sF">₫NaN</td>
                            </tr>
                            <tr>
                                <td>Sale</td>
                                <td>₫0</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th scope="row">Total</th>
                                <td id="tP">₫NaN</td>
                            </tr>
                        </tfoot>
                    </table>      
                    <button type="submit" class="btn btn-success ms-2 mb-2 float-end ${cartAmount==0?'disabled':''}">Checkout</button>
                    <a href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0" type="button" class="btn btn-light float-end ms-2 mb-2">Back to shop</a>
                    <button data-bs-toggle="modal" data-bs-target="#deleteModal" type="button" class="btn btn-danger float-end ${cartAmount==0?'disabled':''}">Delete Cart</button>
                </div>       
            </div>
        </form>
    </div> 
     <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete cart</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure want to remove all items from cart?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="${pageContext.request.contextPath}/user/removecart" type="button" class="btn btn-danger">Delete</a>
      </div>
    </div>
  </div>
</div>          
    <%@include file="model/footer.jsp" %>
    <!-- BOOTSTRAP5-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- SCRIPT -->
    <script src="${pageContext.request.contextPath}/js/script.js"></script>  
    <script>
        //window.onscroll = function() {updateShipPrice();};
        window.onclick= function() {updateShipPrice();};
        window.onload= function() {updateShipPrice();formatCurrency();};
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
                listCurrency[i].innerHTML=formatter.format(listCurrency[i].innerHTML);
            }
            
        }
        var shipPrice=[23<c:forEach items="${ships}" var="ship">,${ship.getShipPrice()}</c:forEach>];
        var totalPrice=${totalPrice};
        function updateShipPrice() {
                var inputCity=document.getElementById("inputCity");
                var tP=document.getElementById("tP");
                var sF=document.getElementById("sF");
                if(inputCity.value===""){
                    tP.innerHTML= "NaNđ";
                    sF.innerHTML= "NaNđ";
                }
                else{
                    tP.innerHTML= formatter.format(shipPrice[inputCity.value]+totalPrice );
                    sF.innerHTML= formatter.format(shipPrice[inputCity.value]);
                }
          }
        
    </script>
  </body>
</html>
