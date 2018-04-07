<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css copy/bootstrap.min.css">
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<link rel="stylesheet" href="js/jquery-1.9.1.min.js">
<link rel="stylesheet" href="js/bootstrap.min.js">
</head>
<body>
<div align=center>
<h2>
<%
	out.println("Insert into user values ('"+request.getParameter("name")+"','"+request.getParameter("email")+"','"+request.getParameter("balance")+"')");
%></h2>
<h2>
Table:user
</h2>
<%@ page import="com.Connection1" %>
<%@ page import="java.sql.*" %><Table Border=2>
<tr><td><b>User name</b></td><td><b>Balance</b></td><td><b>Email</b></td></tr>

<%
	java.sql.Connection con = Connection1.dbConnect();
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from user";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{
%><tr><td><%
	out.println(rs.getString(2));%></td><td>
	<%
	out.println(rs.getString(5));%></td><td>
	<%
	out.println(rs.getString(3));%></td></tr>
	<%
	}
} catch (SQLException e) {
e.printStackTrace();
}
%>
</Table>
<h2>
Table: userfrag1 (Balance < 100)
</h2>
<Table Border=2>
<tr><td><b>User name</b></td><td><b>Balance</b></td><td><b>Email</b></td></tr>

<%
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from userfrag1";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{%><tr><td><%
	out.println(rs.getString(2));%></td><td>
	<%
	out.println(rs.getString(5));%></td><td>
	<%
	out.println(rs.getString(3));%></td></tr>
	<%
	}
} catch (SQLException e) {
e.printStackTrace();
}
%>
</Table>
<h2>
Table: userfrag2 (Balance >1000 )
</h2>
<Table Border=2>
<tr><td><b>User name</b></td><td><b>Balance</b></td><td><b>Email</b></td></tr>

<%
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from userfrag2";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{%><tr><td><%
	out.println(rs.getString(2));%></td><td>
	<%
	out.println(rs.getString(5));%></td><td>
	<%
	out.println(rs.getString(3));%></td></tr>
	<%
	}
} catch (SQLException e) {
e.printStackTrace();
}
%>

</Table>
</div>

</body>
</html>