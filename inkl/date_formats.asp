<script type="text/vbscript">
<%
// yyyymmdd -> dd-mm-yyyy
//-------------------------
Function fFormatDateDB2Frm(idato)
   d = Mid(idato, 7, 2)
   m = Mid(idato, 5, 2)
   y = Mid(idato, 1, 4)
   fFormatDateDB2Frm = d & "-" & m & "-" & y
End Function

// yyyymmdd -> serial
//-------------------------
Function fFormatDateDB2Date(idato)
   d = Mid(idato, 7, 2)
   m = Mid(idato, 5, 2)
   y = Mid(idato, 1, 4)
   fFormatDateDB2Date = DateSerial(y, m, d)
End Function

// dd-mm-yyyy -> yyyymmdd
//-------------------------
Function fFormatDateFrm2DB(sdato)
   d = Mid(sdato, 1, 2)
   m = Mid(sdato, 4, 2)
   y = Mid(sdato, 7, 4)
   fFormatDateFrm2DB = y & m & d
End Function

// dd-mm-yyyy -> serial
//-------------------------
Function fFormatDateFrm2Date(sdato)
   d = Mid(sdato, 1, 2)
   m = Mid(sdato, 4, 2)
   y = Mid(sdato, 7, 4)
   fFormatDateFrm2Date = DateSerial(y, m, d)
End Function

// serial -> dd-mm-yyyy
//-------------------------
Function fFormatDateDate2Frm(ddato)
   d = Day(ddato)
   m = Month(ddato)
   y = Year(ddato)
   if d < 10 then
     d = "0" & d
   End if
   if m < 10 then
     m = "0" & m
   End if
   fFormatDateDate2Frm = d & "-" & m & "-" & y
End Function

// serial -> yyyymmdd
//-------------------------
Function fFormatDateDate2DB(ddato)
   d = Day(ddato)
   m = Month(ddato)
   y = Year(ddato)
   if d < 10 then
     d = "0" & d
   End if
   if m < 10 then
     m = "0" & m
   End if
   fFormatDateDate2DB = y & m & d
End Function

// serial -> HHMMSS
//-------------------------
Function fFormatTimeTime2DB(dtime)
   h = Hour(dtime)
   m = Minute(dtime)
   s = Second(dtime)
   if h < 10 then
     h = "0" & h
   End if
   if m < 10 then
     m = "0" & m
   End if
   if s < 10 then
     s = "0" & s
   End if
   fFormatTimeTime2DB = h & m & s
End Function

// Calculates the number of days 
// between ddato1 and ddato2. Both
// dates are VB-serials, uses DateDiff function.
//------------------------------------------------
Function fDaysBetween(ddato1, ddato2)
  fDaysBetween = DateDiff("d", ddato1, ddato2)
End Function

// Adds a number of days to ddato.
// ddato is a VB-serial, uses DateAdd function.
//------------------------------------------------
Function fDaysAdd(ddato, days)
  fDaysAdd = DateAdd("d", days, ddato)
End Function
%>
</script>
