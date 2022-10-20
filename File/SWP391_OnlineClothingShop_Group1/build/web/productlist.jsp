<%-- 
    Document   : productlist
    Created on : Oct 9, 2021, 5:09:16 PM
    Author     : SAKURA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
        <title>Product</title>
        <!-- Icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productlist.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productlistqueries.css">
        <!-- Sakura -->
        <link href="${pageContext.request.contextPath}/css/jquery-sakura.css" rel="stylesheet" type="text/css">
    </head>
    <body style="font-family: 'Poppins',sans-serif; overflow-x: hidden;">
        <%@include file="model/header.jsp" %>
        <div class="container-fluid bg-transparent p-3 content-width mh-1000" style="position: relative;">
            <div class="row">
                <c:if test="${banner!=null}">
                    <img class="img-fluid img-thumbnail m-3 p-1"  src="${pageContext.request.contextPath}/resources/img/banner/${banner.getImg()}"/>
                </c:if>
                <!-- FILTER -->
                <div class="col-12 col-lg-3 float-start">
                    <form method="GET" action="${pageContext.request.contextPath}/product">
                        <input value="1" type="hidden" name="page">
                        <div class="form-floating mb-2">
                            <input type="text" id="searchbarProduct" class="form-control" placeholder="Search Something" name="query" value="${query.replace('+', ' ')}">
                            <label for="searchbarProduct" style="color:black;">Product name</label>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <!-- CATEGORY -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                        Category
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                    <div class="accordion-body">
                                        <ul class="list-group-flush">
                                            <li class="list-group-item ps-4">
                                                <input class="form-check-input" type="radio" name="subcategory" id="subcategory0" value="0" ${subcategory==0?'checked':''}>
                                                <label class="form-check-label" for="subcategory0">
                                                    All category 
                                                </label>
                                            </li>
                                            <c:forEach items="${categorys}" var="icategory">
                                                <li class="list-group-item"><strong>${icategory.getCategoryName()}</strong></li>
                                                        <c:forEach items="${subcategorys}" var="isubcategory">
                                                            <c:if test="${isubcategory.getCateID()==icategory.getCategoryID()}">
                                                        <li class="list-group-item ps-4">
                                                            <input class="form-check-input" type="radio" name="subcategory" id="subcategory${isubcategory.getSubCateID()}" value="${isubcategory.getSubCateID()}" ${subcategory==isubcategory.getSubCateID()?'checked':''}>
                                                            <label class="form-check-label" for="subcategory${isubcategory.getSubCateID()}">
                                                                ${isubcategory.getSubCateName()} 
                                                            </label>
                                                            <div class="float-end">
                                                                <span class="badge rounded-pill bg-secondary">
                                                                    ${subCategoryCount.get(isubcategory.getSubCateID())==null?0:subCategoryCount.get(isubcategory.getSubCateID())}
                                                                </span>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- CATEGORY -->
                            <!-- BRAND -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                        Brand
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                    <div class="accordion-body">
                                        <ul class="list-group-flush">
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="brand" id="brand0" value="0" ${brand==0?'checked':''}>
                                                <label class="form-check-label" for="brand0">
                                                    All brand
                                                </label>
                                            </li>
                                            <c:forEach items="${brands}" var="ibrand">
                                                <li class="list-group-item">
                                                    <input class="form-check-input" type="radio" name="brand" id="brand${ibrand.getBrandID()}" value="${ibrand.getBrandID()}" ${brand==ibrand.getBrandID()?'checked':''}>
                                                    <label class="form-check-label" for="brand${ibrand.getBrandID()}">
                                                        ${ibrand.getBrandName()}
                                                    </label>
                                                    <div class="float-end">
                                                        <span class="badge rounded-pill bg-secondary">
                                                            ${brandCount.get(ibrand.getBrandID())==null?0:brandCount.get(ibrand.getBrandID())}
                                                        </span>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>  
                                    </div>
                                </div>
                            </div>
                            <!-- BRAND -->
                            <!-- PRICE -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                        Price
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                    <div class="accordion-body">
                                        <ul class="list-group-flush">
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" id="price0" value="0" ${price==0?'checked':''}>
                                                <label class="form-check-label" for="price0">
                                                    All price range
                                                </label>
                                            </li>
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" value="1" id="price1" ${price==1?'checked':''}>
                                                <label class="form-check-label" for="price1">
                                                    0đ-100.000đ
                                                </label>
                                            </li>
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" value="2" id="price2" ${price==2?'checked':''}>
                                                <label class="form-check-label" for="price2">
                                                    100.000đ-500.000đ
                                                </label>
                                            </li>
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" value="3" id="price3" ${price==3?'checked':''}>
                                                <label class="form-check-label" for="price3">
                                                    500.000đ-1.000.000đ
                                                </label>
                                            </li>
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" value="4" id="price4" ${price==4?'checked':''}>
                                                <label class="form-check-label" for="price4">
                                                    1.000.000đ-5.000.000đ
                                                </label>
                                            </li>
                                            <li class="list-group-item">
                                                <input class="form-check-input" type="radio" name="price" value="5" id="price5" ${price==5?'checked':''}>
                                                <label class="form-check-label" for="price5">
                                                    >5.000.000đ
                                                </label>
                                            </li>
                                        </ul>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PRICE -->
                        <!-- SUBMIT PARA -->
                        <input value="0" type="hidden" name="sortType">
                        <input value="0" type="hidden" name="sortMode">
                        <div class="d-grid gap-2 my-2">
                            <input class="btn btn-primary-custom" type="submit" value="Find product"/>
                        </div>
                        <!-- SUBMIT PARA -->
                    </form>
                </div>
                <!-- FILTER -->
                <!-- PRODUCT LIST -->
                <div class="col-12 col-lg-9 float-end">
                    <!-- SORT BUTTON -->
                    <div class="btn-group flex-wrap pb-3" role="group" aria-label="Basic example">
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" class="btn btn-outline-light dropdown-toggle ${sortType==1?'active':''}" data-bs-toggle="dropdown" aria-expanded="false">
                                Sort by price
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==1&&sortMode==1?'0':'1'}&sortMode=${sortType==1&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==1&&sortMode==1?'<i class="fas fa-check"></i>':''}</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==1&&sortMode==2?'0':'1'}&sortMode=${sortType==1&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==1&&sortMode==2?'<i class="fas fa-check"></i>':''}</a></li>
                            </ul>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" class="btn btn-outline-light dropdown-toggle ${sortType==2?'active':''}" data-bs-toggle="dropdown" aria-expanded="false">
                                Sort by sale
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==2&&sortMode==1?'0':'2'}&sortMode=${sortType==2&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==2&&sortMode==1?'<i class="fas fa-check"></i>':''}</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==2&&sortMode==2?'0':'2'}&sortMode=${sortType==2&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==2&&sortMode==2?'<i class="fas fa-check"></i>':''}</a></li>
                            </ul>
                        </div>
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" class="btn btn-outline-light dropdown-toggle ${sortType==3?'active':''}" data-bs-toggle="dropdown" aria-expanded="false">
                                Sort by name
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==3&&sortMode==1?'0':'3'}&sortMode=${sortType==3&&sortMode==1?'0':'1'}">Ascend&nbsp;${sortType==3&&sortMode==1?'<i class="fas fa-check"></i>':''}</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?page=1&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType==3&&sortMode==2?'0':'3'}&sortMode=${sortType==3&&sortMode==2?'0':'2'}">Descend&nbsp;${sortType==3&&sortMode==2?'<i class="fas fa-check"></i>':''}</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- SORT BUTTON -->
                    <!-- PRODUCT GRID -->
                    <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-3 g-3">
                        <c:forEach items="${products}" var="iproduct">
                            <div class="col" >
                                <div class="card card-custom h-100 shadow-sm"> <a href="detail?pid=${iproduct.getProductID()}"><img src="${pageContext.request.contextPath}/resources/img/products/${iproduct.getUrl()}" class="card-img-top" alt="..."></a>
                                        <c:if test="${iproduct.getSalePercent()>0}">
                                        <div class="label-top shadow-sm">-${iproduct.getSalePercent()}%</div>
                                    </c:if>
                                    <div class="card-body">
                                        <div class="clearfix mb-3"> 

                                            <span class="currency float-end price-hp">${iproduct.getSellPrice()}</span> </div>
                                        <h5 class="card-title">${iproduct.getProductName()}</h5>
                                        <p class="card-text overflow-auto" style="height: 100px;text-overflow: ellipsis;">${iproduct.getDesc()}</p>
                                        <div class="text-center my-4"> <a href="detail?pid=${iproduct.getProductID()}" class="btn-custom btn-warning-custom">Check offer</a> </div>
                                        <!-- <div class="clearfix mb-1"> <span class="float-start"><i class="far fa-question-circle"></i></span> <span class="float-end"><i class="fas fa-plus"></i></span> </div> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>   
                    </div>
                    <!-- PRODUCT GRID -->
                    <!-- PAGINATION -->
                    <nav class="my-3" aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${page-1>1?'':'disabled'}"  ><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page-1}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">Previous</a></li>
                                <c:if test="${page-2>0}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page-2}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">${page-2}</a></li>
                                </c:if>
                                <c:if test="${page-1>0}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page-1}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">${page-1}</a></li>
                                </c:if>
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                <c:if test="${page+1<=maxPage}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page+1}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">${page+1}</a></li>
                                </c:if>
                                <c:if test="${page+2<=maxPage}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page+2}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">${page+2}</a></li>
                                </c:if>
                            <li class="page-item ${page+1<=maxPage?'':'disabled'}"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${page+1}&query=${query}&subcategory=${subcategory}&brand=${brand}&price=${price}&sortType=${sortType}&sortMode=${sortMode}">Next</a></li>
                        </ul>
                    </nav>
                    <!-- PAGINATION -->
                </div>
                <!-- PRODUCT LIST -->
            </div>
        </div>
        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-sakura.js"></script>
        <script>

            $(window).load(function () {
                $('body').sakura();
            });
        </script>
        <script>
            window.onload = function () {
                formatCurrency();
            };
            var formatter = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'VND',

                // These options are needed to round to whole numbers if that's what you want.
                //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
            });
            function formatCurrency() {

                var listCurrency = document.getElementsByClassName("currency");
                for (let i = 0; i < listCurrency.length; i++) {
                    listCurrency[i].innerHTML = formatter.format(listCurrency[i].innerHTML);
                }

            }

        </script>
    </body>
</html>