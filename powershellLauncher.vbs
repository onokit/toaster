Option Explicit

Dim Sh, PsArgs, Index
ReDim ArgArray(WScript.Arguments.Count-1)

For Index = 0 To WScript.Arguments.Count-1
  ArgArray(Index) = WScript.Arguments(Index)
Next
PsArgs = Join(ArgArray, " ")

Set Sh = CreateObject("WScript.Shell")
Sh.Run "powershell -ExecutionPolicy RemoteSigned -File " + PsArgs, 0
