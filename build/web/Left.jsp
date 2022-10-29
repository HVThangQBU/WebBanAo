<%-- 
    Document   : Left
    Created on : Oct 26, 2022, 2:39:05 PM
    Author     : HOANG_THANG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${categoryList}" var="category">
                <li class="list-group-item text-white ${tagCid == category.id ? "active" : "" }"><a href="CategoryServlet?cid=${category.id}">${category.name}</a></li>
            </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid" src="${product.image}" />
            <h5 class="card-title">${product.pname}</h5>
            <p class="card-text">${product.title}</p>
            <p class="bloc_left_price">${product.price} $</p>
        </div>
    </div>
</div>