<%@page import="com.jspiders.mvcproject1.pojo.PopularProductsAddPOJO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String msg = (String) request.getAttribute("msg");
String filename = (String) request.getAttribute("filename");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Popular Products</title>
<link rel="stylesheet" href="<c:url value='/resource/css/style.css'/>">
</head>
<body>
	<div align="center">
		<form action="./addPopularProducts" enctype="multipart/form-data"
			method="post">
			<fieldset>
				<table>
					<tr hidden = "true">
						<td>ID</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>Type</td>
						<td><input type="text" name="type"></td>
					</tr>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>Description</td>
						<td><input type="text" name="info"></td>
					</tr>
					<tr>
						<td>Brand</td>
						<td><input type="text" name="brand"></td>
					</tr>
					<tr>

						<td>sSize</td>
						<td><input type="number" name="sSize"></td>
					</tr>
					<tr>
						<td>mSize</td>
						<td><input type="number" name="mSize"></td>
					</tr>
					<tr>
						<td>lSize</td>
						<td><input type="number" name="lSize"></td>
					</tr>
					<tr>
						<td>xSize</td>
						<td><input type="number" name="xSize"></td>
					</tr>
					<tr>
						<td>Orange</td>
						<td><input type="text" name="orColour"></td>
					</tr>
					<tr>
						<td>Blue</td>
						<td><input type="text" name="bColour"></td>
					</tr>
					<tr>
						<td>Yellow</td>
						<td><input type="text" name="yColour"></td>
					</tr>

					<tr>
						<td>price</td>
						<td><input type="number" name="price"></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><input type="number" name="quantity"></td>
					</tr>
					<tr>
						<td>Image</td>
						<td><input type="file" name="images"></td>
					</tr>

				</table>
			</fieldset>
			<input type="submit" value="Add">
		</form>
		<%
		if (msg != null) {
		%>
		<h3><%=msg%><%=filename%></h3>
		<%
		}
		%>
	</div>
</body>
</html>