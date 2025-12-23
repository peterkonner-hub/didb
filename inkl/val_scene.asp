<script type="text/javascript">

// Fjerner leading og trailing blanke fra en streng
//-----------------------------------------------------
function trim(strText) { 
	while (strText.substring(0,1) == ' ') 
		strText = strText.substring(1, strText.length);
	while (strText.substring(strText.length-1,strText.length) == ' ')
		strText = strText.substring(0, strText.length-1);
	return strText;
}

// Tjekker om '-' står de korrekte steder i strengen (pos. 2 og 5)
//-----------------------------------------------------------------
function vDDashPos(tDato) {
	if ((tDato.substring(2, 3) == '-') && (tDato.substring(5, 6) == '-')) {
		console.log("Dash er placeret OK.");
	 	return true;
	}
	else {
		console.log("Dash er placeret forkert.");
	 	return false;
	}
}

// Tjekker om der er netop 2 '-' i strengen
//----------------------------------------------
function vDCountDash(tDato) {
	var strChar;
	var ant = 0;
	for (i = 0; i < tDato.length; i++) {
		strChar = tDato.charAt(i);
		if (strChar == '-') {
			ant++;
		}
	}
	console.log("Ant. dash: " + ant);
	if (ant == 2) {
	 	return true;
	}
	else {
	 	return false;
	}
}

// Tjekker for illegale tegn i en dato
//-------------------------------------------
  var vDLegalChars = "0123456789-";
function vDIlligalChars(tDato) {
	for (i=0; i<tDato.length; i++) {
		if (vDLegalChars.indexOf(tDato.charAt(i),0) == "-1") {
			console.log("Illegalt tegn i tDato!");
			return false;
		}
	}
	console.log("Ingen illegale tegn i tDato.");
	return true;
}

// Tester om en streng kan oversættes til en rigtig dato
//---------------------------------------------------------
function vDRealDate(tDato) {
	ttDato = new Date( tDato.replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
	console.log("ttDato = " + ttDato);
	if (ttDato=="Invalid Date") {
		return false;
	} 
	else {
		return true;
	}
}

// Validerer en dato på formen dd-mm-yyyy
//-----------------------------------------
function ValiderDato(tDato) {
	if ((tDato.length==10) && (vDDashPos(tDato)) && (vDCountDash(tDato)) && (vDIlligalChars(tDato)) && (vDRealDate(tDato))) {
	 	return true;
	 }
	 else {
	 	return false;
	 }
}

function ValidateScene() {
		return true;
}
</script>
