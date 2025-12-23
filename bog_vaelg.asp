<!-- Kommer hertil fra bog_list.asp -->

<%
	if Session.Contents("accesslevelnum") < 50 then
		Response.Redirect("err_general.asp?errnr=1")
	end if
%>

<!-- #include file="inkl/init_db.asp" -->

<%
	c34 = chr(34)
	bid = Request.QueryString("bid")
	strSQL = "SELECT * FROM tbBog WHERE (BogID = " & bid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
	set rs = Conn.Execute(strSQL)
	if (rs.BOF AND rs.EOF) OR (bid = 0) then
		'### Bog ikke fundet, luk recordset og vis en fejl
		rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		response.redirect("err_general.asp?errnr=4")
	else
		Session.Contents("bogid") = rs("BogID")
		Session.Contents("bogtitel") = rs("Titel")
		'### Bogen er fundet OK
		rs.Close
		set rs = Nothing
		Conn.Close
		set Conn = Nothing
		response.redirect("bog_list.asp")
	end if
%>
