<%
'### General library of ASP functions
'###----------------------------------

Function ZeroPadLeft(intValue, intLength)
'##--------------------------------------
'## Padding a number with 0's to the left
'##--------------------------------------
    If (Len(intValue) < intLength) Then
       ZeroPadLeft = Right(Replace(Space(intLength), " ", "0") & intValue, intLength)
    Else
		if (Len(intValue) >= 1) then
			ZeroPadLeft = CStr(intValue)
		Else
			ZeroPadLeft = "00001"
		End if
    End If
End Function

Function FormatDKnumber(numValue, NumDigAfterDec, GroupDig)
'##---------------------------------------------------------------
'## Formats a number with decimal comma and '.' as 1000-separator.
'## NumDigAfterDec = Number of digits after decimal [0;1;2;3;4].
'## GroupDig = Group Digits with period as separator [-2;-1;0] = [default;yes;no].
'##---------------------------------------------------------------
	tmpNumber = FormatNumber(numValue, NumDigAfterDec, -2, -2, GroupDig)
	'tmpNumber = Replace(tmpNumber, ".", ":")
	'tmpNumber = Replace(tmpNumber, ",", ".")
	'FormatDKnumber = Replace(tmpNumber, ":", ",")
	FormatDKnumber = tmpNumber
End Function

Function WrapUserNameInAbbr(sText, sTitle)
'##-----------------------------------------
'## Wraps a single user name in <abbr> tags
'##-----------------------------------------
	lngth = Len(sText)
	c34 = chr(34)
    If (lngth > 0) Then
		WrapUserNameInAbbr = "<abbr title=" & c34 & sTitle & c34 & ">" & sText & "</abbr>"
    Else
		WrapUserNameInAbbr = sText
    End If
End Function

Function WrapTextInAbbr(sText)
'##----------------------------------------
'## Wraps a @usr in <abbr> tags
'## Should this function read from tbUser?
'##----------------------------------------
	lngth = Len(sText)
	c34 = chr(34)
    If (lngth > 0) Then
		atpos = InStr(sText, "@")
		if (atpos > 0) then
			'blnkpos = InStr(atpos, sText, " ")
			UsrName = Mid(sText, atpos+1, 3)
			locSQL = "SELECT FullName FROM tbUser WHERE UserName = '" & UsrName & "'"
			set rsu = Connms.Execute(locSQL)
			if (rsu.EOF OR rsu.BOF) then
				sTitle = "Unknown!"
			else
				sTitle = rsu("FullName")
			end if
			rsu.close
			set rsu = Nothing
			part1 = Left(sText, atpos-1)
			part2 = Mid(sText, atpos, 4)
			part3 = Right(sText, lngth-atpos-3)
			WrapTextInAbbr = part1 & "<abbr title=" & c34 & sTitle & c34 & ">" & part2 & "</abbr>" & part3
		else
			'### No @ in sText, return the original string
			WrapTextInAbbr = sText
		end if
    Else
		'### String not available, return the original string
		WrapTextInAbbr = sText
    End If
End Function
%>