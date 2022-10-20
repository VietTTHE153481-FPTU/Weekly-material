<%-- 
    Document   : finishedorder
    Created on : Oct 14, 2021, 8:11:47 PM
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <title>Thank You</title>
    <!-- CREDIT -->
    <!-- <a href='https://pngtree.com/so/thank'>thank png from pngtree.com/</a> -->
    <!-- CREDIT -->
  </head>

  <body>
    <%@include file="model/header.jsp" %>
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
                        <span class="fas fa-check"></span>
                    </div>
                </div>
                <div class="col-4 col-lg-2">
                    <div class="relative15px">
                        <strong>FINISH</strong> <br> 
                        <span class="fas fa-check"></span>
                    </div>
                </div>
            </div>
        <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
        </div>
    </section>
    <div class="content-width m-auto" style="width:100%;background-image: linear-gradient(45deg,rgba(165, 177, 194,0.8) 55%,rgba(165, 177, 194,0.9))">
        <div class="row justify-content-center p-0 p-lg-5 m-0">
            <div class=" mt-5 thankyou-div img-thumbnail"><img class=" mx-auto d-block thankyou" src="${pageContext.request.contextPath}/resources/img/thankyou.png"/></div>
            <div class="clearfix mb-5"></div>
            <a href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0" type="button" class="btn btn-light float-end me-2" style="width: 20%;max-width: 500px;min-width:200px ">Back to shop</a>   
        </div>
    </div> 
    <%@include file="model/footer.jsp" %>
    <!-- BOOTSTRAP5-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- SCRIPT -->
    <script src="${pageContext.request.contextPath}/js/script.js"></script>      
  </body>
</html>
