tell application "Evernote"
	set note1 to missing value
	if note1 is missing value then
		set matches to find notes "[Note ID: 5524df138101bd29aa96c10bc2b7c0d0] created:20170329T164241 -created:20170329T164245"
	end if
	set countmatches to count of matches
	if countmatches is 1
		set note1 to item 1 of matches
		set notelink1 to note link of note1
		return "{ \"found\": 1, \"notelink\": \"" & notelink1 & "\", \"queryString\": \"" & "[Note ID: 5524df138101bd29aa96c10bc2b7c0d0] created:20170329T164241 -created:20170329T164245" & "\"}"
	else
		return "{ \"found\": " & countmatches & ", \"notelink\": \"\", \"queryString\": \"" & "[Note ID: 5524df138101bd29aa96c10bc2b7c0d0] created:20170329T164241 -created:20170329T164245" & "\"}"
	end if
end tell
