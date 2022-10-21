<%@include file="database.jsp" %>
<%
        String name=request.getParameter("name");
		String email=request.getParameter("email");
		String balance=request.getParameter("bal");
		int bal= Integer.parseInt(balance);
			String qr="insert into customer values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setInt(3,bal);
			int i= ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("index.html");
			rd.include(request, response);
			if(i>0){
				out.println("Customer Id Created");
			}
			else{
				out.println("Server Error Try again");
			}

			con.close();
		
		
		%>