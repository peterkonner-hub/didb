<div class="w3-bar w3-olive"> 		<!-- Start of menu -->

	<a href="default.asp" class="w3-bar-item w3-button w3-olive"><img src="grafik/keyboard3.png" style="width:52px;height:25px;" alt="Forside"></a>
	
	<div class="w3-dropdown-hover">
		<button class="w3-button">Bøger <i class="fa fa-caret-down"></i></button>
		<div id="books" class="w3-dropdown-content w3-bar-block w3-card w3-olive">
<%	if Session.Contents("logon") > 0 then %>
			<a href="bog_list.asp" class="w3-bar-item w3-button">Vælg bog</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Vælg bog</span>
<%	end if %>
<%	if Session.Contents("bogid") > 0 then %>
			<a href="kapitel_list.asp" class="w3-bar-item w3-button" disabled>Kapitler</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Kapitler</span>
<%	end if %>
<%	if Session.Contents("bogid") > 0 then %>
			<a href="hele_bogen.asp" class="w3-bar-item w3-button">Hele bogen</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Hele bogen</span>
<%	end if %>
			
		</div>
	</div>

	<div class="w3-dropdown-hover">
		<button class="w3-button">Noter <i class="fa fa-caret-down"></i></button>
		<div id="notes" class="w3-dropdown-content w3-bar-block w3-card w3-olive">
<%	if Session.Contents("bogid") > 0 then %>
			<a href="tidslinje_list.asp" class="w3-bar-item w3-button">Tidslinje</a>
			<a href="#" class="w3-bar-item w3-button">Karakterer</a>
			<a href="#" class="w3-bar-item w3-button">Lokationer</a>
			<a href="#" class="w3-bar-item w3-button">Artefakter</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Tidslinje</span>
			<span class="w3-bar-item w3-opacity">Karakterer</span>
			<span class="w3-bar-item w3-opacity">Lokationer</span>
			<span class="w3-bar-item w3-opacity">Artefakter</span>
<%	end if %>
		</div>
	</div>

	<div class="w3-dropdown-hover">
		<button class="w3-button">Bruger <i class="fa fa-caret-down"></i></button>
		<div id="user" class="w3-dropdown-content w3-bar-block w3-card w3-olive">
<%	if Session.Contents("logon") = 0 then %>
    <a href="javascript:void(0)" onclick="document.getElementById('loginModal').style.display='block'" class="w3-bar-item w3-button">Log på</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Log på</span>
<%	end if %>
<%	if Session.Contents("logon") > 0 then %>
			<a href="logoff.asp" class="w3-bar-item w3-button">Log af</a>
			<a href="#" class="w3-bar-item w3-button">Slet mig!</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Log af</span>
			<span class="w3-bar-item w3-opacity">Slet mig!</span>
<%	end if %>
		</div>
	</div>

	<!-- Login modal -->
	<div id="loginModal" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:450px">
			<header class="w3-container w3-olive">
				<span onclick="document.getElementById('loginModal').style.display='none'" class="w3-button w3-olive w3-hover-red w3-xlarge w3-display-topright">&times;</span>
				<h3>Log på</h3>
			</header>
			<div class="w3-container w3-light-grey">
				<form class="w3-container" name="frmLogon" method="Post" action="check_logon.asp"><br>

					<label><b>Email</b></label>
					<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Indtast email" name="email" required>

					<label><b>Password</b></label>
					<input class="w3-input w3-border" type="password" name="psw" placeholder="Indtast password" required>

					<input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Husk mig

					<button class="w3-button w3-green w3-margin-top w3-block">Log ind</button>
				</form>
				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
					<button onclick="document.getElementById('loginModal').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
					<span class="w3-right w3-padding w3-hide-small"><a href="err_general.asp?errnr=1">Glemt password?</a></span>
				</div>
				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
					<span class="w3-right w3-padding w3-hide-small"><a href="err_general.asp?errnr=1">Opret ny bruger</a></span>
				</div>
			</div>
		</div>
	</div>

	<div class="w3-dropdown-hover">
		<button class="w3-button">System <i class="fa fa-caret-down"></i></button>
		<div id="system" class="w3-dropdown-content w3-bar-block w3-card w3-olive">
			<a href="#" class="w3-bar-item w3-button">Hjælp</a>
			<a href="ressourcer.asp" class="w3-bar-item w3-button">Ressourcer</a>
<%	if Session.Contents("accesslevelnum") = 100 then %>
			<a href="#" class="w3-bar-item w3-button">Status</a>
<%	else %>
			<span class="w3-bar-item w3-opacity">Status</span>
<%	end if %>
		</div>
	</div>

	<a href="kontakt.asp" class="w3-bar-item w3-button">Kontakt m.m.</a>

<%	if Session.Contents("logon") = 0 then %>
			<span class="w3-bar-item w3-right">&nbsp;</span>
<%	else %>
			<span class="w3-bar-item w3-right"><%=Session.Contents("kaldenavn")%></span>
<%	end if %>

</div> 		<!-- End of menu -->
