
<%-- 
    Document   : ReplyFeedback
    Created on : Oct 18, 2021, 9:52:39 AM
    Author     : Ottelia
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/queries.css" />
        <link href="css/UpdateBlog.css" rel="stylesheet" type="text/css"/>
        <title>Reply Feedback</title>
 <style>
            td{
                padding-right:3em;
                padding:10px; border: 1px solid;
            }

            #feedback {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                text-align: center;
            }

            #feedback td, #feedback th {
                border: 1px solid #ddd;
                padding: 5px;
                text-align: center;
                border-bottom:  1px solid #ddd; 
            }

            #feedback tr:nth-child(even){background-color: #f2f2f2;}

            #feedback tr:hover {background-color: #ddd;}

            #feedback th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #21aed1;
                color: white;
            }

            .checked {
                color: orange;
            }
            .form-group{
                padding:2px;
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body style="min-height: 2000px">
        <%@include file="model/header.jsp" %>
        <!--        <h1>Hello World!</h1>-->   

        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ReplyFeedback" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Reply feedback</h4>
                            <a type="button" class="close" href="ManageFeedbackBySeller" aria-hidden="true">&times;</a>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>ID</label>
                                <input type="text"  class="form-control" name="id" value="${requestScope.feedback.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>OrderID</label>
                                <input type="text" class="form-control"  name="order" value="${requestScope.feedback.orderID}" readonly>
                            </div>
                            <div class="form-group">
                                <table>
                                    <label>User</label>
                                    <input type="text" class="form-control"  name="username" value="${requestScope.feedback.user.userName}" readonly>
                                </table>
                            </div>
                            <div class="form-group">
                                <label>Rating     &nbsp</label>
                                <c:forEach begin="1" end="${requestScope.feedback.star}">
                                    <span>
                                        <i class="fa fa-star checked" style="font-size: 12px"></i>
                                    </span>  
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <label>Detail</label>
                                <textarea name="blog-text" class="form-control" id="blog-text" rows="7" readonly>${requestScope.feedback.feedbackDetail}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Reply</label>
                                <input type="text" class="form-control"  name="rep" value="${rep}">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-default" href="ManageFeedbackBySeller">Cancel</a>
                            <input type="reset" class="btn btn" value="Clear">
                            <button type="submit" class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
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

    </body>
</html>