<%-- 
    Document   : sign
    Created on : 5 Dec, 2020, 4:00:19 PM
    Author     : pc
--%>

<%@page import="java.sql.*"  contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGNUP</title>
    </head>
    <body bgcolor='cyan'>
        <a href="sign.jsp"></a>
        <h1 align='center'>SignUp Form</h1>
        <form name="f1">
            <table bgcolor="yellow" align=center width='60%'>
                <tr>
                    <td>Create User Id:</td>
                    <td><input type="text" name="txtuid" value="" size="40" /></td>
                </tr>
                 <tr><td><br/></td></tr>
                <tr>
                    <td>Create Password:</td>
                    <td><input type="password" name="txtpwd" value="" size="40" /></td>
                </tr>
                <tr>
                    <td>Conform Password:</td>
                    <td><input type="password" name="txtpwd_c" value="" size="40" /></td>
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

                    <td><br/></td><td colspan="1"><input type="submit" value="SignUp" name="btn_SignUp"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Back->" name="back"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%
    try
{
    if(request.getParameter("btn_SignUp")!=null)
{
String uid=request.getParameter("txtuid");
String pwd=request.getParameter("txtpwd");
String c_pwd=request.getParameter("txtpwd_c");
String roll=request.getParameter("role");
if(!c_pwd.equals(pwd))
{
 out.print("<script>alert('Please Confirm The Password')</script>");
 return;
}

Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee","divya","divyagarg");
String q="select * from loginnn where id ='"+uid+"'";    
           PreparedStatement pdt1=conn.prepareStatement(q);
           ResultSet rs=pdt1.executeQuery();
           if(rs.next())
        {
          out.print("<script>alert('This User Id is Already Exist')</script>");
          return;
        }
PreparedStatement ps=conn.prepareStatement("insert into loginnn values(?,?,?)");
ps.setString(1, uid);
ps.setString(2, pwd);
ps.setString(3, roll);
 int i=ps.executeUpdate();
    if(i>0)
    {
       out.print("<script>alert('SignUp Successfully')</script>");
    }
    else
    {
    response.sendRedirect("sign.jsp");
    }
    conn.close();
}
else if(request.getParameter("back")!=null)
 {
     response.sendRedirect("login.jsp");
 }
}catch(Exception ex){ex.printStackTrace();}
%>
