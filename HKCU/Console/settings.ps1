$windowHeight =  90
$windowWidth  = 150

$bufferHeight = 9999
$bufferWidth  = $windowWidth # It rarely makes sense to have a buffer width that is different from the window width.

$fontFace     = 'Lucida Console' # or 'Consolas', 'Terminal'
$fontWidth    =  0  # only used for Raster-Fonts (?) (such as 'Terminal'). Set to 0 for other fonts.
$fontHeigth   = 12
$fontFamily   = 54  # 0x36 | Set to 48 (0x30) if using face such as 'Terminal'


#
#  Determine the registry key where the
#  console's settings are stored.
#  The key name is the path of the executable...
#
$path_exe = (get-process -pid $pid).path

#
#  ... however, backslashes are not allowed and
#  need to be replaced with underscores:
#
$reg_key = 'HKCU:\Console\' + $path_exe.replace('\', '_')

#
#   Create registry key. Do nothing if it already exists.
#
new-item $reg_key -errorAction ignore

$null = set-itemProperty $reg_key WindowSize       (65536 * $windowHeight + $windowWidth) -force
$null = set-itemProperty $reg_key ScreenBufferSize (65536 * $bufferHeight + $bufferWidth) -force
$null = set-itemProperty $reg_key FontWeight       (65536 * $fontHeight   + $fontWidth  ) -force
$null = set-itemProperty $reg_key FaceName         $fontFace                              -force
$null = set-itemProperty $reg_key FontFamily       $fontFamily                            -force
