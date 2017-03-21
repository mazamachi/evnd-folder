tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/"
	set matches to [note1]
	if note1 is missing value then
		set matches to find notes "[Note ID: ae84abfed0bcc4e5261ff25fbbfbaf51] created:20170321T194409 -created:20170321T194413"
	end if
	set countmatches to count of matches
	if countmatches is 1
		set note1 to item 1 of matches
		set notelink1 to note link of note1
		return "{ \"found\": 1, \"notelink\": \"" & notelink1 & "\", \"queryString\": \"" & "[Note ID: ae84abfed0bcc4e5261ff25fbbfbaf51] created:20170321T194409 -created:20170321T194413" & "\"}"
	else
		return "{ \"found\": " & countmatches & ", \"notelink\": \"\", \"queryString\": \"" & "[Note ID: ae84abfed0bcc4e5261ff25fbbfbaf51] created:20170321T194409 -created:20170321T194413" & "\"}"
	end if
end tell
