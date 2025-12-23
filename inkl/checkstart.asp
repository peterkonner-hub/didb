<%
	'### Read system info from tbSystem
	strSQL = "SELECT * FROM tbSystem"
	set rs = Conn.Execute(strSQL)
	settstatus = rs("DbClosedYN")
	Session.Contents("systemstatus") = rs("SystemStatus")
	rs.Close
	set rs = Nothing
	if settstatus = "No" then
		Session.Contents("dbopen") = 1
	else
		Session.Contents("dbopen") = 0
	end if
	Session.TimeOut=480    '### Let the session last for 8 hours
%>