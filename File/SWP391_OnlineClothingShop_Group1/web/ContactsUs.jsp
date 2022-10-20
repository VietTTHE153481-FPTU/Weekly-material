<%-- 
    Document   : layout
    Created on : Oct 31, 2021, 10:47:44 AM
    Author     : Duy Manh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contacts Us</title>    
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">     
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

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ContactsUs.css">

        <!--===============================================================================================-->
    </head>
    <body class="animsition">
        <jsp:include page="model/header.jsp"/>
        <!-- ==================================HOME================================================ -->     
        <!-- ======================================= PRODUCT DETAIL ================================= -->

        <div class="container">
            <!--            <div id="error_message"></div>-->
            <form id="myform" onsubmit="return validate();">
                <div class="contact-box">
                    <div class="left">                                            
                    </div>
                    <div class="right">
                        <div id="error_message"></div>
                        <h2>CONTACTS US</h2>
                        <input type="text" class="field" placeholder="Your Name" id="name">
                        <input type="text" class="field" placeholder="Your Email" id="email">
                        <input type="text" class="field" placeholder="Phone" id="phone">
                        <textarea id="message" placeholder="Message" class="field"></textarea>

                        <!--                <div class="input_field">
                                            <input type="text" placeholder="Name" id="name">
                                        </div>
                                            <div class="input_field">
                                                <input type="text" placeholder="Subject" id="subject">
                                            </div>
                                        <div class="input_field">
                                            <input type="text" placeholder="Phone" id="phone">
                                        </div>
                                        <div class="input_field">
                                            <input type="text" placeholder="Email" id="email">
                                        </div>
                                        <div class="input_field">
                                            <textarea placeholder="Message" id="message"></textarea>
                                        </div>-->
                        <div class="btn1">
                            <input type="submit">
                        </div>
                        <script>
                            function validate() {
                                var name = document.getElementById("name").value;
                                //var subject = document.getElementById("subject").value;
                                var phone = document.getElementById("phone").value;
                                var email = document.getElementById("email").value;
                                var message = document.getElementById("message").value;
                                var error_message = document.getElementById("error_message");

                                error_message.style.padding = "10px";

                                var text;
                                if (name.length < 5) {
                                    text = "Please Enter valid Name";
                                    error_message.innerHTML = text;
                                    return false;
                                }
                                if (email.indexOf("@") == -1 || email.length < 6) {
                                    text = "Please Enter valid Email";
                                    error_message.innerHTML = text;
                                    return false;
                                }
                                if (isNaN(phone) || phone.length != 10) {
                                    text = "Please Enter valid Phone Number";
                                    error_message.innerHTML = text;
                                    return false;
                                }
                                if (message.length <= 140) {
                                    text = "Please Enter More Than 140 Characters";
                                    error_message.innerHTML = text;
                                    return false;
                                }
                                alert("Submitted Successfully!");
                                return true;
                            }
                        </script>
                    </div>
                </div>
            </form>
        </div>                          
        <jsp:include page="model/footer.jsp"/>
    </body>

</html>
