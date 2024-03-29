<%-- 
    Document   : home.jsp
    Created on : Oct 26, 2022, 12:13:25 PM
    Author     : HOANG_THANG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                <div class="col-sm-9">
                    <div id ="content"class="row">
                        <c:forEach items="${productList}" var="product">
                            <div class="product_amount col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${product.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="DetailProductServlet?productid=${product.id}" title="View Product">${product.pname}</a></h4>
                                        <p class="card-text show_txt">${product.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${product.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="DetailProductServlet?productid=${product.id}" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <button onclick="loadMore()" class="btn btn-primary" type="button">LoadMore</button>
                </div>

            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function loadMore() {
                var amount = document.getElementsByClassName("product_amount").length;
                $.ajax({
                    url: "/WebQuanLyBanHang/LoadMoreServlet",
                    type: "get", //send it through get method
                    data: {
                        exits: amount
                    },
                    success: function(response) {
                      //Do Something
                      var row = document.getElementById("content");
                      row.innerHTML += response;
                    },
                    error: function(xhr) {
                      //Do Something to handle error
                    }
                  });
            }
            
            function SearchByName(param) {
                var txtSearch = param.value;
                 $.ajax({
                    url: "/WebQuanLyBanHang/SearchByAjaxServlet",
                    type: "get", //send it through get method
                    data: {
                        txtS: txtSearch
                    },
                    success: function(response) {
                      //Do Something
                      var row = document.getElementById("content");
                      row.innerHTML = response;
                    },
                    error: function(xhr) {
                      //Do Something to handle error
                    }
                  });
            }
        </script>
            
    </body>
</html>
