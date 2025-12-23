<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/checkstart.asp" -->
<!-- #include file="inkl/systemstatus.asp" -->
<!-- #include file="inkl/loggedon.asp" -->
<!-- #include file="inkl/lib_functions.asp" -->

<%
	if Session.Contents("accesslevelnum") < 10 then
		Response.Redirect("err_general.asp?errnr=5")
	end if

	c34 = chr(34)
	'### Hvis Session.Contents("bogid") <> Request.QueryString(bid) så
	'  Ændre den valgte bog for brugeren
	'bid = Request.QueryString("bid")
	'if bid = "" then 
	'	bid = Session.Contents("bogid")
	'end if
	'strSQL = "SELECT * FROM tbBog WHERE (BogID = " & bid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
	'set rs = Conn.Execute(strSQL)
	'if (rs.BOF AND rs.EOF) OR (bid = 0) then
	'	'### Bog ikke fundet, luk recordset og vis en fejl
	'	rs.Close
	'	set rs = Nothing
	'	Conn.Close
	'	set Conn = Nothing
	'	response.redirect("err_general.asp?errnr=1")
	'else
	'	Session.Contents("bogid") = rs("BogID")
	'	Session.Contents("bogtitel") = rs("Titel")
	'	'### Bogen er fundet OK
	'	rs.Close
	'	set rs = Nothing
	'end if
%>

<!-- #include file="inkl/header.asp" -->
<!-- #include file="inkl/sub_header.asp" -->

<div class="w3-container">
	<h2>Scener <u><%=Session.Contents("bogtitel")%></u>, kapitel <u><%=Session.Contents("kapiteltitel")%></u></h2>
</div>

<br>

<div class="w3-container">
	<a href="scene_opret.asp" class="w3-button w3-green" alt="Opret nyt punkt">Opret ny scene</a>
</div>

<br>

<div class="w3-container">
	<!-- Liste med alle oprettede scener -->
	<table class="w3-table-all">
		<tr>
			<th class="w3-center">&nbsp;RkFlg&nbsp;</th>
			<th>Titel</th>
			<th>Tekst</th>
			<th>Status</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
		</tr>
<%
	strSQL = "SELECT MIN(RkFlg) as MinRkFlg, MAX(RkFlg) as MaxRkFlg FROM tbScene WHERE (KapitelID = " & Session.Contents("kapitelid") & ") "
	set rs = Conn.Execute(strSQL)
	MinRkFlg = rs("MinRkFlg")
	MaxRkFlg = rs("MaxRkFlg")
	strSQL = "SELECT t4.*, t9.StatusText, t9.KlarmeldtJN FROM tbScene t4 LEFT JOIN tbStatus t9 ON (t4.StatusID = t9.StatusID) WHERE "
	strSQL = strSQL & "(t4.KapitelID = " & Session.Contents("kapitelid") & ") AND (t4.BrugerID = " & Session.Contents("userid") & ") ORDER BY t4.RkFlg "
	set rs = Conn.Execute(strSQL)
	Do until (rs.eof OR rs.BOF)
		oplink0 = "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		oplink1 = "<a href=" & c34 & "kapitel_flyt.asp?kid=" & rs("KapitelID") & "&d=u" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 op" & c34 & "></i></a>"
		nedlink0 = "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		nedlink1 = "<a href=" & c34 & "kapitel_flyt.asp?kid=" & rs("KapitelID") & "&d=d" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 ned" & c34 & "></i></a>"
		chglink = "<a href=" & c34 & "kapitel_edit.asp?kid=" & rs("KapitelID") & c34 & ">"
		dellink = "<a href=" & c34 & "kapitel_slet.asp?kid=" & rs("KapitelID") & c34 & "><i class=" & c34 & "fa fa-trash-o w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Slet!" & c34 & "></i></a>"
		'scenelink = "<a href=" & c34 & "scene_list.asp?kid=" & rs("KapitelID") & c34 & ">"
		titel = rs("Titel")
		tekst = rs("Tekst")
		status = rs("StatusText")
%>
		<tr>
<%
	if rs("RkFlg") = MinRkFlg then
		op0 = TRUE
	else
		op0 = FALSE
	end if
	if rs("RkFlg") = MaxRkFlg then
		ned0 = TRUE
	else
		ned0 = FALSE
	end if
%>
	  
	<td class="w3-center">
<% 
	if (op0 = TRUE) then 
		Response.Write oplink0
	else
		Response.Write oplink1
	end if
	Response.Write "&nbsp"
	if (ned0 = TRUE) then 
		Response.Write nedlink0
	else
		Response.Write nedlink1
	end if
%>
	</td>
	  
      <td><%=titel%></td>
      <td><%=tekst%></td>
      <td><%=status%></td>
      <td class="w3-center"><%=chglink%><i class="fa fa-edit w3-margin-bottom w3-text-theme" style="font-size:22px" title="Ændre"></i></a></td>
      <td class="w3-center"><%=scenelink%><i class="fa fa-tasks w3-margin-bottom w3-text-theme" style="font-size:22px" title="Scener"></i></a></td>
      <td class="w3-center"><%=dellink%></td>
    </tr>
<%
		rs.MoveNext
	Loop
	rs.Close
	Set rs = Nothing
	Conn.Close
	Set Conn = Nothing
%>	

  </table>

</div>

<!-- #include file="inkl/footer.asp" -->
