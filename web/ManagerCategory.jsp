<%-- 
    Document   : ManagerCategory
    Created on : Nov 17, 2022, 9:35:49 AM
    Author     : HOANG_THANG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quanlyloaisanpham</title>
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
          <a class="navbar-brand" href="/WebBanAo/home">Áo</a>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản lý<b> Loại sản phẩm</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addCategoryModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm loại sản phẩm mới</span></a>
                            <a href="#deleteallAccountModal" class="btn btn-danger deleteAllAccount" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Xóa loại sản phẩm</span></a>						
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
                            <th>Tên loại sản phẩm</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <!--<form action="ManagerAccountServlet?action=deleteAllAccount" method="POST" id="myform">-->

                    <c:forEach items="${categoryList}" var="category">
                            <tr>
                                
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options" value="${category.getId()}">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                  
                                <td>${category.getId()}</td>
                                <td>${category.getName()}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
<!--                                    <a href="#editEmployeeModal"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>-->
                                    <button type="button" class="btn-editCategory" data-teol="${category.getId()}" class="edit" data-toggle="modal" data-target="#editAccountModal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>
                                    <button type="button" data-teol="${category.getId()}" class="delete deleteAccount" data-toggle="modal" data-target="#deleteAccountModal"><i class="material-icons" data-toggle="tooltip" title="Delete"  >&#xE872;</i></button>
                                </td>
                            </tr>
                        </c:forEach>
                  <!--</form>-->
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
            <a href="/WebBanAo/home"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addCategoryModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="ManagerCategoryServlet?action=addCategory" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm loại sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên</label>
                                <input name="name" type="text" class="form-control" ">
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
                    <form action="ManagerCategoryServlet?action=editCategory" method="post">
                       <div class="modal-header">						
                            <h4 class="modal-title">Chỉnh sửa loại sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                             <div class="form-group">
                                <label>Id</label>
                                <input id="input_Id" name="id" type="hidden" class="form-control" ">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="input_name" name="name" type="text" class="form-control"">
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
                    <form action="ManagerCategoryServlet?action=deleteAccount" method ="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Account</h4>
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
                            <h4 class="modal-title">Delete Account  </h4>
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
        
        
    <script src="js/manager.js" type="text/javascript"></script>
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
 

        $(document).ready(function(){
            $('.btn-editCategory').on('click', function(){
                //$("#editEmployeeModal").modal();
                var teol = $(this).data("teol");
                console.log(teol);
                $.ajax({
                    url: '/WebBanAo/ManagerCategoryServlet?action=editCategory',
                    type: 'GET',
                    data: {aid: teol},
                })
                .done(function(response) {
                    console.log(response);
        
                    $('#input_Id').attr('value', response.id);
                    $('#input_name').attr('value', response.name);
                });
            });
            $('.deleteAccount').on('click', function(){
                //$("#editEmployeeModal").modal();
                var teol = $(this).data("teol");
                console.log(teol);
                $.ajax({
                    url: '/WebBanAo/ManagerCategoryServlet?action=deleteAccount',
                    type: 'POST',
                    data: {aid: teol},
                })
                .done(function(response) {
                    console.log(response);
                    console.log("xoa thanh cong");
                
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