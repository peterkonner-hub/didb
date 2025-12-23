<%
	'### Reset session variables
	Session.Contents.RemoveAll()

	'### Reset cookie variables
	Response.Cookies("useremail") = ""
	Response.Cookies("useremail").Expires = date() - 1
	Response.Cookies("password") = ""
	Response.Cookies("password").Expires = date() - 1

	'### Jump to logon page
	response.redirect "default.asp"
%>
