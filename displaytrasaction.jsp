<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*;"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent transaction</title>
<style>
table{
	border-collapse: separate;
    margin-left: auto;
    margin-right: auto;

    margin: 80px auto;
margin-top: 50px;</style>
</head>
<body>
<%
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");
	Statement st=con.createStatement();
	Statement st2=con.createStatement();
	String str=(String)session.getAttribute("user");
	ResultSet rs=st.executeQuery("SELECT * from college."+str+" ORDER BY transactionid DESC LIMIT 5");
	%><h1>
	Your last five transactions are :
	</h1><br>
	<table border="1" align=center style="text-align:center; border-collapse: separate;" width="100%">
	<caption>Last five transactions</caption>
    <thead>
        <tr>
           <th>Sno</th>
           <th>Transaction Id</th>
           <th>Amount</th>
           <th>Amount Type</th>
           <th>Final Balance</th>
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      { 
          %>
          <tr>
              <td><%=rs.getInt(1) %></td>
              <td><%=rs.getInt(2) %></td>
              <td><%=rs.getDouble(3) %></td>
              <td><%=rs.getString(4) %></td>
              <td><%=rs.getDouble(5) %></td>
          </tr>
          <%}%>
         </tbody>
      </table><br>
  
<% }
catch(Exception e)
{
	System.out.println(e);
}
%>
<center><a href="home.jsp">Go to Home</a></center>
</body>
</html>