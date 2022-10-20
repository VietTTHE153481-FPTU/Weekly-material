<%-- 
    Document   : ResetPassword
    Created on : 14-10-2021, 22:28:56
    Author     : BEAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
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
        <link rel="stylesheet" type="text/css" href="./css/style.css" />
        <link rel="stylesheet" type="text/css" href="./css/queries.css" />
        <link rel="stylesheet" type="text/css" href="./css/ResetPassword.css" />
        <title>Shope</title>
    </head>
    <body>
        <%@include file="model/header.jsp" %>

        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="bg-white text-center p-5 mt-3 center">
                <div class="warn" > 
                    <h3 style="color: red;">${warn}</h3>
                </div>

                <div class="form">
                    <h3>Reset Password </h3>
                    <p>Please Enter Your Mail To Reset Password</p>
                    <form class="pb-3" action="ResetPassword" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Your Mail*" name="mail" required>
                        </div>
                          <button type="submit" class="btn mt-5">Reset Password</button> 
                    </form>
                  
                </div>
            </div>
        </div>

        <%@include  file="model/footer.jsp" %>
    </body>
</html>
