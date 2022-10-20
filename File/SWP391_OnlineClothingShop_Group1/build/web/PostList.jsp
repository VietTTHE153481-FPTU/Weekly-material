<%-- 
    Document   : PostList
    Created on : Oct 28, 2021, 4:26:59 PM
    Author     : phunghe150108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
        <title>Post List</title>
        <!------ Include the above in your HEAD tag ---------->
        <link href="css/Postlist.css" rel="stylesheet" type="text/css"/>

        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


    </head>
    <body>

        <%@include file="model/header.jsp" %>
        <div class="container">
            <button type="button" class="btn btn-warning"><a href="AddPost.jsp">Add new post</a></button>
            <div class="col-md-12 d-flex flex-wrap justify-content-between">
  

                <c:forEach var="o" items="${postList}">
                    <div class="col-md-4 p-3">
                        <div class="single-blog-item1" >
                            <div class="blog-thumnail">
                                <img src="./resources/${o.postImgURL}" alt="blog-img">
                            </div>
                            <div class="blog-content1">
                                <div>post ID:${o.ID}</div>
                                <div class="overflow-hidden" style="height: 20px">${o.description}</div>
                                <div>...</div>
                                <div  >Author: 
                                    <c:forEach var="u" items="${luser}">
                                        <c:if test="${u.userID==o.userID}">
                                            ${u.userName}
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div>date: ${o.date}</div>
                                <div class="btngroup" >
                                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">

                                        <c:if test="${user.roleID == 1}">
                                            <a href="DeletePost?postid=${o.ID}" onclick="return confirm('Are you sure you want to delete these Post?');"><button type="button" class="btn btn-danger">Delete</button></a>
                                        </c:if>

                                        <button type="button" class="btn btn-warning" ><a href="PostDetail?postid=${o.ID}">Detail</a></button>
                                        <c:if test="${user.roleID == 1}">
                                            <button type="button" class="btn btn-light""><a href="LoadPost?postid=${o.ID}">Update</a></button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>


        <script>
            function myFunction() {
                var x = document.getElementById("myDIV");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
