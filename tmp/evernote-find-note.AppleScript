tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/401be46e-5672-4f04-b52a-ff80b8207f79/401be46e-5672-4f04-b52a-ff80b8207f79/"
	set matches to [note1]
	if note1 is missing value then
		set matches to find notes "[Note ID: 414d0bf6839b3c6df4293bd3ed679866] created:20170301T175413 -created:20170301T175417"
	end if
	set countmatches to count of matches
	if countmatches is 1
		set note1 to item 1 of matches
		set notelink1 to note link of note1
		return "{ \"found\": 1, \"notelink\": \"" & notelink1 & "\", \"queryString\": \"" & "[Note ID: 414d0bf6839b3c6df4293bd3ed679866] created:20170301T175413 -created:20170301T175417" & "\"}"
	else
		return "{ \"found\": " & countmatches & ", \"notelink\": \"\", \"queryString\": \"" & "[Note ID: 414d0bf6839b3c6df4293bd3ed679866] created:20170301T175413 -created:20170301T175417" & "\"}"
	end if
end tell