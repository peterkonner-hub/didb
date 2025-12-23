<!-- #include file="inkl/header.asp" -->

<div class="w3-container">

<table width="96%" border="0">
<tr><td>
<center>
System message<br>&nbsp;<br>

<!-- #include file="inkl/init_db.asp" -->

<%
	Session.Contents("jumpback") = ""
	'### Read info from tbSystem
	strSQL = "SELECT * FROM tbSystem"
	set rstc = Conn.Execute(strSQL)
	settmedd = rstc("NotifyText")
	settstatus = rstc("DbClosedYN")
	rstc.Close
	set rstc = Nothing
	if (settstatus <> "No") then
%>

<table cellpadding="3" cellspacing="0" border="1" width="80%">
  <tr>
    <td class="Error"><center>
      <b>WriterBase er p.t. lukket med flg. meddelelse:</b><br>&nbsp;<br>
      <%=settmedd%><br>&nbsp;<br><a href="default.asp">Forside</a></center>
    </td>
  </tr>
</table>
<br>
<%
	else
%>
<table cellpadding="3" cellspacing="0" border="1" width="80%">
  <tr>
    <td class="Error"><center>
      <b>Mulig server- eller databasefejl - kom venligst igen senere</b><br>&nbsp;<br>
Prøv igen - klik <a href="default.asp">her...</a>
      </center>
      </font>
    </td>
  </tr>
</table>
<br>
<%
	end if
%>
</center>
</td></tr>
</table>

</div>

<!-- #include file="inkl/footer.asp" -->