<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("pname");
String email=request.getParameter("emailid");
String[] split_email = email.split("[@._]");
String password=request.getParameter("password");

Connection myCon=null;
Statement myStmnt=null,myStmnt2,myStmnt3,myStmnt4;
ResultSet apcount,keralacount,tamilcount,totalcount;
try
{
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");
System.out.println("success1");
Statement st=con.createStatement();
System.out.println("success2");
Statement st1=con.createStatement();
Statement st2=con.createStatement();
st1.executeQuery("USE college");
ResultSet rz=st.executeQuery(("SELECT * FROM register"));

while(rz.next())
{
	if(email.equals(rz.getString(2)))
		
	{
		%>
		<h1>Already registered with this email</h1>
		<br>
		Please login here<a href="login.html">login</a>
		
		<%
		
	}
}
String insert="insert into register(name,email,password) values('"+name+"','"+email+"','"+password+"')";
int i=st1.executeUpdate(insert);
if(i==1)
{
	Statement st5=con.createStatement();
	st5.executeUpdate("CREATE TABLE "+split_email[0]+" (sno int,transactionid varchar(100) NOT NULL, PRIMARY KEY (transactionid), amount double,amounttype varchar(100),finalbalance double)");
	


out.println("updates success");

	response.sendRedirect("Succesregister.html");
}






}
catch(Exception e)
{
System.out.println(e);
}
%>