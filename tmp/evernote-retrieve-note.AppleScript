tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/cfb187aa-66f2-4b84-9da8-fe162519f51f/cfb187aa-66f2-4b84-9da8-fe162519f51f/"
	if note1 is not missing value then
		export [note1] to "/Users/sho/Google_Drive/evnd/20170329/shiba共著_evernote.enex" format ENEX
		export [note1] to "/Users/sho/Google_Drive/evnd/20170329/shiba共著_evernote.html" format HTML
	end if
end tell
