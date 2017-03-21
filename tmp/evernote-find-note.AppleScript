tell application "Evernote"
	set note1 to missing value
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
