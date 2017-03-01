tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/21dccfe9-6648-4186-8a86-050a3a9b04a5/21dccfe9-6648-4186-8a86-050a3a9b04a5/"
	set matches to [note1]
	if note1 is missing value then
		set matches to find notes "[Note ID: 69bea99a3df6c5269f23064cb7c980b5] created:20170301T160254 -created:20170301T160258"
	end if
	set countmatches to count of matches
	if countmatches is 1
		set note1 to item 1 of matches
		set notelink1 to note link of note1
		return "{ \"found\": 1, \"notelink\": \"" & notelink1 & "\", \"queryString\": \"" & "[Note ID: 69bea99a3df6c5269f23064cb7c980b5] created:20170301T160254 -created:20170301T160258" & "\"}"
	else
		return "{ \"found\": " & countmatches & ", \"notelink\": \"\", \"queryString\": \"" & "[Note ID: 69bea99a3df6c5269f23064cb7c980b5] created:20170301T160254 -created:20170301T160258" & "\"}"
	end if
end tell
