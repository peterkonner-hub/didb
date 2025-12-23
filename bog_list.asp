<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/checkstart.asp" -->
<!-- #include file="inkl/systemstatus.asp" -->
<!-- #include file="inkl/loggedon.asp" -->
<!-- #include file="inkl/lib_functions.asp" -->
<!-- #include file="inkl/header.asp" -->
<!-- #include file="inkl/sub_header.asp" -->

<%
	if Session.Contents("accesslevelnum") < 10 then
		Response.Redirect("err_general.asp?errnr=5")
	end if
%>

<div class="w3-container">
	<h2>Mine bøger</h2>
</div>

<br>

<div class="w3-container">
	<a href="bog_opret.asp" class="w3-button w3-green" alt="Opret ny bog">Opret ny bog</a>
</div>

<br>

<div class="w3-container">
	<!-- Liste med alle oprettede bøger -->
	<table class="w3-table-all">
		<tr>
			<th class="w3-center">&nbsp;RkFlg&nbsp;</th>
			<th>Titel</th>
			<th class="w3-center">&nbsp;</th>
			<th>Beskrivelse</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
		</tr>
<%
	c34 = chr(34)
	strSQL = "SELECT MIN(RkFlg) as MinRkFlg, MAX(RkFlg) as MaxRkFlg FROM tbBog WHERE (BrugerID = " & Session.Contents("userid") & ") "
	set rs = Conn.Execute(strSQL)
	MinRkFlg = rs("MinRkFlg")
	MaxRkFlg = rs("MaxRkFlg")
	strSQL = "SELECT t2.*, (SELECT count(*) AS ant FROM tbKapitel t3 WHERE t3.BogID = t2.BogID) AS AntKapitler FROM tbBog t2 "
	strSQL = strSQL & "WHERE (t2.BrugerID = " & Session.Contents("userid") & ") ORDER BY RkFlg ASC "
	set rs = Conn.Execute(strSQL)
	Do until (rs.eof OR rs.BOF)
		'titel = Left(Server.HTMLEncode(rs("Titel")), 28)
		'beskr = Left(Server.HTMLEncode(rs("Beskrivelse")), 250)
		oplink0 = "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		oplink1 = "<a href=" & c34 & "bog_flyt.asp?bid=" & rs("BogID") & "&d=u" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 op" & c34 & "></i></a>"
		nedlink0 = "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		nedlink1 = "<a href=" & c34 & "bog_flyt.asp?bid=" & rs("BogID") & "&d=d" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 ned" & c34 & "></i></a>"
		titel = rs("Titel")
		beskr = rs("Beskrivelse")
		vaelglink = "<a href=" & c34 & "bog_vaelg.asp?bid=" & rs("BogID") & c34 & ">"
		chglink = "<a href=" & c34 & "bog_edit.asp?bid=" & rs("BogID") & c34 & ">"
		structlink = "<a href=" & c34 & "kapitel_list.asp?bid=" & rs("BogID") & c34 & ">"
		printlink = "<a href=" & c34 & "bog_print.asp?bid=" & rs("BogID") & c34 & ">"
		soeglink = "<a href=" & c34 & "bog_soeg.asp?bid=" & rs("BogID") & c34 & ">"
		if rs("AntKapitler") = 0 then
			dellink = "<a href=" & c34 & "bog_slet.asp?bid=" & rs("BogID") & c34 & "><i class=" & c34 & "fa fa-trash-o w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Slet!" & c34 & "></i></a>"
		else
			dellink = "<a href=" & c34 & "bog_gendan.asp?bid=" & rs("BogID") & c34 & "><i class=" & c34 & "fa fa-recycle w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Gendan" & c34 & "></i></a>"
		end if
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
<% if Session.Contents("BogID") = rs("BogID") then %>
      <td class="w3-center"><i class="fa fa-heart w3-margin-bottom w3-text-theme" style="font-size:22px" title="Valgt bog"></i></td>
<% else %>
      <td class="w3-center"><%=vaelglink%><i class="fa fa-heart-o w3-margin-bottom w3-text-theme" style="font-size:22px" title="Vælg"></i></a></td>
<% end if %>
      <td><%=beskr%></td>
      <td class="w3-center"><%=chglink%><i class="fa fa-edit w3-margin-bottom w3-text-theme" style="font-size:22px" title="Ændre beskrivelse m.m."></i></a></td>
      <td class="w3-center"><%=structlink%><i class="fa fa-sitemap w3-margin-bottom w3-text-theme" style="font-size:22px" title="Kapitler"></i></a></td>
      <td class="w3-center"><%=printlink%><i class="fa fa-print w3-margin-bottom w3-text-theme" style="font-size:22px" title="Print"></i></a></td>
      <td class="w3-center"><%=soeglink%><i class="fa fa-search w3-margin-bottom w3-text-theme" style="font-size:22px" title="Søg i hele bogen"></i></a></td>
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





