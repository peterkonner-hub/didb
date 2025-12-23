<!-- #include file="inkl/lib_functions.asp" -->
<!-- #include file="inkl/header.asp" -->
<!-- #include file="inkl/sub_header.asp" -->

<br>

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Denne service er gratis...</h2>
		<p>...men det skal ikke være nogen hemmelighed, at det koster penge at drive denne hjemmeside.<br>
Alle donationer vil gå ubeskåret til betaling af domæne, udvidet serverplads og den fortsatte udvikling.<br>
Enhver donation vil blive påskønnet, og ethvert beløb er velkomment ... Tak!</p>
		<form action="https://www.paypal.com/donate" method="post" target="_blank">
			<input type="hidden" name="business" value="Z8FY82UF3S7F2" />
			<input type="hidden" name="no_recurring" value="1" />
			<input type="hidden" name="currency_code" value="DKK" />
			<input type="image" src="https://www.paypalobjects.com/en_US/DK/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donér med PayPal-knappen" />
			<img alt="" border="0" src="https://www.paypal.com/en_DK/i/scr/pixel.gif" width="1" height="1" />
		</form>
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

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Kontakt</h2>
		<p>Har du spørgsmål, som du ikke kan finde svar på i <a href="hjaelp.asp">vejledningen</a>, eller en god idé til en ny funktionalitet,<br>
er du velkommen til at sende en besked.<br>
Du må ikke forvente svar samme dag, men alle henvendelser bliver besvaret, typisk indenfor en uge.
		</p>
		<form name="frmKontakt" method="post" action="<%=request.servervariables("PATH_INFO")%>" onsubmit="return ValidateKontakt();">
			<p>
				<select class="w3-select" name="ioption" required autofocus>
					<option value="" disabled selected>Vælg et emne</option>
					<option value="1">Oprettelse af bruger</option>
					<option value="2">Fejl på hjemmesiden</option>
					<option value="3">Ønsker til ny funktionalitet</option>
					<option value="4">Forslag om samarbejde</option>
				</select>
			</p>
			<p><label>&nbsp;Din IP-adresse:</label><input class="w3-input w3-border" type="text" readonly name="iipadr" value="<%=Request.Servervariables("remote_addr")%> / <%=Request.Servervariables("server_name")%>"></p>
			<p><input class="w3-input w3-border" type="text" placeholder="Navn" required name="iname"></p>
			<p><input class="w3-input w3-border" type="text" placeholder="Email" required name="iemail"></p>
			<p>
				<textarea class="w3-input w3-border" type="text" rows="3" placeholder="Din besked" required name="imessage" id="tekstfelt" maxlength="300"></textarea>
				<div id="live-counter" class="w3-right-align">
					<span id="char-length">0</span>
					<span id="maximum">/ 300</span>
				</div>
			</p>
			<button type="submit" class="w3-button w3-green w3-quarter">Send besked</button>
		</form>
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

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Privatlivspolitik</h2>
		<p>Lidt tekst om cookies m.m.</p>
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

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Vilkår for brug af hjemmesiden ForFat.dk</h2>
		<p>Noget om pligter, rettigheder, backup, datasikkerhed osv.</p>
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

<div class="w3-grid" style="grid-template-columns:20% 60% 20%">
	<div class="w3-padding">&nbsp;</div>
	<div class="w3-padding">
		<h2>Vejledning</h2>
		<p>Skal flyttes til Hjælp-menuen.</p>
	</div>
	<div class="w3-padding">&nbsp;</div>
</div>

<!-- #include file="inkl/chr_count.js" -->

<!-- #include file="inkl/footer.asp" -->
