tell application "Evernote"
	set pnotes to find notes "[Note ID: ae84abfed0bcc4e5261ff25fbbfbaf51] created:20170321T194409 -created:20170321T194413"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
