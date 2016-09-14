# Retrieve Windows product key

1. Save the following code as `productkey.vbs`:

   ```vbs
   Set WshShell = CreateObject("WScript.Shell")
   MsgBox ConvertToKey(WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DigitalProductId"))

   Function ConvertToKey(Key)
   Const KeyOffset = 52
   i = 28
   Chars = "BCDFGHJKMPQRTVWXY2346789"
   Do
   Cur = 0
   x = 14
   Do
   Cur = Cur * 256
   Cur = Key(x + KeyOffset) + Cur
   Key(x + KeyOffset) = (Cur \ 24) And 255
   Cur = Cur Mod 24
   x = x -1
   Loop While x >= 0
   i = i -1
   KeyOutput = Mid(Chars, Cur + 1, 1) & KeyOutput
   If (((29 - i) Mod 6) = 0) And (i <> -1) Then
   i = i -1
   KeyOutput = "-" & KeyOutput
   End If
   Loop While i >= 0
   ConvertToKey = KeyOutput
   End Function
   ```

2. Double click the icon of the script to run it.

Reference:
http://www.howtogeek.com/206329/how-to-find-your-lost-windows-or-office-product-keys/
