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
<!-- #include file="inkl/val_scene.asp" -->

<%
	c34 = chr(34)
	if Request("Action") = "Ændre" then
		set rs = Server.CreateObject("ADODB.Recordset")
		sid = Request.Form("isid")
		rs.Open "tbScene", Conn, adOpenStatic, adLockPessimistic
		'### Fill fields from form to recordset
		rs("BogID") = Session.Contents("bogid")
		rs("BrugerID") = Session.Contents("userid")
		rs("AendretDato") = fFormatDateFrm2DB(Request.Form("iaendretdato"))
		rs("RkFlg") = Request.Form("irkflg")
		rs("Titel") = Request.Form("ititel")
		rs("Tekst") = Request.Form("itekst")
		rs("StatusID") = Request.Form("istatusid")
		rs.Update
		rs.Close
		set rs = Nothing
		response.redirect("scene_list.asp")
	else
		sid = Request.QueryString("sid")
		'### Læs scenen fra tbScene.
		strSQL = "SELECT * FROM tbScene WHERE (SceneID = " & sid & ") AND (BrugerID = " & Session.Contents("userid") & ") "
		Set rs = Conn.Execute(strSQL)
		'### Fyld felter med default værdier
		fsid = rs("SceneID")
		faendretdato = fFormatDateDate2Frm(Date())
		frkflg = rs("RkFlg")
		ftitel = rs("Titel")
		ftekst = rs("Tekst")
		fstatusid = rs("StatusID")
%>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Ændre teksten til en scene.</h2>
		<form name="frmScene" method="post" action="<%=request.servervariables("PATH_INFO")%>" onsubmit="return ValidateScene();">
			<p><label>&nbsp;RkFlg</label><input class="w3-input w3-border" type="text" placeholder="RkFlg" readonly name="irkflg" value="<%=frkflg%>" style="width:20%"></p>
			<p><label>&nbsp;Titel</label><input class="w3-input w3-border" type="text" placeholder="Titel" required name="ititel" value="<%=ftitel%>" autofocus></p>
			<p>
				<label>&nbsp;Tekst</label>
				<textarea class="w3-input w3-border" type="text" rows="10" placeholder="Tekst" required name="itekst" id="tekstfelt" maxlength="40000"><%=ftekst%></textarea>
				<div id="live-counter" class="w3-right-align">
					<span id="char-length">0</span>
					<span id="maximum">/ 40.000</span>
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
			<input type="hidden" name="isid" value="<%=fsid%>">
			<input type="hidden" name="iaendretdato" value="<%=faendretdato%>">
			<button type="submit" class="w3-button w3-green w3-quarter" name="Action" value="Ændre">Ændre scene</button>
			<div class="w3-container w3-half" name="Action">&nbsp;</div>
			<a href="scene_list.asp" class="w3-button w3-green w3-quarter" alt="Fortryd">Fortryd</a>
		</form>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<%
	end if
%>

<!-- #include file="inkl/chr_count.js" -->

<!-- #include file="inkl/footer.asp" -->
