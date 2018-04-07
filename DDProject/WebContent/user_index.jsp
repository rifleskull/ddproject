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
<h1>INSERT USER</h1>
<input type="hidden" name="action" value="userinsert">
<form action="InsertUserQuery" method="post">
<h3>INSERT INTO user VALUES('
Name:<input type="text" name="name">','
Balance:<input type="text" name="balance">
Email:<input type="text" name="email">
  Password:<input type="password" name="password">
  
');</h3>
 <p>
 <p>
 <button type="submit">Submit</button></form>
 </div>
 
 
 <div align=center>
<h1>UPDATE USER</h1>
<input type="hidden" name="action" value="userupdate">
<form action="UpdateUserQuery" method="post">
<h3>INSERT INTO user VALUES('
Name:<input type="text" name="name">','
Balance:<input type="text" name="balance">
Email:<input type="text" name="email">
  Password:<input type="password" name="password">
  
');</h3>
 <p>
 <p>
 <button type="submit">Submit</button></form>
 </div>

</body>
</html>