tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/401be46e-5672-4f04-b52a-ff80b8207f79/401be46e-5672-4f04-b52a-ff80b8207f79/"
	if note1 is not missing value then
		export [note1] to "/Users/sho/Google_Drive/evnd/20170301/世界で闘うプログラミング力を鍛える150問_evernote.enex" format ENEX
		export [note1] to "/Users/sho/Google_Drive/evnd/20170301/世界で闘うプログラミング力を鍛える150問_evernote.html" format HTML
	end if
end tell
