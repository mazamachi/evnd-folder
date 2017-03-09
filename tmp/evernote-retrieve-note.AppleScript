tell application "Evernote"
	set pnotes to find notes "[Note ID: 3c8b2e8b660694256189aeffaeaf1d8d] created:20170309T162727 -created:20170309T162731"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then
		export [note1] to "/Users/sho/Google_Drive/evnd/20170309/title_アゾソンubi_evernote.enex" format ENEX
		export [note1] to "/Users/sho/Google_Drive/evnd/20170309/title_アゾソンubi_evernote.html" format HTML
	end if
end tell
