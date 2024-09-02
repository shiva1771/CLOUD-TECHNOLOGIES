<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home Page:: SDS</title>
<meta name="keywords" content="star, css templates, CSS, HTML" />
<meta name="description" content="Star is a free CSS template from templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>
<body>
<div id="templatemo_wrapper">
	<div id="templatemo_left_column">
        <div id="site_title">
            <h1><a href="http://www.templatemo.com/page/1" target="_parent"><span>Achieving Efficient Secure Deduplication With User Defined Access Control in Cloud</span></a></h1>
            <p>&nbsp;</p>
        </div> <!-- end of site_title -->
        
        <div id="templatemo_sidebar">
        
        	<div class="service_section">
            
            	<h2>End User Menu</h2>
        
                <ul class="service_list">
                    <li><a href="EndUserMain.jsp">Home</a></li>
                  
            		<li><a href="index.html">Log Out </a></li>
                    
                </ul>

			</div>
            
      </div>
	</div> <!-- end of left column -->
    
    <div id="templatemo_right_column">
    
    	<div id="templatemo_menu">
    
            <ul>
                <li><a href="index.html" target="_parent" >Home</a></li>
               <li><a href="DataProvider.html" target="_parent">Data Provider </a></li>
                <li><a href="Storage_Server.html" target="_parent">CSP </a></li>
                <li><a href="Key_Authority.html">KGC </a></li>
                <li><a href="Users.html" target="_parent" class="current">Users</a></li>
                
            </ul>
        
        </div> <!-- end of templatemo_menu -->
        
        <div id="templatemo_content_wrapper">
        
       	  <div id="templatemo_content">
       			
                <h2>Request Secret Key </h2> 
                <%String user =(String) application.getAttribute("user");%>
          <form id="form" name="form1" method="post" action="Download1.jsp">
            <label>
            <div class="article">
              <h2><span class="style2">Enter File Name &amp; Secret Key  </span>:: </h2>
              <p>&nbsp;</p>
              <table width="478" border="0" align="center">
                <tr>
                  <td bgcolor="#00FFFF"><span class="style2 style6"><strong>User Name :-</strong></span></td>
                  <td><label>
                    <input required="required" name="t2" type="text" value="<%=user%>" size="40" />
                  </label></td>
                </tr>
                <tr>
                  <td bgcolor="#00FFFF"><span class="style2 style6"><strong>Enter File Name :-</strong></span></td>
                  <td><label>
                    <input required="required" name="t1" type="text" value="" size="40" />
                  </label></td>
                </tr>

                <tr>
                  <td width="223" bgcolor="#00FFFF"><span class="style2 style6"><strong>Secret Key :-</strong></span></td>
                  <td width="245"><input required name="t13" type="text" size="40" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><div align="right"></div></td>
                  <td><label>
                    <input type="submit" name="Submit" value="DECRYPT & DOWNLOAD" />
                  </label></td>
                </tr>
              </table>
            </div>
            </label>
            </form>
                <strong></strong><br />
</p>
<h2>&nbsp;</h2>
            </div>
        
        </div> 
    </div>

</div> <!-- end of templatemo_wrapper -->

<div id="templatemo_footer_wrapper">

	</body>
</html>