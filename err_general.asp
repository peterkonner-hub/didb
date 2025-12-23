<!-- #include file="inkl/lib_functions.asp" -->
<!-- #include file="inkl/header.asp" -->
<!-- #include file="inkl/sub_header.asp" -->

<%
	c34 = chr(34)
	errnr = request.querystring("errnr")
	Select Case errnr
		Case 1
			ErrorHeader = "Den valgte funktion er ikke tilgængelig! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Den valgte funktion er p.t. ikke tilgængelig i systemet.<br>&nbsp;<br>"
			ErrorDetail2 = "Prøv igen på et senere tidspunkt.<br>&nbsp;<br>"
		Case 2
			ErrorHeader = "Bruger findes ikke eller er ikke aktiveret! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Den indtastede email er enten ikke oprettet eller ikke aktiveret.<br>&nbsp;<br>"
			ErrorDetail2 = "Indtast korrekt email eller prøv at oprette dig igen.<br>&nbsp;<br>"
		Case 3
			ErrorHeader = "Du er ikke logget på! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "For at benytte den valgte funktion, skal du være logget på.<br>&nbsp;<br>"
			ErrorDetail2 = "Vælg (Log på) i Bruger-menuen, eller opret dig som bruger.<br>&nbsp;<br>"
		Case 4
			ErrorHeader = "Bogen er ikke fundet! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Du har forsøgt at vælge en bog, der ikke findes.<br>&nbsp;<br>"
			ErrorDetail2 = "Vælg en bog fra listen ved at klikke på hjertet.<br>&nbsp;<br>"
		Case 5
			ErrorHeader = "Du har ikke tilladelse til at benytte denne funktion! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Funktionen kan være midlertidig spærret, eller kræve højere rettigheder.<br>&nbsp;<br>"
			ErrorDetail2 = "Prøv evt. igen på et senere tidspunkt.<br>&nbsp;<br>"
		Case 6
			ErrorHeader = "Forkerte parametre til flyt-funktionen! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Du har benyttet et link, der indeholder forkerte parametre.<br>&nbsp;<br>"
			ErrorDetail2 = "Prøv evt. igen på et senere tidspunkt.<br>&nbsp;<br>"
		Case 7
			ErrorHeader = "Kapitlet er ikke fundet! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Du har forsøgt at vælge et kapitel, der ikke findes.<br>&nbsp;<br>"
			ErrorDetail2 = "Gå retur til boglisten og vælg kapitler derfra.<br>&nbsp;<br>"
		Case 8
			ErrorHeader = "Scenen er ikke fundet! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = "Du har forsøgt at vælge en scene, der ikke findes.<br>&nbsp;<br>"
			ErrorDetail2 = "Gå retur til boglisten og vælg kapitler og scener derfra.<br>&nbsp;<br>"
		Case else
			ErrorHeader = "Ukendt fejl! [" & ZeroPadLeft(errnr, 4) & "]"
			ErrorDetail1 = ""
			ErrorDetail2 = ""
	End Select
%>

<br>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2><%=ErrorHeader%></h2>
		<p><%=ErrorDetail1%></p>
		<p><%=ErrorDetail2%></p>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<p><hr style="border: 1px solid black;"></p>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<br>

<!-- #include file="inkl/footer.asp" -->
