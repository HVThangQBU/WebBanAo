<%-- 
    Document   : ManagerAccount
    Created on : Oct 28, 2022, 7:36:58 PM
    Author     : HOANG_THANG
--%>

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
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
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
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addAccountModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#deleteallAccountModal" class="btn btn-danger deleteAllAccount" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
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
                            <th>PassWord</th>
                            <th>Sell</th>
                            <th>Admin</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="ManagerAccountServlet?action=deleteAllAccount" method="POST" id="myform">
                    <c:forEach items="${accountList}" var="account">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options" value="${account.getId()}">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${account.getId()}</td>
                                <td>${account.getUserName()}</td>
                                <td>
                                  ${account.getPassword()}
                                </td>
                                <td> ${account.getIsSell()}</td>
                                <td>${account.getIsAdmin()}</td>
                                <td>
<!--                                    <a href="#editEmployeeModal"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>-->
                                    <button class="btn-editAccount" data-teol="${account.getId()}" class="edit" data-toggle="modal" data-target="#editAccountModal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>
                                    <a href="#deleteAccountModal" data-teol="${account.getId()}" class="delete deleteAccount" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </form>
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
            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>

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
        
        <div id="editAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerAccountServlet?action=editAccount" method="post">
                       <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                             <div class="form-group">
                                <label>Id</label>
                                <input id="input_Id" name="id" type="text" class="form-control" ">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="input_name" name="name" type="text" class="form-control"">
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input id="input_password" name="password" type="text" class="form-control"">
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
<!--                    <form action="ManagerAccountServlet?action=deleteAllAccount" method ="post">-->
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
<!--                    </form>-->
                </div>
            </div>
        </div>
        
        
    <script src="js/manager.js" type="text/javascript"></script>
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
 

        $(document).ready(function(){
            $('.btn-editAccount').on('click', function(){
                //$("#editEmployeeModal").modal();
                var teol = $(this).data("teol");
                console.log(teol);
                $.ajax({
                    url: '/WebBanAo/ManagerAccountServlet?action=editAccount',
                    type: 'GET',
                    data: {aid: teol},
                })
                .done(function(response) {
                    console.log(response);
        
                    $('#input_Id').attr('value', response.id);
                    $('#input_name').attr('value', response.userName);
   
                    $('#input_password').attr('value', response.password);
//                    $('#input_price').attr('value', response.price);     
//                    $('#input_title')[0].value=response.title;
//                    $('#description')[0].value=response.description;
//                    $('#category').attr('value', response.category);
//                    var conceptName = $("#select_category option[value=response.category]").attr("selected", true);
//                    $("input:radio[name=post_pri] :selected").val();
                     $("input[name=sell][value=" + response.isSell + "]").prop('checked', true);
                     $("input[name=admin][value=" + response.isSell + "]").prop('checked', true);
                
                });
            });
            $('.deleteAccount').on('click', function(){
                //$("#editEmployeeModal").modal();
                var teol = $(this).data("teol");
                console.log(teol);
                $.ajax({
                    url: '/WebBanAo/ManagerAccountServlet?action=deleteAccount',
                    type: 'POST',
                    data: {aid: teol},
                })
                .done(function(response) {
                    console.log(response);
                
                });
            });
           
       
        });
        $(function() {
        jQuery("[name=selectAll]").click(function(source) { 
            checkboxes = jQuery("[name=options]");
            for(var i in checkboxes){
                checkboxes[i].checked = source.target.checked;
            }
        });
        });
        
 
    </script>
</body>
</html>