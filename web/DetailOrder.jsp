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
                            <th>Id</th>
                            <th>Order Id</th>
                            <th>Id Product</th>
                            <th>Quantity</th>
                            <th>Price</th>       
                            
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${order_detailList}" var="orderDetail">
                            <tr>
                                <td>${orderDetail.getId()}</td>
<!--                                <td>
                                    <c:if test="${order.getAccount() == sessionScope.account.getId()}">
                                        <c:out value="${sessionScope.account.getUserName()}"></c:out>
                                    </c:if>
                                </td>-->
                                <td>${orderDetail.getOrderId()}</td>
                                <td>${orderDetail.getProductId()}</td>
                                <td>${orderDetail.getQuantity()}</td>
                                <td>${orderDetail.getPrice()}</td>
<!--                                <td>
                                    <c:forEach var="type" items="${mapStatus}">
                                        <c:if test="${order.getOrderStatus() == type.key}">
                                            ${type.value}
                                        </c:if>
                                    </c:forEach>                                   
                                </td>
                                <td>${order.getDateOrder()}</td>
                                <td>${order.getShippedDateString()}</td>
                                <td><a href="OrderServlet?idOrder=${order.getId_order()}">Xem Chi Tiet</a></td>-->
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>  
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