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
        <title>Cart</title>
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
        <a class="navbar-brand" href="/WebBanAo/home">AO</a>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Order <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll" name="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${sessionScope.cart != null}">
                            <c:forEach items="${sessionScope.cart}" var="cart">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options" value="${cart.key}">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>  


                                    <td>${cart.key}</td>
                                    <td>${cart.value.getProduct().getPname()}</td>
                                    <td>
                                        <img src="${cart.value.getProduct().getImage()}">
                                    </td>
                                    <td>${cart.value.getUnitPrice()} $</td>
                            <form action="AddtoCartServlet?action=updatequantity" method="POST">
                                <td><input name="quantity" type="number" value="${cart.value.getQuantity()}"> </td>
                                <input type="hidden" name="id" value="${cart.value.getProduct().getId()}">
                                <td>
                                    <!--                                    <a href="#editEmployeeModal"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>-->
                                    <button class="btn btn-success" type="submit">Cap nhat </button>
                                </td>
                            </form>
                            <td><a href="OrderServlet">Thanh toan</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <div>
                    <form action="AddtoCartServlet?action=checkInfo" method="post" class="form-signup">
                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Thong tin Dat Hang</h1>
                        <input type="hidden" name="id" value="${sessionScope.account.getId()}">
                        <input name="name" type="text"  class="form-control" placeholder="Ten tai khoan" required="" autofocus="" value="${sessionScope.account.getUserName()}">
                        <input name="address" type="text" class="form-control" placeholder="Nhap Dia chi" required autofocus="">
                        <input name="email" type="email" class="form-control" placeholder="Nhap Email" required autofocus="">
                        <input name="phone" type="text"  class="form-control" placeholder="Nhap So Dien Thoai" required autofocus="">

                        <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i>Dat Hang</button>
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