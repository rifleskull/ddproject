<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css copy/bootstrap.min.css">
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<link rel="stylesheet" href="js/jquery-1.9.1.min.js">
<link rel="stylesheet" href="js/bootstrap.min.js">
<title>Result</title>
</head>
<body>
<div align=center>
<h2>
<%
	out.println("Insert into book values ('"+request.getParameter("bname")+"','"+request.getParameter("author")+"')");
%></h2>
<h2>
Table: Book
</h2>
<%@ page import="com.Connection1" %>
<%@ page import="java.sql.*" %><Table Border=2>
<tr><td><b>Book name</b></td><td><b>Author</b></td></tr>

<%
	java.sql.Connection con = Connection1.dbConnect();
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from book";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{
%><tr><td><%
	out.println(rs.getString(2));%></td><td>
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
Table: bookfrag1 (Author = Silerchatz and Korth)
</h2>
<Table Border=2>
<tr><td><b>Book name</b></td><td><b>Author</b></td></tr>

<%
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from bookfrag1";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{%><tr><td><%
	out.println(rs.getString(2));%></td><td>
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
Table: bookfrag2 (Author = William Stallings )
</h2>
<Table Border=2>
<tr><td><b>Book name</b></td><td><b>Author</b></td></tr>

<%
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from bookfrag2";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{%><tr><td><%
	out.println(rs.getString(2));%></td><td>
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

<div align="center">
<h2>
Table: bookfrag3 (Author = Robert Lafore )
</h2>
<Table Border=2>
<tr><td><b>Book name</b></td><td><b>Author</b></td></tr>

<%
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from bookfrag3";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) 
	{%><tr><td><%
	out.println(rs.getString(2));%></td><td>
	<%
	out.println(rs.getString(3));%></td></tr>
	<%
	}
} catch (SQLException e) {
e.printStackTrace();
}
%>
<%con.close(); %>

</Table>
</div>
</body>
</html>