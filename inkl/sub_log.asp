<%
	'### Calling this subroutine:
	'### Call CreateLogEntry("", "", "")
	Sub CreateLogEntry(lt, ac1, ac2)
		'set rs = Server.CreateObject("ADODB.Recordset")
		'### Open table and add a new record
		'rs.Open "tbLog", Conn, adOpenStatic, adLockPessimistic
		'rs.AddNew
		'### Fill fields from parameters to recordset
		'rs("LogDate") = fFormatDateDate2DB(Date())
		'rs("LogTime") = fFormatTimeTime2DB(Time())
		'rs("UserID") = Session.Contents("userid")
		'rs("LogType") = lt
		'rs("LogAction1") = ac1
		'rs("LogAction2") = ac2
		'rs("SystemStatus") = Session.Contents("systemstatus")
		'rs.Update
		'rs.Close
		'set rs = Nothing
	end sub  
%>
