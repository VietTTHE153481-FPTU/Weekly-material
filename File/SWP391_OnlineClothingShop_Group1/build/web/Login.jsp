<%-- 
    Document   : Login
    Created on : Sep 30, 2021, 8:39:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login </title>
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
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <%@include file="model/header.jsp" %>
  
    <!-- ------------Login-page------------------- -->
    <div class="account-page">
        <div class=" container container-custom">
            <div class="row">
                <div class="col-2 col-2-custom">
                    <img src="./resources/img/anhlogin.png" width="80%">
                </div>

                <div class="col-2 col-2-custom">
                    <div class="form-container-custom">
                        <div class="form-myBtn">
                            <!---click chuyen login sang register---->
                            <span onclick="login()">Login</span>
                           
                            <span onclick="register()">Register</span>

                            <hr style="width: 50%; margin-right: -5%;"  id="Indicator">
                            
                        </div>
                         <!--- Login--->   
                        <form  id="LoginForm" action="${pageContext.request.contextPath}/login" method ="post">
                             
                            <input class="input-custom" name="user" type="text" placeholder="Username">
                            <input class="input-custom" name ="pass" type="password" placeholder="Password">
                            <input type="submit" name="action" class="myBtn" value="Login"/>
                            <a href="ResetPassword.jsp">Forgot password</a>
                        </form>
                         <h4 class="text-danger">${mess1}</h4>
                        <!--- Register--->
                        <form id="RegForm" action ="register" method="post">
                            <input class="input-custom" name="user" type="text" placeholder="Username">
                            <input class="input-custom" name="email" type="email" placeholder="Email">
                            <input class="input-custom" name="pass" type="password" placeholder="Password">
                            <input class="input-custom" name="repass" type="password" placeholder="Repeat Password">
                            <input type="submit" name="action" class="myBtn" value="Register"/>                             
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ------------footer----------- -->

        <!-- ------------------- js for Login form-------------- -->

        <script>
            var LoginForm = document.getElementById("LoginForm");
            var RegForm = document.getElementById("RegForm");
            var Indicator = document.getElementById("Indicator");

            function register() {
                RegForm.style.transform = "translateX(-300px)";
                LoginForm.style.transform = "translateX(-300px)";
                Indicator.style.transform = "translateX(75px)";

            }
            function login() {
                RegForm.style.transform = "translateX(0px)";
                LoginForm.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(0px)";
            }


        </script>
 <%@include file="model/footer.jsp" %>
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
