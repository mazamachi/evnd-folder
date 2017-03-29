tell application "Evernote"
	set pnotes to find notes "[Note ID: 5524df138101bd29aa96c10bc2b7c0d0] created:20170329T164241 -created:20170329T164245"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
