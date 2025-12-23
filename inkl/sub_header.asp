<div class="w3-row">
	<div class="w3-container w3-paper w3-left-align w3-small">
<%	if Session.Contents("logon") = 1 then %>
		<p class="w3-opacity">Aktuel bog:&nbsp;
<%
			if (Session.Contents("bogid") = 0) then
				Response.Write("(ingen bog valgt)")
			else
				Response.Write Session.Contents("bogtitel")
			end if
%>
		</p>
<% else %>
		<p class="w3-opacity">-</p>
<% end if %>
	</div>
</div>
