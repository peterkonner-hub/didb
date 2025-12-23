<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/checkstart.asp" -->
<!-- #include file="inkl/systemstatus.asp" -->
<!-- #include file="inkl/loggedon.asp" -->
<%
	if Session.Contents("accesslevelnum") < 10 then
		Response.Redirect("err_general.asp?errnr=5")
	end if
%>
<!-- #include file="inkl/date_formats.asp" -->
<!-- #include file="inkl/lib_functions.asp" -->
<!-- #include file="inkl/header.asp" -->
<!-- #include file="inkl/sub_header.asp" -->
<!-- #include file="inkl/val_tidslinje.asp" -->

<%
	c34 = chr(34)
	if Request("Action") = "Ændre" then
		set rs = Server.CreateObject("ADODB.Recordset")
		tid = Request.Form("itid")
		rs.Open "SELECT * FROM tbTidslinje WHERE TidslinjeID = " & tid, Conn, adOpenStatic, adLockPessimistic
		'### Fill fields from form to recordset
		rs("AendretDato") = fFormatDateFrm2DB(Request.Form("iaendretdato"))
		rs("RkFlgKrono") = Request.Form("irkflgkrono")
		rs("RkFlg") = Request.Form("irkflg")
		rs("Beskrivelse") = Request.Form("ibeskrivelse")
		rs("StatusID") = Request.Form("istatusid")
		rs.Update
		rs.Close
		set rs = Nothing
		response.redirect("tidslinje_list.asp")
	else
		tid = Request.QueryString("tid")
		'### Læs tidslinjen fra tbTidslinje.
		strSQL = "SELECT * FROM tbTidslinje WHERE (TidslinjeID = " & tid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
		Set rs = Conn.Execute(strSQL)
		'### Fyld felter med default værdier
		ftid = rs("TidslinjeID")
		faendretdato = fFormatDateDate2Frm(Date())
		frkflg = rs("RkFlg")
		frkflgkrono = rs("RkFlgKrono")
		fbeskrivelse = rs("Beskrivelse")
		fstatusid = rs("StatusID")
%>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Ændre et punkt på tidslinjen</h2>
		<p>Her kan du ændre et punkt på tidslinjen.</p>
		<form name="frmTidslinje" method="post" action="<%=request.servervariables("PATH_INFO")%>" onsubmit="return ValidateTidslinje();">
			<p><label>&nbsp;RkFlg</label><input class="w3-input w3-border" type="text" placeholder="RkFlg" readonly name="irkflg" value="<%=frkflg%>" style="width:20%"></p>
			<p>
				<label>&nbsp;Beskrivelse</label>
				<textarea class="w3-input w3-border" type="text" rows="10" placeholder="Beskrivelse" required name="ibeskrivelse" id="tekstfelt" maxlength="10000" autofocus><%=fbeskrivelse%></textarea>
				<div id="live-counter" class="w3-right-align">
					<span id="char-length">0</span>
					<span id="maximum">/ 10.000</span>
				</div>
			</p>
			<p>
				<label>&nbsp;Status</label>
				<select class="w3-select" name="istatusid" required>
<%
	strSQL = "SELECT StatusID, StatusText FROM tbStatus ORDER BY Sekvens "
	Set rs = Conn.Execute(strSQL)
		if (rs.BOF AND rs.EOF) then
			'### Error: No records?
		else
			rs.MoveFirst
			while not rs.EOF
				if rs("StatusID") = fstatusid then
					seltxt = " selected"
				else
					seltxt = ""
				end if
				response.write "<option value=" & c34 & rs("StatusID") & c34 & seltxt & "> " & rs("StatusText") & " </option>" & vbCrLf
				rs.MoveNext
			wend
		end if
		rs.Close
%>
				</select>
				<br>
			</p>
			<br>
			<input type="hidden" name="itid" value="<%=ftid%>">
			<input type="hidden" name="iaendretdato" value="<%=faendretdato%>">
			<input type="hidden" name="irkflgkrono" value="<%=frkflgkrono%>">
			<button type="submit" class="w3-button w3-green w3-quarter" name="Action" value="Ændre">Ændre punkt</button>
			<div class="w3-container w3-half" name="Action">&nbsp;</div>
			<a href="tidslinje_list.asp" class="w3-button w3-green w3-quarter" alt="Fortryd">Fortryd</a>
		</form>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<%
	end if
%>

<!-- #include file="inkl/chr_count.js" -->

<!-- #include file="inkl/footer.asp" -->
