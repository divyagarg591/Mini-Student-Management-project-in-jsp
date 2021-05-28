<%@page import="java.sql.* "contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
    <style>
            .menu{
               width: 80%;
               height: 100px;
               margin: 0px auto;
            }
            .menu ul{
              padding: 0px;  
            }
            .menu ul li{
                float: left;
                background-color: cyan;
                color: white;
                width: 200px;
                list-style: none;
                height: 50px;
                line-height: 50px;
                font-size: 20px;
                text-align: center;
                opacity: 0.6;
            }
            .menu ul li ul{
                display: none;
            }
            .menu ul li:hover >ul{
                display: block;
            }
            .menu ul li:hover{
                background-color: #32cd32;
                opacity: 0.9;
            }
            .menu ul li ul{
                position: relative;
            }
             .menu ul li ul li ul{
                position: absolute;
                left: 200px;
                top: 0px;
            }
        </style>
    </head>
    <body bgcolor=pink>
        <div class="menu">
            <ul>
                <li><a href="#">HOME</a>
                    <ul>
                        <li><a href="#">products</a>
                            <ul>
                                <li><a href="#">pen</a></li>
                                 <li><a href="#">notebook</a></li>
                            </ul>
                        </li>
                           <li><a href="#">items</a></li>
                    </ul>
                </li>
                <li><a href="#">FORM</a> </li>
                <li><a href="#">ABOUT</a> </li>
                <li><a href="#">CONTACT</a> </li>
                <li><a href="#">REPORT</a> </li>
            </ul>
            
        </div>
        <h1 align=center>Student</h1>
       <form name='f1'>
           <br>
           <br>
           
	<table border='1' cellspacing='4' cellpadding='3'>
	<tr ><td >Enter ID : <input type='text' value='' name='txtrno'/></td></tr>
	<tr ><td >Enter Name : <input type='text' value='' name='txtname'/> </td></tr>
	<tr><td><input type ='submit' value='VIEW' name='btn'/></td></tr>
	</table>
	</form>
	</body>
	</html>
<%    
	String r = request.getParameter("txtrno");
	String n = request.getParameter("txtname");
	String button=request.getParameter("btn");
        try
	{
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee","divya","divyagarg");
        if(button.equals("VIEW"))
        {
                response.sendRedirect("view record student.jsp");
        
         }
        conn.close();
        }catch(Exception se)
        	{
            	se.printStackTrace();
   
        	}
       %>



