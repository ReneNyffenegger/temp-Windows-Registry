$userSid = 'S-1-5-21-1986187950-1154198019-2155599821-1001'

$null = new-psDrive -name HKUS -psProvider registry -root HKEY_USERS

$regKey = "HKUS:\$userSid\Software\TQ84"

(get-item $regKey).GetValue('')

$null = new-itemProperty -path $regKey -name aValue -value 'this item was added using admin privileges'
