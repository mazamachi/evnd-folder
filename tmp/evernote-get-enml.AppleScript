tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/cfb187aa-66f2-4b84-9da8-fe162519f51f/cfb187aa-66f2-4b84-9da8-fe162519f51f/"
	if note1 is not missing value then return ENML content of note1
end tell
