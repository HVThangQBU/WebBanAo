

<%-- 
    Document   : ManagerProduct
    Created on : Oct 27, 2022, 9:58:32 AM
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
        <title>Manager Order</title>
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
        
   <jsp:include page="MenuManage.jsp"></jsp:include>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2> <b>Quản lý đơn hàng</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#"  class="" data-toggle="modal"></a>
                            <a href="#" class="" data-toggle="modal"></a>                       
                        </div>
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
                                <td>${orderDetail.getOrderId()}</td>
                                <td> 
                                    <c:forEach items="${productList}" var="product">
                                        <c:if test="${orderDetail.getProductId() == product.getId()}">
                                            <c:out value="${product.getPname()}"></c:out>
                                        </c:if>                                       
                                    </c:forEach>                                  
                                </td>
                                <td>${orderDetail.getQuantity()}</td>
                                <td>${orderDetail.getPrice()}</td>

                            </tr>


                        </c:forEach>
                    </tbody>

                </table>  
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Total</th>  
                            <th>Order Status</th>
                            <th>Date Order</th>
                            <th>Shipped Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> 
                                <c:forEach items="${accountList}" var="acc">
                                    <c:if test="${order.getAccount() == acc.getId()}">
                                        <c:out value="${acc.getUserName()}"></c:out>
                                    </c:if>                                    
                                </c:forEach>      
                            </td>
                            <td>${order.getAddress()}</td>
                            <td>${order.getPhoneNumber()}</td>
                            <td>${order.getEmail()}</td>
                            <td>${order.getTotalPrice()}</td>
                            <td>
                                <c:forEach var="type" items="${mapStatus}">
                                    <c:if test="${order.getOrderStatus() == type.key}">
                                        <c:out value="${type.value}"></c:out>
                                    </c:if>
                                </c:forEach>     
                            </td>
                            <td>${order.getDateOrder()}</td>
                            <td>${order.getShippedDateString()}</td>
                            <td>
                                <!--                                    <a href="#editEmployeeModal"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>-->
                                <button type="button" class="btn-editOrder" data-teol="${order.getId_order()}" class="edit" data-toggle="modal" data-target="#editOrdertModal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>
                                <button type="button" data-teol="${account.getId()}" class="delete deleteAccount" data-toggle="modal" data-target="#deleteAccountModal"><i class="material-icons" data-toggle="tooltip" title="Delete"  >&#xE872;</i></button>
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerAccountServlet?action=addAccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" ">
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input name="password" type="text" class="form-control" ">
                            </div>
                            <div class="form-group">

                                <td>
                                <lable>Sell</lable>
                                <input type="radio"  name="sell" value="1">
                                <lable>user</lable>
                                <input type="radio" name="sell" value="0">
                                </td>
                            </div>
                            <div class="form-group">
                                <td>
                                <lable>admin</lable>
                                <input type="radio"  name="admin" value="1">
                                <lable>user</lable>
                                <input type="radio" name="admin" value="0">
                                </td>
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
        <!-- Edit Modal HTML -->

        <div id="editOrdertModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerOrderDetail?action=editOrder" method="post">
                        <div class="modal-header">                      
                            <h4 class="modal-title">Edit Order</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                          <div class="modal-body">
                            <div class="form-group">
                                <label>Id</label>
                                <input id="input_Id" name="idO" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="input_name" name="name" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input id="input_address" name="address" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input id="input_phone" name="phone" type="text" class="form-control">
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input id="input_email" name="email" type="email" class="form-control"">
                            </div>

                            <div class="form-group">
                                <label>Total Price</label>
                                <input id="input_total" name="name" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select id="status" name="statusOr" class="form-select" aria-label="Default select example">
                                      <c:forEach var="type" items="${mapStatus}">
                                             <option value="${type.key}">${type.value}</option>                                                                                                                                         
                                    </c:forEach>                                                 
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Order Day</label>
                                <input id="input_orderdate" name="orderDay" type="date" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Shipped Date</label>
                                <input id="input_shipdate" name="shipperDay" type="date" class="form-control"">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" id="btn-submit-edit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerAccountServlet?action=deleteAccount" method ="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
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

        <div id="deleteallAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerAccountServlet?action=deleteAllAccount" method ="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" form="myform" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
         $(document).ready(function () {
             $('.btn-editOrder').on('click', function () {
                //$("#editEmployeeModal").modal();
               var valueId = $(this).data("teol");

                  $.ajax({
                  type: "GET",
                  datatype: 'json',
                  url: "/WebBanAo/ManagerOrderDetail?action=editOrder",
                  data: {
                      aid : valueId
                  }
                  ,
                  success: function(response){
                    console.log(response);
                        $('#input_Id').attr('value', response.order.id_order);
                        $('#input_name').attr('value', response.name.userName);
                        $('#input_address').attr('value',response.order.address);
                        $('#input_phone').attr('value',response.order.phoneNumber);
                        $('#input_email').attr('value',response.order.email);
                        $('#input_total').attr('value',response.order.totalPrice);
                        $('select.form-select').val(response.order.orderStatus);
                        $('#input_orderdate').attr('value',response.order.dateOrder);
                        $('#input_shipdate').attr('value',response.order.shippedDateString);
                  },
                  error: function(response){
                    console.log("error");
                  }
                })

             })
                 
         });
        </script>
    </body>
</html>