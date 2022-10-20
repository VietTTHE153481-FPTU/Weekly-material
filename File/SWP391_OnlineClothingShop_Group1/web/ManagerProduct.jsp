<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : phunghe150108
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/managerproduct.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                           <button type="button" class="btn btn-light"><a href="Dashboard">Back to DashBoard</a></button>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Description</th>
                            
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${list}">
                            <tr>
                                
                                <td>${o.productID}</td>
                                <td>${o.productName}</td>>
                                <td>
                                    <img src="./resources/img/products/${o.url}">
                                </td>
                                <td>${o.sellPrice}</td>
                                <td>${o.desc}</td>
                               


                                <td>
                                    <!---Edit---->
                                    <a href="LoadProduct?pid=${o.productID}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <!----Delete----> 
                                    <a href="delete?pid=${o.productID}" onclick="return confirm('Are you sure you want to delete these Product?');" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- Add -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Product Name</label>
                                <input name="pname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="Description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>OriginalPrice</label>
                                <textarea name="OriginalPrice" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>SellPrice</label>
                                <textarea name="SellPrice" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>SalePercent</label>
                                <input name="SalePercent" type="text" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Amount</label>
                                <textarea name="Amount" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>StatusID</label>
                                <textarea name="sttID" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>BrandID</label>
                                <textarea name="brandID" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>height</label>
                                <textarea name="height" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>width</label>
                                <textarea name="width" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>weight</label>
                                <textarea name="weight" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" name="ProductImgURL" class="form-control" required></input>
                            </div>
                           <div class="form-group">
                                    <label>Category</label>
                                    <select name="Category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCate}" var="o">
                                            <option  value="${o.subCateID}">${o.subCateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Delete -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Product?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </a>
    <script src="js/managerproduct.js" type="text/javascript"></script>
</body>
</html>