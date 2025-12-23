<!-- #include file="inkl/init_db.asp" -->
<!-- #include file="inkl/checkstart.asp" -->
<!-- #include file="inkl/systemstatus.asp" -->

<!-- #include file="inkl/header.asp" -->

<!-- Hvis bruger IKKE er logget på, send videre til default.asp -->
<%
	if Session.Contents("logon") <> 1 then
		Response.Redirect("default.asp")
	end if
%>

<br>

<div class="w3-row-padding w3-center w3-margin-top">

	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-code-fork w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Bog -> Kapitel -> Scene</b></h3><br>
			<p>Du kan nummerere rækkefølgen på dine bøger, hvis du f.eks. skriver en trilogi.</p>
			<p>Her i ForFat er en bog opdelt i et eller flere kapitler.</p>
			<p>Et kapitel opdeles i en eller flere scener, og under "Scener" skriver du selve teksten til din historie.</p>
			<p>Du har på hvert niveau mulighed for at tilknytte egne noter og huskelister til historien på netop dette punkt.</p>
			<p>Både kapitler og scener kan rykkes frem og tilbage i historien, så de kommer til at passe til din tidslinje.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-exchange w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Tidslinjen - dit centrale holdepunkt</b></h3><br>
			<p>Et godt råd er at få tidslinjen så færdig og gennemarbejdet som muligt, inden du begynder at skrive selve historien, men det står dig naturligvis frit for; vi skriver alle forskelligt fra bog til bog.</p>
			<p>Tidslinjen hjælper dig til at holde fokus på din histories udvikling, rækkefølge og eventuelle spring i tiden.</p>
			<p>Du kan sætte sortering på tidslinjen både i relation til din historie og den kronologiske udvikling.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-user-o w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Karakterer</b></h3><br>
			<p>Måske er der kun 1 eller 2 personer i din historie, måske er der 20.</p>
			<p>Under alle omstændigheder er det en god idé at beskrive hver karakter grundigt, hvis du f.eks. tager vedkommendes "maske på", når du skriver om ham.</p>
			<p>Det gør det lettere at huske personlighedstræk, udseende, specielle fysiske kendetegn og måske endda personens historie, der først afsløres langt inde i historien.</p>
			I selve skriveprocessen kan du få vist alle beskrivelserne af dine karakterer i et separat vindue.</p>
		</div>
	</div>
	
</div>

<div class="w3-row-padding w3-center w3-margin-top">

	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-university w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Lokationer</b></h3><br>
			<p>Kan du mærke solens stråler i dit ansigt, dufte det friske græs, der stadig er fugtigt efter aftenduggen, bilernes dytten i den overfyldte hovedstad eller den totale stilhed efter en eksplosion?</p>
			<p>For mange er det en stor hjælp at beskrive et sted i detaljer, også selvom det hele ikke bliver brugt i skrivearbejdet.</p>
			<p>Det kunne også være et kort over Midgård eller en detaljeret beskrivelse af havnefronten i Marseille.</p>
			<p>Når du skriver på en scene, har du altid mulighed for at kalde beskrivelsen af en bestemt lokation frem.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-diamond w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Artefakter</b></h3><br>
			<p>Leder din hovedperson f.eks. efter en gammel magisk bog, har du mulighed for at beskrive bogen i detaljer her.</p>
			<p>De artefakter - eller objekter - der er væsentlige for historien, vil få mere liv, hvis du kender deres historie, evner og egenskaber, betydning for andre mennesker osv.</p>
			<p>Ligesom med dine karakterer og lokationer kan du altid få vist beskrivelsen, mens du skriver din historie.</p>
		</div>
	</div>
	<div class="w3-third">
		<div class="w3-card w3-container" style="min-height:260px">
			<i class="fa fa-book w3-margin-top w3-text-theme" style="font-size:70px"></i>
			<h3><b>Mere hjælp?</b></h3><br>
			<p>Find en mere udførlig hjælp til de enkelte funktioner i ForFat i menuen herover.</p>
			<p>Søger du yderligere inspiration eller hjælp vedrørende det at skrive en bog, er der også i menuen et par gode links til hjemmesider med masser af inspiration.</p>
			<p>Sluttelig er der på forhånd oprettet et antal bøger herinde, hvor der kun er en overordnet beskrivelse af handling og plot.</p>
			<p>Du er mere end velkommen til at skrive videre på disse :-)</p>
		</div>
	</div>
	
</div>

<!-- #include file="inkl/footer.asp" -->
