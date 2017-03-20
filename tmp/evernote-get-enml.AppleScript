tell application "Evernote"
	set pnotes to find notes "[Note ID: a135adac375d2922ea046fa12e613b2e] created:20170321T033542 -created:20170321T033546"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
