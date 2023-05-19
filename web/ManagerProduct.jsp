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
        <title>Quanlysanpham</title>
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
<!--               <a class="navbar-brand" href="/WebBanAo/home">Trang Chủ</a>-->
               <jsp:include page="MenuManage.jsp"></jsp:include>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản Lý Sản Phẩm</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm Sản Phẩm Mới</span></a>
                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Xóa</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Hình Ảnh</th>
                            <th>Giá</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${productList}" var="product">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${product.getId()}</td>
                                <td>${product.getPname()}</td>
                                <td>
                                    <img src="${product.getImage()}">
                                </td>
                                <td>${product.getPrice()}VNĐ</td>
                                <td>
                         <!-- <a href="#editEmployeeModal"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>--> 
                                    <button class="btn-edit" data-teol="${product.getId()}" class="edit" data-toggle="modal" data-target="#editEmployeeModal"><i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></button>
                                    <a href="DeleteProductServlet?pid=${product.getId()}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
                               
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Hiển Thị <b>5</b> Trên <b>25</b> Mục</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Trang Trước</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Tiếp Theo</a></li>
                    </ul>
                </div>
            </div>
            <a href="/WebBanAo/home"><button type="button" class="btn btn-primary">Quay Lại</button></a>


        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProductServlet" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm Sản Phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên Sản Phẩm</label>
                                <input name="name" type="text" class="form-control" value="${Product.getPname()}">
                            </div>
                            <div class="form-group">
                                <label>Hình Ảnh</label>
                                <input name="image" type="text" class="form-control" value="${Product.getImage()}">
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <input name="price" type="text" class="form-control" value="${Product.getPrice()}">
                            </div>
                            <div class="form-group">
                                <label>Tiêu Đề</label>
                                <textarea name="title" class="form-control" required>${Product.getTitle()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Mô Tả</label>
                                <textarea name="description" class="form-control" required>${Product.getDescription()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Loại</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.getId()}">${category.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Thoát">
                            <input type="submit" class="btn btn-success" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
                            
        <!-- Edit Modal HTML -->
        
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="EditProductServlet" method="post">
                       <div class="modal-header">						
                            <h4 class="modal-title">Sửa Sản Phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <input  id="input_Id"  type="hidden" name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên Sản Phẩm </label>
                                <input id="input_name" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình ẢNh</label>
                                <input id="input_image"name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <input id="input_price" name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tiêu Đề</label>
                                <textarea id="input_title" name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Mô Tả</label>
                                <textarea id="description" name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Loại</label>
                                <select id="select_category" name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categoryList}" var="category">
                                        <option class="category-option" value="${category.getId()}">${category.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Thoát">
                            <input type="submit" id="btn-submit-edit" class="btn btn-info" value="Lưu">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Xóa Sản Phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Bạn có chắc chắn muốn xóa các Bản ghi này không?</p>
                            <p class="text-warning"><small>Hành động này không thể được hoàn tác.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Thoát">
                            <input type="submit" class="btn btn-danger" value="Xóa">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
    <script src="js/manager.js" type="text/javascript"></script>
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
 

        $(document).ready(function(){
            $('.btn-edit').on('click', function(){
                //$("#editEmployeeModal").modal();
                var teol = $(this).data("teol");
                console.log(teol);
                $.ajax({
                    url: '/WebBanAo/EditProductServlet',
                    type: 'GET',
                    data: {pid: teol},
                })
                .done(function(response) {
                    console.log(response.cateId);
        
                    $('#input_Id').attr('value', response.id);
                    $('#input_name').attr('value', response.pname);
   
                    $('#input_image').attr('value', response.image);
                    $('#input_price').attr('value', response.price);     
                    $('#input_title')[0].value=response.title;
                    $('#description')[0].value=response.description;
                    $('#category').attr('value', response.cateId);
                    //var conceptName = $("#select_category option[value=response.category]").attr("selected", true);
                    $("select[name=category] option[value=" + response.cateId +"]").attr('selected','selected');    
                
                });
            });

       
        });
        
 
    </script>
</body>
</html>