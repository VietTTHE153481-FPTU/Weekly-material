<%-- 
    Document   : navbar
    Created on : Sep 27, 2021, 1:34:43 PM
    Author     : SAKURA
--%>
<%@page import="entity.Notification"%>
<%@page import="DBContext.NotificationDAO"%>
<%@page import="DBContext.CartDAO"%>
<%@page import="entity.Users"%>
<%@page import="entity.SubCategory"%>
<%@page import="DBContext.SubCategoryDAO"%>
<%@page import="entity.Category"%>
<%@page import="entity.Brand"%>
<%@page import="DBContext.BrandDAO"%>
<%@page import="java.util.List"%>
<%@page import="DBContext.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<%
    CategoryDAO cdao = new CategoryDAO();
    List<Category> categorys = cdao.getAllCategory();
    pageContext.setAttribute("categorys", categorys);
    BrandDAO bdao = new BrandDAO();
    List<Brand> brands = bdao.getAllBrand();
    pageContext.setAttribute("brands", brands);
    SubCategoryDAO scdao = new SubCategoryDAO();
    List<SubCategory> subcategorys = scdao.getAllSubCategory();
    pageContext.setAttribute("subcategorys", subcategorys);
    Users user = (Users) session.getAttribute("user");
    if (user != null) {
        CartDAO ctdao = new CartDAO();
        pageContext.setAttribute("cartAmount", ctdao.getCartAmount(user.getUserID()));
        NotificationDAO ndao = new NotificationDAO();
        int unreadnoti = 0;
        List<Notification> notifications = ndao.getAllNotification(user.getUserID());
        for (Notification notification : notifications) {
            if (notification.getStatus() == 0) {
                unreadnoti++;
            }
        }
        pageContext.setAttribute("notifications", notifications);
        pageContext.setAttribute("unreadnoti", unreadnoti);
    }
%>
<div class="row m-0 p-0" style="background-color:lightgrey;">
    <span id="promo" class="d-lg-block d-none">
        <marquee behavior="scroll" direction="left">Get 10% SALE by using special discount code "CHEERSLUV"</marquee>
    </span>
</div>
<nav class="navbar main-navbar navbar-expand-lg navbar-light bg-light pt-0" id="navbar1">

    <div class="container-fluid bg-light">
        <!-- LOGO -->
        <a class="navbar-brand col-lg-2 offset-lg-2 logo" href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/img/SHOPE-logos_transparent.png"> </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- SEARCHBAR -->
            <form class="d-flex searchbar" method="get" action="${pageContext.request.contextPath}/product">
                <input type="hidden" name="page" value="1"/>
                <input name="query" class="form-control me-2" type="search" placeholder="Search entire store here..." aria-label="Search">
                <input type="hidden" name="subcategory" value="0"/>
                <input type="hidden" name="brand" value="0"/>
                <input type="hidden" name="price" value="0"/>
                <input type="hidden" name="sortType" value="0"/>
                <input type="hidden" name="sortMode" value="0"/>
                <button class="btn btn-danger" type="submit"><i class="fas fa-search" style="font-size: 100%;"></i></button>
            </form>
            <ul class="navbar-nav me-auto ms-auto">                
                <!-- EXPANDED -->
                <li class="nav-item d-none d-lg-block">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Chat">
                        <i class="fas fa-comment"></i>                    
                    </a>
                </li>
                <li class="nav-item d-none d-lg-block">
                    <a class="nav-link" role="button" data-bs-toggle="offcanvas" data-bs-target="#notification" aria-controls="offcanvasRight"><i class="fas fa-bell"></i>
                        <c:if test="${sessionScope.user !=null}">
                            <span class="position-relative translate-middle badge rounded-pill bg-danger">
                                ${unreadnoti}
                                <span class="visually-hidden">unread notifications</span>
                            </span>
                        </c:if>
                    </a>                   
                </li>
                <li class="nav-item d-none d-lg-block">
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/cart">
                        <i class="fas fa-shopping-cart"></i>
                        <c:if test="${sessionScope.user !=null}">
                            <span class="position-relative translate-middle badge rounded-pill bg-danger">
                                ${cartAmount}
                                <span class="visually-hidden">cart items</span>
                            </span>
                        </c:if>
                    </a>
                </li>
                <li class="nav-item dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle"></i>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:if test ="${sessionScope.user !=  null}">
                            <!-- Default -->
                            <li><span class="dropdown-item-text">Hello ${user.getUserName()}</span></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ProfileControl">View profile</a></li>  
                            <!-- Admin -->
                            <c:if test="${sessionScope.user.roleID ==  1}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AccountManagerControl">Manage Users</a></li>
                                </c:if>
                            <!-- Seller -->
                            <c:if test="${sessionScope.user.roleID ==  2}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Dashboard">DashBoard</a></li>
                                </c:if>
                            <!-- Marketing -->
                            <c:if test="${sessionScope.user.roleID ==  4}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mkt/dashboard">Dashboard</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user.roleID ==  5}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/DeliveryDashboard">Delivery Dashboard</a></li>
                                </c:if>
                            <!-- Default Logout -->
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                            </c:if>
                        <!-- Neu khong co user -->
                        <c:if test ="${sessionScope.user ==  null}">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Login/Register</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AboutShope.jsp">About SHOPE</a></li>
                            </c:if>
                    </ul>
                </li>
                <!-- COLLAPSED -->
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
                </li>
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0">Product</a>
                </li>
                <li class="nav-item dropdown d-block d-lg-none">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Category
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach items="${categorys}" var="icategory">
                            <li><h6 class="dropdown-header">${icategory.getCategoryName()}</h6></li>
                                <c:forEach items="${subcategorys}" var="isubcategory">
                                    <c:if test="${isubcategory.getCateID()==icategory.getCategoryID()}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=${isubcategory.getSubCateID()}&brand=0&price=0&sortType=0&sortMode=0">${isubcategory.getSubCateName()}</a></li>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                    </ul>
                </li>
                <li class="nav-item dropdown d-block d-lg-none">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Brand
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach items="${brands}" var="ibrand">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=${ibrand.getBrandID()}&price=0&sortType=0&sortMode=0">${ibrand.getBrandName()}</a></li>
                            </c:forEach>
                    </ul>
                </li>
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/PostControl">Post</a>
                </li>
                <li class="nav-item dropdown d-block d-lg-none">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Blog
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/BlogList">All blog</a></li>                        
                    </ul>
                </li>
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link" href="#footer">Contacts Us</a>
                </li>
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link d-inline-block" role="button" data-bs-toggle="offcanvas" data-bs-target="#notification" aria-controls="offcanvasRight"><i class="fas fa-bell"></i>
                        <c:if test="${sessionScope.user !=null}">
                            <span class="position-relative translate-middle badge rounded-pill bg-danger">
                                ${unreadnoti}
                                <span class="visually-hidden">unread notifications</span>
                            </span>
                        </c:if>
                    </a>
                    <a class="nav-link d-inline-block" href="${pageContext.request.contextPath}/user/cart">
                        <i class="fas fa-shopping-cart"></i>
                        <c:if test="${sessionScope.user !=null}">
                            <span class="position-relative translate-middle badge rounded-pill bg-danger">
                                0
                                <span class="visually-hidden">cart items</span>
                            </span>
                        </c:if>
                    </a>
                    <i class="fas fa-user-circle" style="color:grey;"></i>
                </li>
                <c:if test ="${sessionScope.user !=  null}">
                    <li class="nav-item d-block d-lg-none">Hello ${user.getUserName()}</li>
                    <li class="nav-item d-block d-lg-none"><a class="nav-link" href="${pageContext.request.contextPath}/ProfileControl">View profile</a></li>  
                    <!-- Admin -->
                    <c:if test="${sessionScope.user.roleID ==  1}">
                        <li class="nav-item d-block d-lg-none"><a class="nav-link" href="${pageContext.request.contextPath}/AccountManagerControl">Manage Users</a></li>
                        </c:if>
                    <!-- Seller -->
                    <c:if test="${sessionScope.user.roleID ==  2}">
                        <li class="nav-item d-block d-lg-none"><a class="nav-link" href="${pageContext.request.contextPath}/Dashboard">DashBoard</a></li>
                        </c:if>
                    <!-- Marketing -->
                    <c:if test="${sessionScope.user.roleID ==  4}">
                        <li class="nav-item d-block d-lg-none"><a class="nav-link" href="${pageContext.request.contextPath}/mkt/dashboard">Manage Banner</a></li>
                        </c:if>
                        <c:if test="${sessionScope.user.roleID ==  5}">
                        <li class="nav-item d-block d-lg-none"><a class="nav-link" href="${pageContext.request.contextPath}/DeliveryDashboard">Delivery Dashboard</a></li>
                        </c:if>
                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                </c:if>
                <c:if test ="${sessionScope.user ==  null}">
                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Login/Register</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<!-- SECONDARY NAVBAR -->
<nav id="navbar2" class="navbar navbar-expand-lg navbar-dark bg-dark d-none d-lg-block p-1">
    <div class="container-fluid">
        <ul class="navbar-nav offset-2 me-auto mb-2 mb-lg-0">
            <li class="nav-item me-4">
                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
            </li>

            <li class="nav-item me-4">
                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0">Product</a>
            </li>
            <li class="nav-item dropdown me-4">
                <a class="nav-link dropdown-toggle d-inline-block" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Category
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach items="${categorys}" var="icategory">
                        <li><h6 class="dropdown-header">${icategory.getCategoryName()}</h6></li>
                            <c:forEach items="${subcategorys}" var="isubcategory">
                                <c:if test="${isubcategory.getCateID()==icategory.getCategoryID()}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=${isubcategory.getSubCateID()}&brand=0&price=0&sortType=0&sortMode=0">${isubcategory.getSubCateName()}</a></li>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                </ul>
            </li>
            <li class="nav-item dropdown me-4">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Brand
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach items="${brands}" var="ibrand">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=${ibrand.getBrandID()}&price=0&sortType=0&sortMode=0">${ibrand.getBrandName()}</a></li>
                        </c:forEach>
                </ul>
            </li>
            <li class="nav-item me-4">
                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/PostControl">Post</a>
            </li>
            <li class="nav-item dropdown me-4">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Blog
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/BlogList">All blog</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Spotlight</a></li>
                    <li><a class="dropdown-item" href="#">Spotlight</a></li>
                </ul>
            </li>
            <li class="nav-item me-4">
                <a class="nav-link" href="#footer">Contacts Us</a>
            </li>
        </ul>
    </div>
</nav>
<%-- NAV --%>
<%-- NOTIFICATION --%>


<div class="offcanvas offcanvas-end sticky-notification" data-bs-scroll="true" tabindex="-1" id="notification" aria-labelledby="notification">
    <div class="offcanvas-header">
        <h5 id="notificationLabel">Notification</h5><a href="${pageContext.request.contextPath}/user/readall" class="btn btn-info text-white <c:if test="${user==null}">disabled</c:if>">Read All</a>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body overflow-hidden">
        <%-- BODY --%>
        <c:if test="${user!=null}">
            <c:forEach items="${notifications}" var="notification">
                <div class="card text-dark border-info shadow mb-3" style="max-width: 540px;font-size: 12px">
                    <div class="card-body">
                        <h6 class="card-title"><i class="far fa-envelope me-1"></i>Shope</h6>
                        <p class="card-text">${notification.getContent()}</p>  
                    </div>
                    <div class="card-footer">
                        <small class="text-muted"><c:out value="${notification.getTime()}" /><c:if test="${notification.getStatus()==0}"> / <a href="${pageContext.request.contextPath}/user/markasread?notiID=${notification.getId()}">Mark as read</a></c:if></small> 
                        </div>
                    <c:if test="${notification.getStatus()==0}">
                        <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                            <span class="visually-hidden">New alerts</span>
                        </span>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${user==null}">
            <div class="card text-dark bg-info shadow mb-3" style="max-width: 540px;font-size: 12px">
                <div class="card-body">
                    <h6 class="card-title"><i class="fas fa-shopping-bag me-1"></i>Welcome to Shope</h6>
                    <p class="card-text">Join us to start receiving notification about your order, comment, promos, and more</p>  
                </div>
                <div class="card-footer">
                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/login"><small class="text-white">Login/Register</small></a>
                </div>
            </div>
        </c:if>
        <%-- BODY --%>
    </div>
</div>
<%-- Top Btn --%>
<button onclick="topFunction()" id="myTBTN" title="Go to top"><i class="fas fa-arrow-up"></i></button>