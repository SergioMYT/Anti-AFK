Option Explicit

Dim objWMIService, colProcessList, objProcess, objShell
Dim strFileName, strProcessName

strFileName = "script.py"
strProcessName = "python.exe"

Set objShell = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = '" & strProcessName & "'")

' If there is no Python process running, start the script.
If colProcessList.Count = 0 Then
    objShell.Popup "Starting", 1, "Anti AFK", 0 
    objShell.Run "python " & strFileName, 0, False 
    WScript.Sleep 4000
    WScript.Quit
Else
    ' If there is no Python process running, start the script
    Dim response
    response = MsgBox("It's running. Do you want to stop it?", vbYesNo + vbQuestion, "Anti AFK")
    If response = vbYes Then
        objShell.Popup "Stopping", 1, "Anti AFK", 0
        For Each objProcess In colProcessList
            If InStr(objProcess.CommandLine, strFileName) > 0 Then                
                objProcess.Terminate()
                Exit For
            End If
        Next
        WScript.Sleep 4000
        WScript.Quit
    End If
End If

Set objWMIService = Nothing
Set colProcessList = Nothing
Set objProcess = Nothing
