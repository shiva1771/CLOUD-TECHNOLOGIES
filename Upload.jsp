<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Data Provider :: SDS</title>
<meta name="keywords" content="star, css templates, CSS, HTML" />
<meta name="description" content="Star is a free CSS template from templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style2 {
	color: #FF0000;
	font-weight: bold;
	font-size: 36px;
}
.style3 {color: #FF0000}
-->
</style>
</head>
<body>
<div id="templatemo_wrapper">
	<div id="templatemo_left_column">
        <div id="site_title">
            <h1><a href="http://www.tmksinfotech.com" target="_parent"><span>Achieving Efficient Secure Deduplication With User Defined Access Control in Cloud</span></a></h1>
            <p>&nbsp;</p>
        </div> <!-- end of site_title -->
        
        <div id="templatemo_sidebar">
        
        	<div class="service_section">
            
            	<h2>Data Provider Main </h2>
        
                <ul class="service_list">
                    <li><a href="#">Upload Data </a></li>
                    <li><a href="#">View Uploaded Files </a></li>
                    <li><a href="#">View Secret Key Generated  </a></li>
                    <li><a href="#">Update ciphertext  </a></li>
                    <li><a href="index.html">Logout</a></li>
                </ul>

			</div>
            
      </div>
	</div> <!-- end of left column -->
    
    <div id="templatemo_right_column">
    
    	<div id="templatemo_menu">
    
            <ul>
                <li><a href="" target="_parent" >Home</a></li>
                <li><a href="DataProviderMain.jsp" target="_parent" class="current">Data Provider </a></li>
                <li><a href="" target="_parent">Storage Server </a></li>
                <li><a href="">Key Authority </a></li>
                <li><a href="" target="_parent">Users</a></li>
                
            </ul>
        
        </div> <!-- end of templatemo_menu -->
        
        <div id="templatemo_content_wrapper">
        
        	<div id="templatemo_content">
       			
                <h2>
              <% String dp=(String)application.getAttribute("owner");
				
				    
				
				 %></h2>
                <p class="style2">Upload Data</p>
                <p> <%

      	try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
			
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			String owner = (String) application.getAttribute("owner");
			String user = (String) application.getAttribute("user");
			String task="Upload";
			
			connection.createStatement().executeUpdate("insert into  ownerfiles(fname,owner,ct,dt) values ('"+file+"','"+owner+"','"+cont+"','"+dt+"')");
			String strQuery2 = "insert into transaction(user,fname,task,dt) values('"+owner+"','"+file+"','"+task+"','"+dt+"')";
				connection.createStatement().executeUpdate(strQuery2);
				
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
      		
			String filenam = new String(Base64.encode(file.getBytes()));
			
      		PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
      		String query="Select * from cloudserver where hcode='"+h1+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			if ( rs.next() )
			{%>
	
	                 <h2>FOUND DEDUPLICATION ON THIS FILE !!! TRY ANOTHER FILE !!!</h2>
	       <%
		   
		   Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  dedup_files(oname,fname,hcode,dt) values ('"+owner+"','"+file+"','"+h1+"','"+dt+"')"); 
		   
		   }
		   else
		   {
%>
            <form action="Upload1.jsp" method="post">
              <table width="598" border="1" align="center">
                <tr>
                  <td width="286"><span class="style4">File Name :- </span></td>
                  <td width="356"><input name="t42" type="text" id="t42" size="50" value="<%= filenam %>" readonly="readonly" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><textarea name="text2" cols="50" rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
                </tr>
				
				<tr>
                  <td><span class="style3">Hahs Code-MAC</span></td>
                  <td width="356"><input name="hcode" type="text" id="t42" size="50" value="<%= h1 %>" readonly="readonly" /></td>
                </tr>

                <tr>
                  <td><div align="right"> </div></td>
                  <td><input type="submit" name="Submit2" value="Upload" /></td>
                </tr>
              </table>
            </form>
            <%
			}
	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%></p>
                <div class="button"><a href="#">SDS</a></div>
                
            </div>
        
        </div> <!-- end of templatemo_content_wrapper --><div id="templatemo_content_bottom"></div>
    
    </div>

</div> <!-- end of templatemo_wrapper -->

<div id="templatemo_footer_wrapper">

	</body>
</html>