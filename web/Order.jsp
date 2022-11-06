<%-- 
    Document   : AddtoCart
    Created on : Oct 30, 2022, 5:56:35 PM
    Author     : HOANG_THANG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <a class="navbar-brand" href="/WebBanAo/home">Shoes</a>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2> <b>Order Product</b></h2>
                        </div>
                        <!--                        <div class="col-sm-6">
                                                    <a href="#"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                                    <a href="#" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                                                </div>-->
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>                          
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${sessionScope.cart != null}">
                            <c:forEach items="${sessionScope.cart}" var="cart">
                                <tr>
                                    <td>${cart.value.getProduct().getPname()}</td>
                                    <td>
                                        <img src="${cart.value.getProduct().getImage()}">
                                    </td>
                                    <td>${cart.value.getUnitPrice()} $</td>

                                    <td>${cart.value.getQuantity()}</td>
                                </tr>

                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>  
            </div>
      
            <div>
                 <form action="" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Nhap Thong tin</h1>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus="">
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="">
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="">

                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(function () {
                jQuery("[name=selectAll]").click(function (source) {
                    checkboxes = jQuery("[name=options]");
                    for (var i in checkboxes) {
                        checkboxes[i].checked = source.target.checked;
                    }
                    console.log("sda", checkboxes)
                });
            });
        </script>
    </body>
</html>