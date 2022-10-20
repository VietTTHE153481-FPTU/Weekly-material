<%-- 
    Document   : layout
    Created on : Oct 31, 2021, 10:47:44 AM
    Author     : Duy Manh
--%>

<%@page import="entity.ProductDetail"%>
<%@page import="DBContext.FeedbackDAO"%>
<%@page import="DBContext.UserDAO"%>
<%@page import="entity.Feedback"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Detail</title>    
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico" type="image/x-icon">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">-->
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">-->
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">-->
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">-->
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">-->
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">-->
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/vendor/MagnificPopup/magnific-popup.css">
        <!--===============================================================================================-->
        <!--        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">-->
        <!--===============================================================================================-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        <!--FONTAWESOME-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/queries.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">

        <!--===============================================================================================-->
    </head>
    <body class="animsition">
        <jsp:include page="model/header.jsp"/>
        <!-- ==================================HOME================================================ -->     
        <!-- ======================================= PRODUCT DETAIL ================================= -->

        <div class="container">
            <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
                <a href="product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0" class="stext-109 cl8 hov-cl1 trans-04">
                    Product
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <span class="stext-109 cl4">
                    ${detail.productName}
                </span>
            </div>
        </div><section class="sec-product-detail bg0 p-t-65 p-b-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-7 p-b-30">
                        <div class="p-l-25 p-r-30 p-lr-0-lg">
                            <div class="wrap-slick3 flex-sb flex-w">
                                <div class="wrap-slick3-dots"></div>
                                <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                                <div class="slick3 gallery-lb">

                                    <%
                                        ProductDetail pd = (ProductDetail) request.getAttribute("detail");
                                        List<String> images = (List<String>) request.getAttribute("images");
                                        for (int i = 0; i < images.size(); i++) {

                                    %>

                                    <div class="item-slick3" data-thumb="css/resources/img/<%=images.get(0)%>">
                                        <div class="wrap-pic-w pos-relative">
                                            <img src="css/resources/img/<%=images.get(i)%>" alt="IMG-PRODUCT">

                                            <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="">
                                                <i class="fa fa-expand"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <% } %>


                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-5 p-b-30">
                        <div class="p-r-50 p-t-5 p-lr-0-lg">
                            <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                                ${detail.productName}
                            </h4>

                            <span class="currency price-hp" id="pPrice">
                                ${detail.originPrice}
                            </span>

                            <p class="stext-102 cl3 p-t-23">
                                ${detail.desc}
                            </p>

                            <!--  -->
                            <div class="p-t-33">                               
                                <div class="flex-w flex-r-m p-b-10">
                                    <div class="size-204 flex-w flex-m respon6-next">
                                        <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1" max="${detail.amount}">

                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>

                                        </div>                                          
                                        <a href="user/addtocart?id=${detail.productID}" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                            Add to cart
                                        </a>
                                       
                                    </div>                                           

                                </div>	
                            </div>

                                        <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 "> <a href="Chat?friendId=${detail.sellerID}" style="color: white" >
                                           Chat with seller
                                            </a></button>

                        </div>
                    </div>
                </div>

                <div class="bor10 m-t-50 p-t-43 p-b-40">
                    <!-- Tab01 -->
                    <div class="tab01">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">

                            <li class="nav-item p-b-10">
                                <a class="nav-link" data-toggle="tab" href="#reviews" role="tab" style="font-size: 30px;">Feedback</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content p-t-43">

                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                <div class="row">
                                    <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                                        <div class="p-b-30 m-lr-15-sm">
                                            <%
                                                List<Feedback> fb = (List<Feedback>) request.getAttribute("feedbacks");
                                                FeedbackDAO fdb = new FeedbackDAO();
                                                for (int i = 0; i < fb.size(); i++) {
                                                    Feedback f = fb.get(i);
                                            %>

                                            <!-- Review -->
                                            <div class="flex-w flex-t p-b-68">
                                                <div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
                                                    <img src="css/resources/img/avatar.jpg" alt="AVATAR">
                                                </div>

                                                <div class="size-207">
                                                    <div class="flex-w flex-sb-m p-b-17">
                                                        <span class="mtext-107 cl2 p-r-20">
                                                            <%=fdb.getFeedbacksByProductId(f.getId())%>
                                                        </span>

                                                        <span class="fs-18 cl11">
                                                            <%
                                                                for (int j = 0; j < f.getStar(); j++) {
                                                            %>
                                                            <i class="zmdi zmdi-star"></i>

                                                            <% }
                                                            %>
                                                        </span>
                                                    </div>

                                                    <p class="stext-102 cl6">
                                                        <%=f.getFeedbackDetail()%>
                                                    </p>
                                                </div>
                                            </div>

                                            <% }
                                            %>
                                            <!-- Review -->
                                            <form class="w-full">
                                                <h5 class="mtext-108 cl2 p-b-7">
                                                    Add a feedback
                                                </h5>

                                                <p class="stext-102 cl6">
                                                    Your email address will not be published. Required fields are marked *
                                                </p>

                                                <div class="flex-w flex-m p-t-50 p-b-23">
                                                    <span class="stext-102 cl3 m-r-16">
                                                        Your Rating
                                                    </span>

                                                    <span class="wrap-rating fs-18 cl11 pointer">
                                                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                                                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                                                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                                                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                                                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                                                        <input class="dis-none" type="number" name="rating">
                                                    </span>
                                                </div>

                                                <div class="row p-b-25">
                                                    <div class="col-12 p-b-5">
                                                        <label class="stext-102 cl3" for="review">Your review</label>
                                                        <textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
                                                    </div>

                                                    <div class="col-sm-6 p-b-5">
                                                        <label class="stext-102 cl3" for="name">Name</label>
                                                        <input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
                                                    </div>

                                                    <div class="col-sm-6 p-b-5">
                                                        <label class="stext-102 cl3" for="email">Email</label>
                                                        <input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
                                                    </div>
                                                </div>

                                                <button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
                                                    Submit
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!--===============================================================================================-->
            <script src="css/vendor/jquery/jquery-3.2.1.min.js"></script>
            <!--===============================================================================================-->
            <script src="css/vendor/animsition/js/animsition.min.js"></script>
            <!--===============================================================================================-->
            <script src="css/vendor/bootstrap/js/popper.js"></script>
            <script src="css/vendor/bootstrap/js/bootstrap.min.js"></script>
            <!--===============================================================================================-->
            <!--            <script src="vendor/select2/select2.min.js"></script>
                        <script>
                            $(".js-select2").each(function () {
                                $(this).select2({
                                    minimumResultsForSearch: 20,
                                    dropdownParent: $(this).next('.dropDownSelect2')
                                });
                            })
                        </script>-->
            <!--===============================================================================================-->
            <!--            <script src="vendor/daterangepicker/moment.min.js"></script>-->
            <!--            <script src="vendor/daterangepicker/daterangepicker.js"></script>-->
            <!--===============================================================================================-->
            <script src="css/vendor/slick/slick.min.js"></script>
            <script src="css/js/slick-custom.js"></script>
            <!--===============================================================================================-->
            <!--            <script src="vendor/parallax100/parallax100.js"></script>
                        <script>
                            $('.parallax100').parallax100();
                        </script>-->
            <!--===============================================================================================-->
            <script src="css/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
            <script>
                $('.gallery-lb').each(function () { // the containers for all your galleries
                    $(this).magnificPopup({
                        delegate: 'a', // the selector for gallery item
                        type: 'image',
                        gallery: {
                            enabled: true
                        },
                        mainClass: 'mfp-fade'
                    });
                });
            </script>
            <!--===============================================================================================-->
            <!--            <script src="vendor/isotope/isotope.pkgd.min.js"></script>-->
            <!--===============================================================================================-->
            <script src="css/vendor/sweetalert/sweetalert.min.js"></script>
            <script>
                $('.js-addwish-b2').on('click', function (e) {
                    e.preventDefault();
                });

                $('.js-addwish-b2').each(function () {
                    var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
                    $(this).on('click', function () {
                        swal(nameProduct, "is added to wishlist !", "success");

                        $(this).addClass('js-addedwish-b2');
                        $(this).off('click');
                    });
                });

                $('.js-addwish-detail').each(function () {
                    var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

                    $(this).on('click', function () {
                        swal(nameProduct, "is added to wishlist !", "success");

                        $(this).addClass('js-addedwish-detail');
                        $(this).off('click');
                    });
                });

                /*---------------------------------------------*/

                $('.js-addcart-detail').each(function () {
                    var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
                    $(this).on('click', function () {
                        swal(nameProduct, "is added to cart !", "success");
                    });
                });
            </script>
            <script type="text/javascript">
                
                var a = document.getElementById("pPrice").innerHTML;
                a = a.replace('.','');
                a = a.replace(new RegExp("^(\\d{" + (a.length % 3 ? a.length % 3 : 0) + "})(\\d{2})", "g"), "$1 $2").replace(/(\d{3})+?/gi, "$1,").trim();
                document.getElementById("pPrice").innerHTML = "₫" + a;
            </script>
            <!--===============================================================================================-->
            <!--            <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                        <script>
                            $('.js-pscroll').each(function () {
                                $(this).css('position', 'relative');
                                $(this).css('overflow', 'hidden');
                                var ps = new PerfectScrollbar(this, {
                                    wheelSpeed: 1,
                                    scrollingThreshold: 1000,
                                    wheelPropagation: false,
                                });
            
                                $(window).on('resize', function () {
                                    ps.update();
                                })
                            });
                        </script>-->
            <!--===============================================================================================-->
            <script src="css/js/main.js"></script>            

            <jsp:include page="model/footer.jsp"/>
    </body>

</html>
