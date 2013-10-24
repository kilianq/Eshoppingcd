<%@ page session="true"%>
<%@ page language="java"%>

<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<html>
<head>
<title>Music Without Borders</title>
</head>
<body bgcolor="#33CCFF">
	<table>
		<font face="Times New Roman,Times" size="+3"> Music Without
			Borders </font>

		<hr>
		<p>
		<center>
			<form name="shoppingForm" action="/Eshoppingcd/ShoppingServlet"
				method="POST">
				<b>CD:</b> <select name=CD>
					<%
					Context envContext = envContext = new InitialContext();
			            Context initContext  = (Context)envContext.lookup("java:/comp/env");
			            DataSource ds = (DataSource)initContext.lookup("jdbc/eshopping");
			            Connection con = ds.getConnection();						
						Statement Estamento = con.createStatement();
						ResultSet rs = Estamento.executeQuery("select * from cd");
						while (rs.next()) {
							out.println("<option>");
							out.println(rs.getString("ALBUM"));
							out.println(" | ");
							out.println(rs.getString("ARTIST"));
							out.println(" | ");
							out.println(rs.getString("COUNTRY"));
							out.println(" | ");
							out.println(rs.getDouble("PRICE"));
							out.println("</option>");
						}
						rs.close();
						Estamento.close();
						con.close();
					%>
				</select> <b>Quantity: </b><input type="text" name="qty" SIZE="3" value=1>
				<input type="hidden" name="action" value="ADD"> 
				<input type="submit" name="Submit" value="Add to Cart">
			</form>
		</center>
		<p>
			<jsp:include page="Cart.jsp" flush="true" />
</body>
</html>