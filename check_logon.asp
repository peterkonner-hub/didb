<%
	'### Kommer hertil fra logon skærmbilledet = menuen på default.asp
	frmBruger = Trim(Replace(Request.Form("email"),"'","''"))
	frmPsw = Trim(Replace(Request.Form("psw"),"'","''"))
	Response.Cookies("useremail") = frmBruger
	Response.Cookies("useremail").Expires = date() + 365
	Response.Cookies("password") = frmPsw
	Response.Cookies("password").Expires = date() + 365
%>

<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/date_formats.asp" -->
<!-- #include file="inkl/sub_log.asp" -->

<%
	strSQL ="SELECT * FROM tbUser "
	strSQL = strSQL & "WHERE (Email ='" & frmBruger & "') AND (Password ='" & frmPsw & "')"
	Set rs = Conn.Execute(strSQL)
	If NOT(rs.BOF AND rs.EOF) Then
		'### User found
		if rs("ActiveYN") = "Yes" then
			Session.Contents("useremail") = rs("Email")
			Session.Contents("kaldenavn") = Server.HTMLEncode(rs("Kaldenavn"))
			Session.Contents("userid") = rs("UserID")
			Session.Contents("accesslevelnum") = rs("Adgangsniveau")
			Session.Contents("logon") = 1
			Session.Contents("password") = rs("Password")
			Session.Contents("ipadr") = Request.Servervariables("remote_addr")
			Session.Contents("jumpback") = ""
			Session.Contents("bogid") = 0
			Session.Contents("bogtitel") = Left("", 60)
			Session.Contents("kapitelid") = 0
			Session.Contents("kapiteltitel") = Left("", 60)
			Session.Contents("sceneid") = 0
			Session.Contents("systemstatus") = ""
			sdato = rs("LastLogon")
			set rs = Nothing
			ndato = fFormatDateDate2DB(Date)
			if sdato = 0 then
				sdato = ndato
			end if
			'### Update record with info for time-of-logon:
			strSQL = "UPDATE tbUser SET LastLogon = " & ndato & ", PrevLogon = " & sdato & " "
			strSQL = strSQL & "WHERE UserID = " & Session.Contents("userid")
			'response.write "[" & sdato & ": " & strSQL & "]"
			set rs = Conn.Execute(strSQL)
			'### It went well...we guess!
			'rs.Close
			Set rs = Nothing
			Call CreateLogEntry("U", "Logged on successfully", "")
			Conn.Close
			Set Conn = Nothing
			Response.Redirect("main.asp")
		else   '### User found, but is inactive and/or not verified
			rs.Close
			Set rs = Nothing
			Conn.Close
			Set Conn = Nothing
			Session.Contents.RemoveAll()
			Response.Redirect("err_general.asp?errnr=2")
		end if
	else
		'### User not found
		rs.Close
		Set rs = Nothing
		Conn.Close
		Set Conn = Nothing
		'Session.Contents.RemoveAll()
		Response.Redirect("err_general.asp?errnr=2")
	end if
%>
