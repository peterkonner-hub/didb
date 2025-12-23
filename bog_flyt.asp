<!-- Kommer hertil fra bog_list.asp -->

<%
	if Session.Contents("accesslevelnum") < 50 then
		Response.Redirect("err_general.asp?errnr=5")
	end if
%>

<!-- #include file="inkl/init_db.asp" -->

<%
	c34 = chr(34)
	bid = Request.QueryString("bid")
	dir = Request.QueryString("d")
	if (dir <> "d") and (dir <> "u") then 
		Response.Redirect("err_general.asp?errnr=6")
	end if
	strSQL = "SELECT * FROM tbBog WHERE (BogID = " & bid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
	set rs = Conn.Execute(strSQL)
	RkFlg1 = rs("RkFlg")
	if (rs.BOF AND rs.EOF) OR (bid = 0) then
		'### Bog ikke fundet, luk recordset og vis en fejl
		rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		Response.Redirect("err_general.asp?errnr=4")
	else
		'### Ryk rundt på rækkefølgen
		if dir = "u" then
			strSQL = "UPDATE tbBog SET RkFlg = 0 WHERE (BogID = " & bid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbBog SET RkFlg = " & rkflg1 & " WHERE (BrugerID = " & Session.Contents("userid") & ") AND (RkFlg = " & (rkflg1 - 1) & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbBog SET RkFlg = " & (rkflg1 - 1) & " WHERE (BogID = " & bid & ") "
			set rs = Conn.Execute(strSQL)
		else
			strSQL = "UPDATE tbBog SET RkFlg = 0 WHERE (BogID = " & bid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbBog SET RkFlg = " & rkflg1 & " WHERE (BrugerID = " & Session.Contents("userid") & ") AND (RkFlg = " & (rkflg1 + 1) & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbBog SET RkFlg = " & (rkflg1 + 1) & " WHERE (BogID = " & bid & ") "
			set rs = Conn.Execute(strSQL)
		end if
		'rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		Response.Redirect("bog_list.asp")
	end if
%>
