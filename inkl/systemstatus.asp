<%
	'### Check if database is open and can be used
	if Session.Contents("dbopen") = 1 then
		'### Do nothing!
	Else
		If Session.Contents("AccessLevel") < 100 then
			Response.Redirect("closed.asp")
		Else
			'### Do nothing!
		End if
	End If
%>
