tell application "Evernote"
	set pnotes to find notes "[Note ID: 414d0bf6839b3c6df4293bd3ed679866] created:20170301T175413 -created:20170301T175417"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
