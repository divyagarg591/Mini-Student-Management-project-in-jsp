<%@page import="java.sql.* "contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STUDENT ENTRY FORM</title>
        <style>
            .menu{
               width: 1000px;
               height: 50px;
               
               margin: 0px auto;
            }
            .menu ul{
              padding: 0px;  
            }
            .menu ul li{
                float: left;
                background-color: yellow;
                color: white;
                width: 200px;
                list-style: none;
                height: 50px;
                line-height: 50px;
                font-size: 15px;
                font-weight: bold;
                text-align: center;
                opacity: 0.5;
            }
            .menu ul li ul{
                display: none;
            }
            .menu ul li:hover >ul{
                display: block;
            }
            .menu ul li:hover{
                background-color: yellow;
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
            body{
              background-color: brown;
            }
            #main{
                width: 1024px;
                height:528px;
                color: black;
                background-color: green;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
            }
            
            
            
            #head{
                width: 1024px;
                height: 70px;
                background-color: cyan;
                border: 2px solid black;
                
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
            }
            
            #left{
                width: 220px;
                float: left;
                height: 402px;
                background-color:pink;
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
                
            }
             
            #cntr{
                width: 520px;
                height: 402px;
                float: right;
                background-color: yellow;
                color: black;
                font-family: cursive;
                font-size: 20px;
                font-style: italic;
                margin-right: 32px;
               
            }
            
            
            
            #right{
                width: 220px;
               float: right;
                height: 402px;
                background-color:pink;
                
                color: black;
                font-family: cursive;
                font-size: 40px;
                font-style: italic;
                
            }
        </style>
    </head>
    <body bgcolor="yellow">
    <center> <div class="menu">
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
            
        </div></center>
        <center>
        <div id="main">
              
        <div id="head"> 
            MY WEBSITE 
        </div>
            
        <div id="left">
            
           
        </div>
            <div id="right">
            
        </div>
    
            <div id="cntr">
                <h1 align='center'>STUDENT ENTRY FORM</h1>

	<form name='f1'>
	<table border='1' cellspacing='4' cellpadding='3'>
	<tr ><td >Enter ID : <input type='text' value='' name='txtrno'/></td></tr>
	<tr ><td >Enter Name : <input type='text' value='' name='txtname'/> </td></tr>
	<tr><td><input type ='submit' value='INSERT' name='btn'/> <input type ='submit' value='VIEW' name='btn'/> <input type ='submit' value='UPDATE' name='btn'/><input type ='submit' value='DELETE' name='btn'/></td></tr>
	</table>
	</form>
            </div>
                
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
        if(button.equals("INSERT"))
        {
		if(r!="" && n!="")
		{
        	PreparedStatement ps=conn.prepareStatement("insert into stdnt values(?,?)");
        	ps.setString(1, r);
        	ps.setString(2, n);
       
        	int i=ps.executeUpdate();
        
         	 if(i>0)
          	{
                    out.print("<script>alert('record insert successfully')</script>");
                }
                 }
                
                else
                {
                    out.print("<script>alert('Please Enter the id. and Name')</script>");
                    conn.close();
                }
        } 
        else if(button.equals("UPDATE"))
        {
          if(r=="")
		{
		out.print("<script>alert('Enter the Roll No First to Update the Record')</script>");
		}
                else
          {
		PreparedStatement ps=conn.prepareStatement("update stdnt set name='"+n+"' where id='"+r+"'");
        	       
        	int i=ps.executeUpdate();
        
         	 if(i>0)
          	{
           	 out.print("<script>alert('Student Record Updated Successfully.')</script>");  
                }
          }
        }
        else if(button.equals("DELETE"))
	{
		if(r=="")
		{                  
		out.print("<script>alert('Enter the id First to delete the Record')</script>");
		}
                else{
		PreparedStatement ps=conn.prepareStatement("delete from stdnt where id='"+r+"'");
        	       
        	int i=ps.executeUpdate();
        
         	 if(i>0)
          	{
           	 out.print("<script>alert('Student Record Deleted Successfully.')</script>");
                }
                }
        }
       else if(button.equals("VIEW"))
        {
                response.sendRedirect("view_record.jsp");
        
          }
        conn.close();
        }catch(Exception se)
        	{
            	se.printStackTrace();
   
        	}
       %>



