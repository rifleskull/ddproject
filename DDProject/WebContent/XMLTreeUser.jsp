<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>XML TREE</title>
<link rel="stylesheet" href="css copy/bootstrap.min.css">
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<link rel="stylesheet" href="js/jquery-1.9.1.min.js">
<link rel="stylesheet" href="js/bootstrap.min.js">
</head>
<body>
<%@ page import="com.Connection1" %>
<%@ page import="java.sql.*" %>
<textarea style="border:none;width:100%;" rows="1000000" >
<%
java.sql.Connection con = Connection1.dbConnect();
out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
out.println("<?xml-stylesheet type=\"text/css\" href=\"cd_catalog.css\"?>");
out.println("<User>");
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from user";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while(rs.next())
	{
		out.println("\t<User>");
			out.println("\t\t<Name>"+rs.getString(2)+"</Name>");
			out.println("\t\t<Email>"+rs.getString(3)+"</Email>");
			out.println("\t\t<Password>"+rs.getString(4)+"</Password>");
			out.println("\t\t<Balance>"+rs.getString(5)+"</Balance>");
		out.println("\t</User>");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
out.println("</User>");
con.close();
%>
</textarea>
</body>
</html>