<%@page import="java.util.*"%>
<%@page import="com.tech.connection.DBCon"%>

<%@page import="com.tech.Dao.ProductDao"%>

<%@page import="com.tech.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% User auth2=(User)request.getSession().getAttribute("auth");
    
    if(auth2!=null){
    	request.setAttribute("auth", auth2);
    }
    ProductDao pd = new ProductDao(DBCon.getConnection());
    List<Product> products = pd.getAllProducts();
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
    	
    	request.setAttribute("cart_list", cart_list);
    }
 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>


	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">y
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
					%> 
					 
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width:18rem">
							<img class="card-img-top" src="product-image/female-shoes.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"><%=p.getName()%></h5>
								<h6 class="price">Price:$<%=p.getPrice()%></h6>
								<h6 class="category"><%=p.getCategory()%></h6>
								<div class="mt-3 d-flex justify-content-between">
									<a  href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark" >Add to Cart</a> <a
										href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary" >Buy Now</a>
								</div>
							</div>
			 
							
						</div>
					</div>

				<% 
				}
			}else{
				out.println("THERE IS NO PRODUCTS");
			}
			%>
				</div>
			</div> 
			
<%@include file="includes/footer.jsp" %>
</body>
</html>