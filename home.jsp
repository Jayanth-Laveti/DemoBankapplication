<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*;" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
    A {text-decoration: none;}
   
    table{
    margin-left: auto;
    margin-right: auto;

    margin: 80px auto;
margin-top: 50px;
    html, body {
    width: 100%;
}</style>

</head>

<body>

	
    <h1> Welcome <%
    
    String str=(String)session.getAttribute("user");out.println(str);
    %>
    </h1>
    <%
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");
	Statement st=con.createStatement();
	Statement st2=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * from college."+str+" ORDER BY transactionid DESC LIMIT 5");
	double ffinalbalance=0.0;
	while(rs.next())
	{
		ffinalbalance=rs.getDouble(5);
		break;
		
	}
	
	%> <h1> Your account balance:<% out.println(ffinalbalance); %></h1>
   <table cellpadding="15" >
   <tr> <td><a href="maketransaction.html" style>Fund Transfer</a></td></tr>
    <tr><td><button onclick="redirect()" class="btn">Last 5 transations</button></td></tr>
    <tr><td><a href="login.html">Log out</a></td></tr>
    </table>
    <script type="text/javascript">
    function redirect()
    {
    var url = "displaytrasaction.jsp";
    window.location.href=url;
    }
    </script>
    
</body>
</html>