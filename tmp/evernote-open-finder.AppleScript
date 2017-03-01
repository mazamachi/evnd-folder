tell application "Finder" to open ("/Users/sho/Google_Drive/evnd/20170301" as POSIX file)
tell application "System Events" to tell process "Finder"
	set frontmost to true
end tell
