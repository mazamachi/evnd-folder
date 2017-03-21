tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/"
	if note1 is not missing value then return ENML content of note1
end tell
