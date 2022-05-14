set-strictMode -version 2

function doRegKey([Microsoft.Win32.RegistryKey]$k, [int]$indent) {
   foreach ($vn in $k.GetValueNames()) {
     "{0,$($indent*2)} {1,-30}: {2}" -f 'x', $vn, $k.GetValue($vn)
   }
   foreach ($kn in $k.GetSubKeyNames()) {
      "{0,$($indent*2)} {1,-30} <<<" -f 'y', $kn
      doRegKey ($k.OpenSubKey($kn))  ($indent+1)
      "{0,$($indent*2)} >>>" -f 'z'
   }
}


$hklm = get-item hklm:

doRegKey $hklm 0
