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
out.println("<Book>");
try 
{
	java.sql.PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "Select * from book";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while(rs.next())
	{
		out.println("\t<Book>");
			out.println("\t\t<Name>"+rs.getString(2)+"</Name>");
			out.println("\t\t<Author>"+rs.getString(3)+"</Location>");
			
		out.println("\t</Book>");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
out.println("</Book>");
con.close();
%>
</textarea>
</body>

</body>
</html>