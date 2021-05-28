

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Record</title>
    </head>
    <body bgcolor="pink">
       <h2 align=center>RECORD</h2>
       <form name='f2'>
           <input type ='submit' value='<-BACK' name="btn"/>
                <table border='1' align=center cellspacing='4' cellpadding='3' width='40%' bgcolor=cyan>
                <tr><td>Id</td> <td>Name</td></tr>
                <%
                    if(request.getParameter("btn")!=null)
                    {
                        response.sendRedirect("admin.jsp");
                    }
                try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee","divya","divyagarg");
		PreparedStatement ps=conn.prepareStatement("select * from stdnt");
                ResultSet rs=ps.executeQuery();
        	       while(rs.next())
                       {
	out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td></tr>");
	}
                       %>
                </table>
	</form>
	</body>
</html>
<%
            conn.close();
        }catch(Exception se)
        	{
            	se.printStackTrace();
   
        	}
%>
  