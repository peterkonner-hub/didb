<!-- Kommer hertil fra tidslinje_list.asp -->

<%
	if Session.Contents("accesslevelnum") < 50 then
		Response.Redirect("err_general.asp?errnr=5")
	end if
%>

<!-- #include file="inkl/init_db.asp" -->

<%
	c34 = chr(34)
	tid = Request.QueryString("tid")
	dir = Request.QueryString("d")
	if (dir <> "d") and (dir <> "u") then 
		Response.Redirect("err_general.asp?errnr=6")
	end if
	strSQL = "SELECT * FROM tbTidslinje WHERE (TidslinjeID = " & tid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
	set rs = Conn.Execute(strSQL)
	RkFlg1 = rs("RkFlg")
	if (rs.BOF AND rs.EOF) OR (tid = 0) then
		'### Bog ikke fundet, luk recordset og vis en fejl
		rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		Response.Redirect("err_general.asp?errnr=8")
	else
		'### Ryk rundt på rækkefølgen
		if dir = "u" then
			strSQL = "UPDATE tbTidslinje SET RkFlg = 0 WHERE (TidslinjeID = " & tid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbTidslinje SET RkFlg = " & rkflg1 & " WHERE (BrugerID = " & Session.Contents("userid") & ") AND (RkFlg = " & (rkflg1 - 1) & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbTidslinje SET RkFlg = " & (rkflg1 - 1) & " WHERE (TidslinjeID = " & tid & ") "
			set rs = Conn.Execute(strSQL)
		else
			strSQL = "UPDATE tbTidslinje SET RkFlg = 0 WHERE (TidslinjeID = " & tid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbTidslinje SET RkFlg = " & rkflg1 & " WHERE (BrugerID = " & Session.Contents("userid") & ") AND (RkFlg = " & (rkflg1 + 1) & ") "
			set rs = Conn.Execute(strSQL)
			strSQL = "UPDATE tbTidslinje SET RkFlg = " & (rkflg1 + 1) & " WHERE (TidslinjeID = " & tid & ") "
			set rs = Conn.Execute(strSQL)
		end if
		'rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		Response.Redirect("tidslinje_list.asp")
	end if
%>
