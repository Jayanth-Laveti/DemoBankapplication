<%@ page import ="java.sql.*"%>
<%
String useremail=request.getParameter("user");
String password=request.getParameter("pswd");
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");
	System.out.println("success1");
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();
	st2.executeQuery("use college");
	System.out.println("Success2");
	int flas=0;
	ResultSet rs=st1.executeQuery("SELECT * FROM register");
	while(rs.next())
	{
		if(useremail.equals(rs.getString("email")) &&password.equals(rs.getString("password")))
		{
			flas=1;
			String[] split_email = useremail.split("[@._]");
			session.setAttribute("user",split_email[0]);
			out.println(session.getAttribute("user"));
			
			
		}
	}
	if(flas==1){
		
		response.sendRedirect("home.jsp");
		
	}
	else
	{
		response.sendRedirect("login.html");
		
	}
	
}
catch(Exception e)
{
	System.out.println("exception raised");
}

%>
