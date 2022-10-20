<%-- 
    Document   : PostDetail
    Created on : Oct 31, 2021, 9:24:05 PM
    Author     : phunghe150108
--%>


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Post Detail</title>

    </head>
    <body>
        <div class="container5" style ="">
            <div class="card" style="width: 100%;">
                <img src="./resources/${detailpost.postImgURL}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Description</h5>
                    <p class="card-text">${detailpost.description}</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">date created: ${detailpost.date}</li>
                    <li class="list-group-item">postID: ${detailpost.ID}</li>
                    <li class="list-group-item">Author: Admin
                    <c:forEach var="u" items="${luser}">
                        <c:if test="${u.userID==detailpost.ID}">
                            ${u.userName}
                        </c:if>
                    </c:forEach>
                    </li>
                </ul>
                <div class="card-body">
                    

                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">


                        

                    </div>
                    <a href="PostControl"> <button type="button" class="btn btn-primary">back to post list</button></a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    </body>
</html>