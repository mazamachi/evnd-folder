tell application "Evernote"
	set pnotes to find notes "[Note ID: 8e822a16abd078ac6094bc255c37e6ca] created:20170315T120618 -created:20170315T120622"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
