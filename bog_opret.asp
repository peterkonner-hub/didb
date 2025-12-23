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
<!-- #include file="inkl/val_bog.asp" -->

<%
	c34 = chr(34)
	if Request("Action") = "Opret" then
		set rs = Server.CreateObject("ADODB.Recordset")
		'### Open table and add a new record
		rs.Open "tbBog", Conn, adOpenStatic, adLockPessimistic
		rs.AddNew
		'### Fill fields from form to recordset
		rs("BrugerID") = Session.Contents("userid")
		rs("OpretDato") = fFormatDateFrm2DB(Request.Form("iopretdato"))
		rs("AendretDato") = fFormatDateFrm2DB(Request.Form("iaendretdato"))
		rs("SletteDato") = fFormatDateFrm2DB(Request.Form("islettedato"))
		rs("FontFaceEditor") = Request.Form("ifontfaceeditor")
		rs("FontFaceScreen") = Request.Form("ifontfacescreen")
		rs("FontFacePrint") = Request.Form("ifontfaceprint")
		rs("FontSizeEditor") = Request.Form("ifontsizeeditor")
		rs("FontSizeScreen") = Request.Form("ifontsizescreen")
		rs("FontSizePrint") = Request.Form("ifontsizeprint")
		rs("RkFlg") = Request.Form("irkflg")
		rs("Titel") = Request.Form("ititel")
		rs("Beskrivelse") = Request.Form("ibeskrivelse")
		rs.Update
		rs.Close
		set rs = Nothing
		response.redirect("bog_list.asp")
	else
		'### Find antallet af bøger på brugeren
		strSQL = "SELECT count(*) AS BogAntal from tbBog WHERE BrugerID = " & Session.Contents("userid") & " "
		Set rs = Conn.Execute(strSQL)
		'### Fyld felter med default værdier
		fopretdato = fFormatDateDate2Frm(Date())
		faendretdato = fFormatDateDB2Frm(19700101)
		fslettedato = fFormatDateDB2Frm(19700101)
		frkflg = rs("BogAntal") + 1
		ftitel = ""
		fbeskrivelse = ""
		ffontsizeeditor = 10
		ffontsizescreen = 10
		ffontsizeprint = 10
		ffontfaceeditor = "Times New Roman"
		ffontfacescreen = "Times New Roman"
		ffontfaceprint = "Times New Roman"
%>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Opret en bog</h2>
		<p>Her kan du oprette en ny bog.<br>
		Giv den en sigende titel samt en kort beskrivelse af handlingen, fortæl om det overordnede plot osv.<br>
		Betragt det som bagsiden eller omslaget, der skal sælge bogen til læseren.</p>
		<form name="frmBog" method="post" action="<%=request.servervariables("PATH_INFO")%>" onsubmit="return ValidateBog();">
			<p><label>&nbsp;RkFlg</label><input class="w3-input w3-border" type="text" placeholder="RkFlg" readonly name="irkflg" value="<%=frkflg%>" style="width:20%"></p>
			<p><label>&nbsp;Titel</label><input class="w3-input w3-border" type="text" placeholder="Titel" required name="ititel" value="<%=ftitel%>" autofocus></p>
			<p>
				<label>&nbsp;Beskrivelse</label>
				<textarea class="w3-input w3-border" type="text" rows="10" placeholder="Beskrivelse" required name="ibeskrivelse" id="tekstfelt" maxlength="20000"><%=fbeskrivelse%></textarea>
				<div id="live-counter" class="w3-right-align">
					<span id="char-length">0</span>
					<span id="maximum">/ 20.000</span>
				</div>
			</p>
<!--
			<p>
	<table class="w3-table w3-bordered">
		<tr>
			<th class="w3-center">&nbsp;</th>
			<th>Editor</th>
			<th>Skærm</th>
			<th>Print</th>
		</tr>
		<tr>
			<td><b>Skriftstørrelse</b></td>
			<td>
				<select class="w3-select" name="ifontsizeeditor" required>
					<option value="1">10px</option>
					<option value="2">12px</option>
					<option value="3">14px</option>
				</select>
			</td>
			<td>
				<select class="w3-select" name="ifontsizescreen" required>
					<option value="1">10px</option>
					<option value="2">12px</option>
					<option value="3">14px</option>
				</select>
			</td>
			<td>
				<select class="w3-select" name="ifontsizeprint" required>
					<option value="1">10px</option>
					<option value="2">12px</option>
					<option value="3">14px</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><b>Skrifttype</b></td>
			<td>
				<select class="w3-select" name="ifontfaceeditor" required>
					<option value="1">Times New Roman</option>
					<option value="2">Garamond</option>
					<option value="3">14px</option>
				</select>
			</td>
			<td>
				<select class="w3-select" name="ifontfacescreen" required>
					<option value="1">Times New Roman</option>
					<option value="2">12px</option>
					<option value="3">14px</option>
				</select>
			</td>
			<td>
				<select class="w3-select" name="ifontfaceprint" required>
					<option value="1">Times New Roman</option>
					<option value="2">12px</option>
					<option value="3">14px</option>
				</select>
			</td>
		</tr>
	</table>
			</p>
-->
			<input type="hidden" name="iopretdato" value="<%=fopretdato%>">
			<input type="hidden" name="iaendretdato" value="<%=faendretdato%>">
			<input type="hidden" name="islettedato" value="<%=fslettedato%>">
			<input type="hidden" name="ifontsizeeditor" value="<%=ffontsizeeditor%>">
			<input type="hidden" name="ifontsizescreen" value="<%=ffontsizescreen%>">
			<input type="hidden" name="ifontsizeprint" value="<%=ffontsizeprint%>">
			<input type="hidden" name="ifontfaceeditor" value="<%=ffontfaceeditor%>">
			<input type="hidden" name="ifontfacescreen" value="<%=ffontfacescreen%>">
			<input type="hidden" name="ifontfaceprint" value="<%=ffontfaceprint%>">
			<button type="submit" class="w3-button w3-green w3-quarter" name="Action" value="Opret">Opret bog</button>
			<div class="w3-container w3-half" name="Action">&nbsp;</div>
			<a href="bog_list.asp" class="w3-button w3-green w3-quarter" alt="Fortryd">Fortryd</a>
		</form>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<%
	end if
%>

<!-- #include file="inkl/chr_count.js" -->

<!-- #include file="inkl/footer.asp" -->
