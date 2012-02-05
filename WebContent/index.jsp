<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.inc"></jsp:include>

<b>How it works:</b>
<ol>
<li>You create an account and sign in</li>
<li>You enter your computers' information (IP, port and MAC address)</li>
<li>Next you have the option to either have your systems sleep on their own, or you can have a supplimentry program run on each of your computer systems, which will listen for the sleep command from our server.</li>
<li>Install our app on your android</li>
<li>Configure your firewall to forward ports to your systems</li>
<li>Using a smart phone (Android for the alpha version), we are able to use GPS to detect when you leave your home (based on a half mile square radius). When you leave the radius, if you have your system targetted as a "automated sleep" then our server will send the sleep command to your system.</li>
<li>Using a smart phone (Android for the alpha version), we are able to use GPS to detect when you come near your home (based on a half mile square radius). When you leave the radius, if you have your system targetted as a "automated wake" then our server will send a Wake On LAN packet to each of your system designated.</li>
</ol>

That simple. Once you've set everything up, you can either control things manually, allow our system to help you save energy, or do a hybrid of the two!<BR>

<center><h3>What would you like to do?</h3>
<table border="1">
	<tr>
		<td> &nbsp; &nbsp; &nbsp; <b><a href="signup.jsp">Create an Account</a></b> &nbsp; &nbsp; &nbsp; </td>
		<td> &nbsp; &nbsp; &nbsp; <b><a href="login.jsp">Sign In</a></b> &nbsp; &nbsp; &nbsp; </td>
	</tr>
</table>
</center>

<jsp:include page="footer.inc"></jsp:include>
