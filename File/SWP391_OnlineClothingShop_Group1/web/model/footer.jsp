<%-- 
    Document   : footer
    Created on : Sep 27, 2021, 1:36:14 PM
    Author     : SAKURA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- FOOTER --%>
<footer class="text-white text-center text-lg-start" style="background-color: #23242a;" id="footer">
    <!-- Grid container -->
    <div class="container p-4">
        <!--Grid row-->
        <div class="row mt-4">
            <!--Grid column-->
            <div class="col-lg-4 col-md-12 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4"><i class="fas fa-tshirt"></i>&nbsp;About shop</h5>

                <p>
                    Our purpose at Shope is to empower people to lead bold and full lives. 
                </p>

                <p>
                    We believe that if you look good, you feel good. And when you feel good you can do good for others around you. Shope brings you a wide range of trendy shoes, beautiful scarves, and statement-making jewelry, all at affordable prices to make them accessible to you. 
                </p>

                <div class="my-4">
                    <!-- Facebook -->
                    <a type="button" class="btn btn-floating btn-warning btn-lg"><i class="fab fa-facebook-f"></i></a>
                    <!-- Dribbble -->
                    <a type="button" class="btn btn-floating btn-warning btn-lg"><i class="fab fa-instagram"></i></a>
                    <!-- Twitter -->
                    <a type="button" class="btn btn-floating btn-warning btn-lg"><i class="fab fa-twitter"></i></a>
                    <!-- Google + -->
                    <a type="button" class="btn btn-floating btn-warning btn-lg"><i class="fab fa-google"></i></a>
                    <!-- Linkedin -->
                </div>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4 pb-1"><i class="fas fa-search"></i>&nbsp;Search product</h5>
                <form method="get" action="${pageContext.request.contextPath}/product">
                    <div class="form-floating mb-4">
                        <input type="hidden" name="page" value="1"/>
                        <input type="search" name="query" id="searchbarFooter" class="form-control" placeholder="Search Something">
                        <input type="hidden" name="subcategory" value="0"/>
                        <input type="hidden" name="brand" value="0"/>
                        <input type="hidden" name="price" value="0"/>
                        <input type="hidden" name="sortType" value="0"/>
                        <input type="hidden" name="sortMode" value="0"/>
                        <label for="searchbarFooter" style="color:black;">Search</label>
                        <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 48.8px;"></div><div class="form-notch-trailing"></div></div></div>
                </form>
                <ul class="fa-ul" style="margin-left: 1.65em;">
                    <li class="mb-3">
                        <span class="fa-li"><i class="fas fa-home"></i></span><span class="ms-2">Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</span>
                    </li>
                    <li class="mb-3">
                        <span class="fa-li"><i class="fas fa-envelope"></i></span><span class="ms-2">shope@gmail.com</span>
                    </li>
                    <li class="mb-3">
                        <span class="fa-li"><i class="fas fa-phone"></i></span><span class="ms-2">+84 123456789</span>
                    </li>
                    <li class="mb-3">
                        <span class="fa-li"><i class="fas fa-print"></i></span><span class="ms-2">+84 123456789</span>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4"><i class="far fa-clock"></i>&nbsp;Opening hours</h5>

                <table class="table text-center text-white">
                    <tbody class="font-weight-normal">
                        <tr>
                            <td>Mon - Thu:</td>
                            <td>8am - 9pm</td>
                        </tr>
                        <tr>
                            <td>Fri - Sat:</td>
                            <td>8am - 12pm</td>
                        </tr>
                        <tr>
                            <td>Sunday:</td>
                            <td>9am - 10pm</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2021 Copyright:
        <a class="text-white" href="#">SWP391 - GRP1</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- End of .container -->
<%-- FOOTER --%>