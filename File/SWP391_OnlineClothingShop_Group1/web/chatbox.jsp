<%-- 
    Document   : chatbox
    Created on : Nov 8, 2021, 1:30:29 AM
    Author     : Ottelia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!--FONTAWESOME-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="./css/style.css" />
        <link rel="stylesheet" type="text/css" href="./css/queries.css" />
        <link rel="stylesheet" type="text/css" href="./css/homepage.css" />
        <link rel="stylesheet" type="text/css" href="./css/chatbox.css" />
        <title>Chat</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function loadMessage() {
                var amount = document.getElementsByClassName("incoming_msg").length + document.getElementsByClassName("outgoing_msg").length;
                var idfriend = document.getElementById("friendId").innerHTML;
                $.ajax({
                    url: "/SWP391_OnlineClothingShop_Group1/LoadMessage",
                    type: "get",
                    data: {
                        offset: amount,
                        friendId: idfriend
                    },
                    success: function (data) {
                        var chatbox = document.getElementById("messagebox");
                        chatbox.innerHTML += data;
                    },
                    error: function (xhr) {

                    }
                });

            }

            function loadNewFriendMessage(friendId) {
                var messagebox = document.getElementById("messagebox");
                messagebox.innerHTML = null;

                var inputbox = document.getElementById("inputbox");
                inputbox.style.display = 'none';
                document.getElementById("friendId").innerHTML = friendId;
                loadMessage();
                inputbox.style.display = 'block';
            }

            function setSelected(selectdiv) {
                let elements = document.getElementsByClassName('chat_list active_chat');

                for (let i = 0; i < elements.length; i++) {
                    elements[i].className = 'chat_list';
                }

                selectdiv.className = 'chat_list active_chat';
            }

            function postMessage() {

                var mess = document.querySelector('input').value;
                var messtatus = document.getElementById("status");

                if (messtatus !== null) {
                    messtatus.remove();
                }
                document.getElementById("messagebox").innerHTML += "<div class=\"outgoing_msg\">\n"
                        + "                  <div class=\"sent_msg\">\n"
                        + "                    <p>" + mess + "</p>\n"
                        + "                    <span class=\"time_date\">" + "" + "</span>\n"
                        + "                    <span id=\"status\" class=\"\">" + "ĐANG GỬI" + "</span>\n"
                        + "                  </div>\n"
                        + "                </div>";

                var idfriend = document.getElementById("friendId").innerHTML;

                $.ajax({
                    url: "/SWP391_OnlineClothingShop_Group1/LoadMessage",
                    type: "post",
                    data: {
                        message: mess,
                        friendId: idfriend
                    },
                    success: function () {
                        document.getElementById("status").innerHTML = "ĐÃ GỬI";
                        document.getElementById("textbox").value = "";
                    },
                    error: function (xhr) {
                        document.getElementById("status").innerHTML = "KHÔNG GỬI ĐƯỢC";
                    }
                });
            }

            $(document).ready(function () {
                var elem = document.getElementById("friendId").innerHTML;

                if (!elem) {
                    //alert('newelem');
                    var messagebox = document.getElementById("messagebox");
                    messagebox.innerHTML = null;

                    var inputbox = document.getElementById("inputbox");
                    inputbox.style.display = 'none';

                    document.getElementById("heading").style.display = 'none';

                } else {
                    //alert('elem');
                    loadNewFriendMessage(elem);

                }
            });

        </script>
    </head>

    <body >

       <header>
            <div class="row m-0 p-0">
                <span id="promo" class="d-lg-block d-none">
                    <marquee style="width: 100%" behavior="scroll" direction="left"><i style="color: white">Get 10% SALE by using special discount code "CHEERSLUV"</i></marquee>
                </span>
            </div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <!-- LOGO -->
                <a class="navbar-brand col-lg-2 offset-lg-2 logo" href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/resources/img/SHOPE-logos_transparent.png"> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" 
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" 
                               href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#part-1">Contacts Us</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main id="main">

            <!-- ======= Breadcrumbs Section ======= -->
            <section class="breadcrumbs">
                <div class="card-heading">
                    <h2 class="title" style="color: black; font-weight: bold;text-align: center;">Chat box</h2>
                    <c:if test="${chaterror!=null}">
                        <h3 style="color:#ff0000;font-weight: bold;text-align: center"><c:out value="${chaterror}"></c:out></h3>
                    </c:if>
                </div>
            </section><!-- End Breadcrumbs Section -->

            <h2 id="friendId" style="display:none;">${friendId}</h2>

            <section class="inner-page" style="padding-bottom: 30px;">
                <div class="container">
                    <div class="messaging">
                        <div class="inbox_msg">
                            <div class="inbox_people">
                                <div class="headind_srch">
                                    <div class="recent_heading">
                                        <h4>Recent</h4>
                                    </div>

                                </div>
                                <div class="inbox_chat">
                                    <c:set var="selectedId" value="${friendId}"></c:set>
                                    <c:forEach items="${friendList}" var="friend" >
                                        <c:choose>
                                            <c:when test="${friend.getUserID()==selectedId}">
                                                <div class="chat_list active_chat">
                                                    <a href="#" onclick="setSelected(this.parentNode);
                                                            loadNewFriendMessage(${friend.getUserID()}); return false;">
                                                        <div class="chat_people">                          
                                                            <div class="chat_ib">
                                                                <h5><c:out value="${friend.getUserName()}"></c:out></h5>

                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="chat_list">
                                                    <a href="#" onclick="setSelected(this.parentNode);
                                                            loadNewFriendMessage(${friend.getUserID()});
                                                            return false;">
                                                        <div class="chat_people">

                                                            <div class="chat_ib">
                                                                <h5>${friend.getUserName()}</h5>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="mesgs">
                                <div id="heading" class="headind_srch">
                                    <div class="recent_heading">

                                        <h4 style="
                                            max-width: 30%;
                                            float: left;"
                                            id="friendName">Chat </h4>
                                    </div>

                                </div>
                                <div class="msg_history" id="messagebox">

                                </div>
                                <div class="type_msg" id="inputbox">
                                    <div class="input_msg_write">
                                        <form action="#" method="POST" onsubmit="postMessage();event.preventDefault();">
                                            <input id = "textbox" type="text" class="write_msg" placeholder="Type a message" required style="width: 91%"/>
                                            <button class="msg_send_btn" type="submit"><i class="fa fa-paper-plane-o"
                                                                                          aria-hidden="true"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>
           <footer class="text-white text-lg-start" style="background-color: #23242a;" id="part-1">
            <!-- Section: Social media -->
            <section
                class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
                >
                <!-- Left -->
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <!-- Left -->

                <!-- Right -->
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
                <!-- Right -->
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h5 class="text-uppercase mb-4"><i class="fas fa-tshirt"></i>&nbsp;About shop</h5>
                            <p>
                                Our purpose at Shope is to empower people to lead bold and full lives. 
                            </p>

                            <p>
                                We believe that if you look good, you feel good. And when you feel good you can do good for others around you. Shope brings you a wide range of trendy shoes, beautiful scarves, and statement-making jewelry, all at affordable prices to make them accessible to you. 
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Products
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Shoe</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Sock</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Pant</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Shirt</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Hat</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Jacket</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Accessories</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Contact
                            </h6>
                            <p><i class="fas fa-home me-3"></i>Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                shope@gmail.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i>+84 123456789</p>
                            <p><i class="fas fa-print me-3"></i>+84 123456789</p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h5 class="text-uppercase mb-4"><i class="far fa-clock"></i>&nbsp;Opening hours</h5>
                            <table class="table text-white">
                                <tbody class="font-weight-normal">
                                    <tr>
                                        <td>Monday - Thurday:</td>
                                        <td>8am - 9pm</td>
                                    </tr>
                                    <tr>
                                        <td>Friday - Satủd:</td>
                                        <td>8am - 12pm</td>
                                    </tr>
                                    <tr>
                                        <td>Sunday:</td>
                                        <td>9am - 10pm</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2021 Copyright:
                <a class="text-white" href="#">SWP391 - GRP1</a>
            </div>
            <!-- Copyright -->
        </footer>

        <!-- Template Main JS File -->
        <script src="./js/main.js"></script>


        <!-- BOOTSTRAP5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
    </body>
</html>
