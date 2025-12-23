<%
  '---- CursorTypeEnum Values (partly) ----
  Const adOpenDynamic = 2
  Const adOpenStatic = 3
  '---- LockTypeEnum Values (partly) ----
  Const adLockReadOnly = 1
  Const adLockPessimistic = 2
  Const adLockOptimistic = 3

  Response.Buffer = True
  Response.Expires = -1000

  dim DSN
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Mode = adModeReadWrite
  DSN = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=" & Server.MapPath("db/writerbase.mdb")
  
  'DSN = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=" & Server.MapPath("db/dividends.mdb") & ";Extended Properties=\CharacterSet=UTF-8;\"
  '      "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Extended Properties=\"text;HDR=Yes;FMT=Delimited;CharacterSet=65001;\""
  '      "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & "C:\Test" & ";Extended Properties=""text;HDR=No;FMT=Delimited;"";"
  Conn.Open DSN
%>