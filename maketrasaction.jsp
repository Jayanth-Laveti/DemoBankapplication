<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
  

<%@ page import ="java.util.*;" %>
<%
try
{
	
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","16341a05b0");

Statement st1=con.createStatement();
int num=1001;
st1.executeQuery("use college");
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
String pruser=(String)session.getAttribute("user");
ResultSet rs=st2.executeQuery("SELECT * from "+pruser+"");
double ffinalbalance=0.0;
int sno=0;
String pruserr=(String)session.getAttribute("user");

String str=request.getParameter("email");

while(rs.next())
{
	ffinalbalance=rs.getDouble(5);
	num=rs.getInt(2);
	sno=rs.getInt(1);
}
String s=request.getParameter("creditdebit");
String newamount=request.getParameter("amount");
int mnewamount=Integer.parseInt(newamount);
Random rn=new Random(); //Random method called for integer values with fixed value. 


if(s.equals("credit"))
{
	ffinalbalance=ffinalbalance+mnewamount;
	sno=sno+1;
	num=num+1;
	String insert ="insert into "+pruserr+" (sno,transactionid,amount,amounttype,finalbalance) values('"+sno+"','"+num+"','"+mnewamount+"','"+s+"','"+ffinalbalance+"')";
	int i=st3.executeUpdate(insert);
	

	
	%>
	<center>
	<h1>Transaction Successful</h1>

	
	<a href="home.jsp">Home</a>
	<%
}
if(s.equals("debit"))
{
	ffinalbalance=ffinalbalance-mnewamount;
	sno=sno+1;
	num=num+1;
	String insert ="insert into "+pruser+" (sno,transactionid,amount,amounttype,finalbalance) values('"+sno+"','"+num+"','"+mnewamount+"','"+s+"','"+ffinalbalance+"')";
	int i=st3.executeUpdate(insert);
	
%>
<center>
<h1>Transaction Successful</h1>

	
	<a href="home.jsp">Home</a>
	</center>
	<%
	
}

}
catch(Exception e)
{
	System.out.println(e);
}


%>



