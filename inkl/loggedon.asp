<%
	'### Check if user has logged on
	if (Session.Contents("logon") = 1) then
		'### Do nothing!
	Else
		Response.Redirect("err_general.asp?errnr=3")
	End If
%>
