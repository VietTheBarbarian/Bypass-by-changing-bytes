$bytes  = [System.IO.File]::ReadAllBytes("C:\Users\test\Desktop\met.exe ")
$bytes[29239] = 0
$bytes[73801] = 0xFF
[System.IO.File]::WriteAllBytes("C:\Users\test\Desktop\met_mod3.exe", $bytes)
