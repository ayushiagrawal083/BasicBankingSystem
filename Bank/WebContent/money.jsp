<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html" charset="utf-8"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet"  href="style.css" type="text/css" media="screen"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<title>Welcome To Bank</title>
</head>
<body>

<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand" href="index.html">Grip Bank</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.html">Home</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="allUsers.jsp">View All Customers</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="transactiontable.jsp">Transaction History</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sendmoney.html">Send Money</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="newuser.html">New User</a>
      </li>
    
  </div>
</nav>
<br />

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page errorPage="errorpage.jsp" %>
<%@include file="database.jsp"%>
<%
String reciever= request.getParameter("email1");
String sender= request.getParameter("email");
String money= request.getParameter("money");
String qr="insert into transaction values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,sender);
			ps.setString(2,reciever);
			ps.setString(3,money);
			int i= ps.executeUpdate();
			if(i>0)
			{
				out.print("<script>window.alert('Transaction Successful');</script>");
			}
			else
			{
				out.print("<script>window.alert('Transaction Failed');</script>");
			}
			RequestDispatcher rd=request.getRequestDispatcher("index.html");
			rd.include(request, response);
			con.close();
		
		
		%>
		<footer class="bg-dark text-center text-white footer">
  
  <div class="container p-4 pb-0">
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);"> Made By AYUSHI AGRAWAL,  Email: agrawalayushi086@gmail.com
   
  </div>
 
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>	
</html>
		