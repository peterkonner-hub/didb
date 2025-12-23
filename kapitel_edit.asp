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
<!-- #include file="inkl/val_kapitel.asp" -->

<%
	c34 = chr(34)
	if Request("Action") = "Ændre" then
		set rs = Server.CreateObject("ADODB.Recordset")
		kid = Request.Form("ikid")
		rs.Open "tbKapitel", Conn, adOpenStatic, adLockPessimistic
		'### Fill fields from form to recordset
		rs("BogID") = Session.Contents("bogid")
		rs("BrugerID") = Session.Contents("userid")
		rs("AendretDato") = fFormatDateFrm2DB(Request.Form("iaendretdato"))
		rs("RkFlg") = Request.Form("irkflg")
		rs("Titel") = Request.Form("ititel")
		rs("Noter") = Request.Form("inoter")
		rs("StatusID") = Request.Form("istatusid")
		rs.Update
		rs.Close
		set rs = Nothing
		response.redirect("kapitel_list.asp")
	else
		kid = Request.QueryString("kid")
		'### Læs kapitlet fra tbKapitel.
		strSQL = "SELECT * FROM tbKapitel WHERE (KapitelID = " & kid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
		Set rs = Conn.Execute(strSQL)
'### Ikke fundet => err_general=4
		'### Fyld felter med default værdier
		fkid = rs("KapitelID")
		faendretdato = fFormatDateDate2Frm(Date())
		frkflg = rs("RkFlg")
		ftitel = rs("Titel")
		fnoter = rs("Noter")
		fstatusid = rs("StatusID")
%>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Ændre beskrivelsen af et kapitel.</h2>
		<form name="frmKapitel" method="post" action="<%=request.servervariables("PATH_INFO")%>" onsubmit="return ValidateKapitel();">
			<p><label>&nbsp;RkFlg</label><input class="w3-input w3-border" type="text" placeholder="RkFlg" readonly name="irkflg" value="<%=frkflg%>" style="width:20%"></p>
			<p><label>&nbsp;Titel</label><input class="w3-input w3-border" type="text" placeholder="Titel" required name="ititel" value="<%=ftitel%>" autofocus></p>
			<p>
				<label>&nbsp;Noter</label>
				<textarea class="w3-input w3-border" type="text" rows="10" placeholder="Noter" required name="inoter" id="tekstfelt" maxlength="10000"><%=fnoter%></textarea>
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
			<input type="hidden" name="ikid" value="<%=fkid%>">
			<input type="hidden" name="iaendretdato" value="<%=faendretdato%>">
			<button type="submit" class="w3-button w3-green w3-quarter" name="Action" value="Ændre">Ændre kapitel</button>
			<div class="w3-container w3-half" name="Action">&nbsp;</div>
			<a href="kapitel_list.asp" class="w3-button w3-green w3-quarter" alt="Fortryd">Fortryd</a>
		</form>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<%
	end if
%>

<!-- #include file="inkl/chr_count.js" -->

<!-- #include file="inkl/footer.asp" -->
