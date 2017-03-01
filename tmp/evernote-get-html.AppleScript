tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/21dccfe9-6648-4186-8a86-050a3a9b04a5/21dccfe9-6648-4186-8a86-050a3a9b04a5/"
	if note1 is not missing value then return HTML content of note1
end tell
