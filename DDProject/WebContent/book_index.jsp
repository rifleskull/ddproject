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
<title>Insert title here</title>
</head>
<body>
<div align=center>
<h1>INSERT</h1>
<input type="hidden" name="action">
<form action="InsertQuery" method="post">
<h3>INSERT INTO book VALUES('
<input type="text" name="bname">','

  <select name="author">
  	<option value="0">Select Author</option>
    <option value="Silerchatz and Korth">Silerchatz and Korth</option>
    <option value="William Stallings">William Stallings</option>
    <option value="Robert  lafore">Robert  lafore</option>
  </select>
');</h3>
 <p>
 <p>
 <button type="submit">Submit</button></form>
 </div>
 
 
 
 
 
<div align=center>
 <h1>UPDATE</h1>
<form action="UpdateQuery" method="post">
<h3>Update book set Author = <select name="author">
  	<option value="0">Select Author</option>
    <option value="Silerchatz and Korth">Silerchatz and Korth</option>
    <option value="William Stallings">William Stallings</option>
    <option value="Robert  lafore">Robert  lafore</option>
  </select> where Book Name = <input type="text" name="bname">;</h3>
 <p>
 <button type="submit">Submit</button></form>
 </div> 


<p><p>
<div><a href="insertQuery.jsp">insertQuery.jsp</a></div><br>
<div><a href="updateQuery.jsp">"updateQuery.jsp</a></div>

</body>
</html>