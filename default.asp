<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/checkstart.asp" -->
<!-- #include file="inkl/systemstatus.asp" -->

<!-- #include file="inkl/header.asp" -->

<!-- Hvis bruger allerede er logget på, send videre til main.asp -->
<%
	if Session.Contents("logon") = 1 then
		Response.Redirect("main.asp")
	end if
%>

<br>

<div class="w3-row-padding w3-center w3-margin-top">

	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-sitemap w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Mangler du struktur i din skriveproces?</b></h3><br>
			<p>Med ForFat kan du frit springe frem og tilbage i din historie, og skrive præcis på de kapitler og/eller scener, der ligger først i dine tanker.</p>
			<p>Brug f.eks. tidslinjen til at styre historiens udvikling, eller flyt rundt på kapitler og scener med et par enkelte museklik.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-clock-o w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Hold overblikket, også hvis du skriver<br>"fra-start-til-slut".</b></h3><br>
			<p>For både kapitler og scener kan du nedskrive og fastholde dine noter om f.eks. et nyt plot, introduktionen af en ny karakter eller brugen af et vigtigt objekt i historien, som f.eks. Harry Potters usynlighedskappe.</p>
			<p>Du sikrer, at elementerne i din historie bliver mere konsistente, og du undgår at skrive dig væk fra det centrale i din historie.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-address-card-o w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Lav dine personskildringer konsistente.</b></h3><br>
			<p>Kender du det, at din hovedperson utilsigtet kommer til at ændre karakter i løbet af din historie?</p>
			<p>Hun går måske fra at være en kærlig og introvert hustru, til at være et neurotisk og udadreagerende monster i løbet af historien.</p>
			<p>Hvis du gerne vil fastholde dine karakterers personlige udvikling, så vil du elske dette værktøj!</p>
		</div>
	</div>
	
</div>

<div class="w3-row-padding w3-center w3-margin-top">

	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-globe w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Researcher du dine steder i historien?<br>Fasthold fakta og dine indtryk!</b></h3><br>
			<p>Hvad enten du hører til dem, der rejser til eksotiske steder for at researche til din næste bog, eller du blot "rejser" via Google Streetview, så er det en god idé at fastholde dine indtryk om historiens steder.</p>
			<p>Med beskrivelsen af dine lokationer glemmer du ikke noget, og kan nærmest betragte det som en udvidet rejsedagbog.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-coffee w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Skriveblokering?<br>Ikke her!</b></h3><br>
			<p>Skulle du hænge fast i udviklingen et bestemt sted i din historie, så kan du bare begynde at skrive på et andet kapitel eller en anden scene, og på et senere tidspunkt få det hele til at hænge sammen igen.</p>
			<p>Læs din tidslinje igennem, og ret den evt. til, hvis du ikke føler, at tingene hænger sammen i fortællingen.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-question w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Hvordan kommer jeg i gang?</b></h3><br>
			<p>Måske har du allerede et par ideer til nogle gode, spændende eller rørende historier?</p>
			<p>Hvis ikke, så ligger der lidt inspiration i form af en overordnet beskrivelse af et par bøger, når du opretter dig som bruger her - det er i øvrigt ganske gratis og helt uden forpligtelser!</p>
			<p>Vælg blot "Log på" i menuen ovenfor, klik på "Opret bruger", så er du i gang!</p>
		</div>
	</div>
	
</div>

<!-- #include file="inkl/footer.asp" -->
