<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Add</title>
</head>
<body>
	<div align ="center">
		<form action="./cartadd" method = "post">
			<table>
				<tr>
					<td>Quantity</td>
					<td> <input type = "number" name = "quantity"> </td>
				</tr>
			</table>
			<input type = "submit" value = "Add">
		</form>
	</div>
</body>
</html>