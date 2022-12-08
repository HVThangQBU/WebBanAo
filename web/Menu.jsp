<%-- 
    Document   : Menu
    Created on : Oct 26, 2022, 2:34:12 PM
    Author     : HOANG_THANG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .dropbtn {
  background-color: #343a40!important;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  margin-right: 30px;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}
</style>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/WebBanAo/home">Ảo ma Store </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                
            <ul class="navbar-nav m-auto">
               
                <c:if test="${sessionScope.account == null }">
                    <li class="nav-item">
                        <a class="nav-link" href="LoginServlet">Đăng nhập</a>
                    </li>
                </c:if>
                 
            </ul>
                <c:if test="${sessionScope.account.getIsAdmin() == 1}">
                   <div class="dropdown">
                <button class="dropbtn">Quản lý</button>
                    <div class="dropdown-content">
                      <a class="nav-link" href="ManagerAccountServlet">Tài khoản</a>
                        <a class="nav-link" href="OrderServlet">Đơn hàng</a>
                          <c:if test="${sessionScope.account.getIsSell() == 1}">
                               <a class="nav-link" href="ManagerProductServlet">Sản phẩm</a>
                                     <a class="nav-link" href="ManagerCategoryServlet">Loại sản phẩm</a>
                       </c:if>
                     
                    </div>
                </div>
                     </c:if>
               <a class="nav-link" href="OrderServlet">Đơn hàng</a>
            

            <form action="SearchServlet" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input oninput="SearchByName(this)" value="${txtSearch}" name="txtSearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="AddtoCartServlet">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-light">0</span>
                </a>
            </form>
                            <c:if test="${sessionScope.account != null}">
                    <div class="dropdown">
                        
                <button class="dropbtn">Xin chào ${sessionScope.account.getUserName()}</button>
                    <div class="dropdown-content">
                      <a class="nav-link" href="ManagerAccountServlet">Quản lý tài khoản</a>
                       <a class="nav-link" href="LogoutServlet">Đăng xuất</a>
                      
                      
                      
                       
                     
                    </div>
                </div>
                     </c:if>
        </div>
    </div>
</nav>
