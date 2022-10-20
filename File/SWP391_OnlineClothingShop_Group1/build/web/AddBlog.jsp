<%-- 
    Document   : AddBlog
    Created on : Oct 27, 2021, 12:00:45 AM
    Author     : Ottelia
--%>


    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <title>Add Blog</title>
            <style>
                .container{
                    margin:50px;
                }
                table.table td a.delete {
                    color: #F44336;
                }
                table.table td a.edit {
                    color: #FFC107;
                }
                .btn btn-success{
                    margin-right: 0px;
                }
                .modal-header{
                background-color: #d15321;
                color: white;
                border: none;
                }
            </style>


        </head>

    <body style="font-family: 'Poppins',sans-serif">
        <%@include file="model/header.jsp" %>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="AddBlog" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Blog</h4>
                               
                            </div>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Author</label>
                                    <input type="text" class="form-control" required name="author">
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input type="text" class="form-control" required name="title">
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                   
                                    <textarea name="content" class="form-control" id="blog-text" rows="7" placeholder="Write your content here"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Image Link</label>
                                    <input type="text" class="form-control" required name="imageLink">
                                </div>                            
                            </div>
                            <div class="modal-footer">
                                <a type="button" href="ManageBlog" class="btn btn-default" data-dismiss="modal" style="border:1px solid green" >Cancel</a>
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
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
