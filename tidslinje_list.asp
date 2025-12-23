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
	<h2>Tidslinje for <u><%=Session.Contents("bogtitel")%></u></h2>
</div>

<br>

<div class="w3-container">
	<a href="tidslinje_opret.asp" class="w3-button w3-green" alt="Opret nyt punkt">Opret nyt punkt</a>
</div>

<br>

<div class="w3-container">
	<!-- Liste med alle oprettede bøger -->
	<table class="w3-table-all">
		<tr>
			<th class="w3-center">&nbsp;RkFlg&nbsp;</th>
			<th>Hændelse</th>
			<th>Status</th>
			<th class="w3-center">&nbsp;</th>
			<th class="w3-center">&nbsp;</th>
		</tr>
<%
	c34 = chr(34)
	strSQL = "SELECT MIN(RkFlg) as MinRkFlg, MAX(RkFlg) as MaxRkFlg FROM tbTidslinje WHERE (BogID = " & Session.Contents("bogid") & ") "
	set rs = Conn.Execute(strSQL)
	MinRkFlg = rs("MinRkFlg")
	MaxRkFlg = rs("MaxRkFlg")
	strSQL = "SELECT t8.*, t9.StatusText, t9.KlarmeldtJN FROM tbTidslinje t8 LEFT JOIN tbStatus t9 ON (t8.StatusID = t9.StatusID) WHERE "
	strSQL = strSQL & "(t8.BogID = " & Session.Contents("bogid") & ") AND (t8.BrugerID = " & Session.Contents("userid") & ") ORDER BY t8.RkFlg "
	set rs = Conn.Execute(strSQL)
	Do until (rs.eof OR rs.BOF)
		oplink0 = "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		oplink1 = "<a href=" & c34 & "tidslinje_flyt.asp?tid=" & rs("TidslinjeID") & "&d=u" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-up w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 op" & c34 & "></i></a>"
		nedlink0 = "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme w3-opacity" & c34 & " style=" & c34 & "font-size:22px" & c34 & "></i>"
		nedlink1 = "<a href=" & c34 & "tidslinje_flyt.asp?tid=" & rs("TidslinjeID") & "&d=d" & c34 & ">" & "<i class=" & c34 & "fa fa-caret-down w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Flyt 1 ned" & c34 & "></i></a>"
		chglink = "<a href=" & c34 & "tidslinje_edit.asp?tid=" & rs("TidslinjeID") & c34 & ">"
		dellink = "<a href=" & c34 & "tidslinje_slet.asp?tid=" & rs("TidslinjeID") & c34 & "><i class=" & c34 & "fa fa-trash-o w3-margin-bottom w3-text-theme" & c34 & " style=" & c34 & "font-size:22px" & c34 & " title=" & c34 & "Slet!" & c34 & "></i></a>"
		beskr = rs("Beskrivelse")
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
	  
      <td><%=beskr%></td>
      <td><%=status%></td>
      <td class="w3-center"><%=chglink%><i class="fa fa-edit w3-margin-bottom w3-text-theme" style="font-size:22px" title="Ændre"></i></a></td>
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





