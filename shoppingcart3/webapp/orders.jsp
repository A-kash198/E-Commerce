<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="com.tech.Dao.OrderDao"%>
<%@page import="com.tech.connection.DBCon"%>
<%@page import="com.tech.Dao.ProductDao"%>
<%@page import="com.tech.model.*"%>
<%@page import="java.util.*"%>
     <%@page import="java.util.*"%>
    <%@page import="com.tech.model.*"%> 
    <% User auth=(User)request.getSession().getAttribute("auth");

	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	List<Order> orders = null;
    if(auth!=null){
        request.setAttribute("person", auth);
	   OrderDao orderDao  = new OrderDao(DBCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
    }else{
    	response.sendRedirect("login.jsp");
    }
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
<title>orders page</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>


<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity()%></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>





<%@include file="includes/footer.jsp" %>
</body>
</html>