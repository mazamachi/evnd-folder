tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/6b5e3d3d-b161-49c3-bbd4-6c4ea784b618/"
	if note1 is not missing value then
		export [note1] to "/Users/sho/Google_Drive/evnd/20170321/atourofgo_evernote.enex" format ENEX
		export [note1] to "/Users/sho/Google_Drive/evnd/20170321/atourofgo_evernote.html" format HTML
	end if
end tell
