<%@page import="java.util.List"%>
<%@page import="com.jspiders.mvcproject1.pojo.CartAdminPOJO"%>
<%@page import="com.jspiders.mvcproject1.pojo.OrdersPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
int totalQuantity = (int) request.getAttribute("totalQuantity");
String userActive = (String) request.getAttribute("userActive");
List<OrdersPOJO> orders = (List<OrdersPOJO>) request.getAttribute("orders");
OrdersPOJO order = (OrdersPOJO) request.getAttribute("order");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="<c:url value='/resource/css/Orders.css'/>">
<style type="text/css">
.main{
position: relative;
top:100px;
}
.heading{
text-align: center;
margin-bottom:20px;
}
.info{
justify-content:center;
gap:50px;
align-items: flex-start;
}
.bag-content {
    margin-block: 20px;
    background-color: #6262622e;
    padding: 10px;
    border-radius: 15px;
    gap: 20px;
    width:453px;
}
.bag-img {
    width: 125px;
    height: 125px;
    background-color: #3a3a3a66;
    border-radius: 10px;
}
.bag-img img {
    width: 125px;
    height: 125px;
    transform: scaleX(-1);
}
.bag-text p {
    font-size: 1rem;
    line-height: 1.4rem;
}
.bag-text p:nth-child(3), .bag-text p:nth-child(4), .bag-text p:nth-child(5) {
    color: gray;
    font-size: 0.9rem;
    line-height: 1.3rem;
}
.shipping-address{
   width:360px;
   display:flex;
   flex-direction:column;
   gap:5px;
   background-color: #6262622e;
   border-radius: 15px;
   padding:20px;
   margin-block:20px;
   
}
.shipping-address p{
	font-size: 1rem;
    line-height: 1.4rem;
 
}
.details{
gap:50px;
justify-content: space-between;
}
.details p:nth-child(1){
color:gray;
}
.hr{
    border: 1px solid #494949d1;
    width:100%;
}
.address p{
color:gray;
}
.payment{
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #ffffff14;
    width: 510px;
    padding-inline: 20px;
    padding-block: 45px;
    display: flex;
    align-items: center;
    flex-direction: column;
    gap: 12px;
    border-radius: 15px;
  	backdrop-filter: blur(3px);
    transform: translate(-50%, -50%) scale(0);
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s, transform 0.3s;
    z-index: 9999;
}

.payment p{
	font-size: 0.9rem;
    line-height: 1.4rem;
    color:#999999;
}
.payment h2{
	color:#dcdcdc;
}
.payment h1{
	    margin-bottom: 15px;
}
.payment-icon{
    position: absolute;
    top: -36px;
}
.payment-icon img{
    width:80px;
}

.payment-details{
    border: 1px solid #80808052;
    border-radius: 5px;
    width: 200px; 
    padding: 10px;
}
.payment-details p{
 color:#ffffff;
}
.payment-details p:nth-child(1){
 color:#999999;
}

.payment-warpper{
	gap:15px;
}

.payment .hr{
	margin-block:15px;
	border: 1px solid #ffffff21;
}
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(5px);
    z-index: 999;
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s;
}
.details-zoom-in {
    transform: translate(-50%, -50%) scale(1);
}
</style>
</head>
<body>
<!-- nav bar -->

	<div class="body overlay" id="body"></div>
	<nav>
		<div class=" main-nav flex">
			<a href="#" class="nav-toggle hover-link" id="nav-toggle"> <i
				class="fa-solid fa-bars"></i>
			</a> <a href="./" class="company-logo"> <img
				src="./resource/assests/black-and-white-brand-pattern-nike-logo-png-f10610cd223765f9cb76402f10be85ca.png"
				alt="Nike.just do it">
			</a>
			<div class="nav-links">
				<ul class="flex">
					<li><a href="./sort?sortBy=Newest&otherActive=null" class="hover-link">New Releases</a></li>
					<li><a href="./menFillter?gender=male&active=null&otherActive=null&sortActive=null" class="hover-link">Men</a></li>
					<li><a href="./menFillter?gender=female&active=null&otherActive=null&sortActive=null" class="hover-link">Woman</a></li>
					<li><a href="./view" class="hover-link">collections</a></li>
						<%if(userActive != null){ %>
							<li><a href="./logoutPage?pageId=0&otherActive=null&sortActive=null&id=0&size=0&color=null" class="hover-link">Sign Out</a></li>
				<% 	}else{ %>
							<li><a href="./loginPage?pageId=0&otherActive=null&sortActive=null&id=0&size=0&color=null" class="hover-link">Sign In</a></li>
				<%	} %>
				</ul>
			</div>
			<div class="search flex">
				<a href="#" class="search-icon hover-link"> <i
					class="fa-solid fa-magnifying-glass"></i>
				</a>
				<div class="input">
					<input type="text" placeholder="Search" id="mysearch">
				</div>
			</div>
			<div class="add flex">
				
					<a href="./wishlist?otherActive=null&sortActive=null&pageId=0&id=0&size=0&color=null" class="search-like hover-link"> <i
						class="fa-regular fa-heart"></i>
				
				</a> <a href="./selectedCart?otherActive=null&sortActive=null&pageId=0&id=0&size=0&color=null" class="search-bag hover-link">
					<div class="cart">
						<i class="fa-solid fa-bag-shopping"></i>
						<div id="cartAmount" class="cartAmount"><%=totalQuantity > 0 ? totalQuantity : ""%></div>
					</div>
				</a>
			</div>
		</div>
	</nav>
		
	<div class="container main">
		<div class="heading"><h2>Order Details</h2></div>
		<%
		if(orders != null){ 
		%>
		
		<%
		for(OrdersPOJO or : orders){
		%>
		<div class="info flex">
		<div class="bag-content-wrapper">
		<% 	
		for (CartAdminPOJO items : or.getCart()) {	
		%>
		<div class="bag-content flex">
			<div class="bag-img ">
				<img src="./resource/assests/<%=items.getImage()%>" alt="green tick">
			</div>
			<div class="bag-text">
				<p><%=items.getProducts().getName()%></p>
				<p>Men's Football Shoes</p>
				<p>QTY <%=items.getQuantity()%></p>
				<p>Size <%=items.getSize() %></p>
				<p>Price &#8377; <%=items.getProducts().getPrice()%></p>
			</div>
		</div>
	
	<%}%>	
	</div>
		<div class="shipping-address ">
				<div class="flex details">
					<p>Order Id</p>
					<p><%=or.getOrderId()%></p>
				</div>
				<div class="flex details">
					<p>Payment Id</p>
					<p><%=or.getPaymentId() %></p>
				</div>
				<div class="flex details">
					<p>Email</p>
					<p><%=or.getEmail()%></p>
				</div>
				<div class="flex details">	
					<p>Phone</p>
					<p><%=or.getPhone()%></p>
				</div>	
				<div class="flex details">	
					<p>Amount Paid</p>
					<p>&#8377; <%=or.getAmount()%></p>
				</div>
				<div class="hr"></div>
				<div class="address">
				<h3>Shipping Address</h3>
					<p><%=or.getAddress() %></p>
					<p><%=or.getLocality() %></p>
					<p><%=or.getCountry() %></p>
					<p><%=or.getPostalCode() %></p>
				</div>	
				<div class="hr"></div>
				<div class="date-cart-products">
				<p class="date-text"></p>
				<input class="date-input" hidden type = "date" value = "<%=or.getDate()%>">
				</div>
		</div>
	</div>
	<div class="hr"></div>
	<%}%>
	
	<%}else{ %>
	<h1>You have No orders Present.</h1>	
	<%} %>
	</div>
	
	<%if(order != null){ %>
		<div class="payment">
		<div class="payment-icon">
			<img alt="success-icon" src="./resource/assests/original-3e1ed5c75a6ad9b1b5368f026492b6df (1) (1).png">
		</div>	
			<h2>Payment Success!</h2>
			<p>Your Payment has been successfully done.</p>
			<div class="hr"></div>
			<p>Total Payment</p>
			<h1>&#8377;<%=order.getAmount() %></h1>
			<div class="payment-warpper flex">
			<div class="payment-details">
			<p>Payment Id</p>
			<p><%=order.getPaymentId()%></p>
			</div>
			<div class="payment-details">
			<p>Payment Time</p>
			<p><%=order.getDate() %> <%=order.getTime() %></p>
			</div>
			</div>
			<div class="payment-warpper flex">
			<div class="payment-details">
			<p>Order Id</p>
			<p><%=order.getOrderId()%></p>
			</div>
			<div class="payment-details">
			<p>Sender Name</p>
			<p><%=order.getFirstName() %> <%=order.getLastName() %></p>
			</div>
		</div>
		
	</div>

	<%} %>
			<script src="https://kit.fontawesome.com/cb23ed1dd0.js"
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="./resource/js/Orders.js" defer></script>
		<script type="text/javascript">
		const dateInput = document.querySelectorAll('.date-input');
		dateInput.forEach((input,i) =>{
			const currentDate = new Date(input.value);
			currentDate.setDate(currentDate.getDate() + 7);
			
			const lastDate = new Date();
			lastDate.setDate(currentDate.getDate() + 20);
			
			const fromDate = currentDate.toLocaleDateString('en-US', { weekday: 'short', day: 'numeric', month: 'short' });
			const toDate = lastDate.toLocaleDateString('en-US', { weekday: 'short', day: 'numeric', month: 'short' });

			const arrivingDate = document.querySelectorAll('.date-text');
			arrivingDate[i].textContent = "Arrives " + fromDate + " - " + toDate;
		})
		
const body = document.querySelector('.body');
const payment = document.querySelector('.payment');

if (payment != null) {
	body.style.opacity = '1';
	body.style.visibility = 'visible';
	payment.classList.add('details-zoom-in');
	payment.style.opacity = '1';
	payment.style.visibility = 'visible';

	body.addEventListener('click', () => {
		body.style.opacity = '0';
		body.style.visibility = 'hidden';
		payment.classList.remove('details-zoom-in');
		setTimeout(() => {
			payment.style.opacity = '0';
			payment.style.visibility = 'hidden';
		}, 300);

	});

}

	

		
		</script>
</body>
</html>