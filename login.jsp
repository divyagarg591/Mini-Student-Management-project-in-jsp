<%-- 
    Document   : check
    Created on : 6 Dec, 2020, 10:43:37 AM
    Author     : pc
--%>

<%@page import="java.sql.*"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            body{
              background-color: green;
            }
            #main{
                width: 1024px;
                height:586px;
                color: black;
                background-color: cyan;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
            }
            
            
            
            #head{
                width: 1024px;
                height: 70px;
                background-color: orange;
                border: 2px solid black;
                
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
            }
            
            #left{
                width: 220px;
                float: left;
                height: 512px;
                background-color:pink;
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
                
            }
             
            #cntr{
                width: 520px;
                height: 512px;
                float: right;
                background-color: blueviolet;
                color: black;
                font-family: cursive;
                font-size: 20px;
                font-style: italic;
                margin-right: 32px;
               
            }
            
            
            
            #right{
                width: 220px;
               float: right;
                height: 512px;
                background-color:pink;
                
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
                
            }
            

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <div id="main">
              
        <div id="head"> 
            MY WEBSITE 
        </div>
            
        <div id="left">
            <center>left</center>
           
        </div>
            <div id="right">
            <center>right</center>
        </div>
    
            <div id="cntr">
                <h1 align='center'>LOGIN Form</h1>
        <form name="f1">
            <table bgcolor="yellow" align=center width='60%'>
                <tr>
                    <td>User Id:</td>
                    <td><input type="text" name="txtuid" value="" size="40" /></td>
                </tr>
                 <tr><td><br/></td></tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtpwd" value="" size="40" /></td>
                </tr>
                 <tr><td><br/></td></tr>
                <tr>
                    <td>Role:</td>
                    <td><select name="role">
                            <option>Student</option>
                            <option>Admin</option>
                        </select>
                    </td>
                </tr>
                <tr><td><br/></td></tr>
                <tr><td><br/></td></tr>
                <tr><td><br/></td></tr>
                <tr><td><br/></td></tr>
                <tr>

                    <td><br/></td><td colspan="1"><input type="submit" value="LogIn" name="btn_LogIn"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SignUp" name="btn_SignUp"/></td>
                </tr>
            </table>
        </form>
            </div>
    
    
            
        </div>
        
    </center>
   
    </body>
</html>
<%
    try
{
    if(request.getParameter("btn_LogIn")!=null)
{
String uid=request.getParameter("txtuid");
String pwd=request.getParameter("txtpwd");
String roll=request.getParameter("role");
out.print(uid);
String query="select * from loginnn where ((id='"+uid+"'and pswrd='"+pwd+"') and role='"+roll+"')";
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee","divya","divyagarg");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
boolean status=rs.next();
    if(status)
    {
        if(roll.equals("Admin"))
       response.sendRedirect("admin.jsp");
        else if(roll.equals("Student"))
           response.sendRedirect("student.jsp"); 
    }
    else
    {
    response.sendRedirect("login.jsp");
    }
}
else if(request.getParameter("btn_SignUp")!=null)
 {
     response.sendRedirect("sign.jsp");
 }

}catch(Exception ex){ex.printStackTrace();}
%>