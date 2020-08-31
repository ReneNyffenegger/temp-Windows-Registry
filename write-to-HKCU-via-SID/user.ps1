$null = new-item -path "HKCU:\Software\TQ84" -value "This key was created at $(get-date -format 'yyyy-MM-dd HH-mm-ss (K)')"
