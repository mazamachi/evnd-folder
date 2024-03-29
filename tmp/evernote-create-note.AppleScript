on readFile(unixPath)
	set targetFile to (open for access (POSIX file unixPath))
	set newcontent to (read targetFile as «class utf8»)
	close access targetFile
	return newcontent
end readFile

set newcontent to readFile("/Users/sho/Google_Drive/evnd/20170329/shiba共著.enml")
set infostr to ""
tell application "Evernote"
	set note1 to create note title "shiba共著" with enml newcontent tags {"evnd", "research/shiba"} 
	if (notebook named "EVND" exists) then
		move note1 to notebook "EVND"
	else
		set infostr to infostr & "(notebook does not exist)"
	end if
	set source URL of note1 to "/Users/sho/Google_Drive/evnd/20170329/shiba共著.enml"
	set date1 to creation date of note1
end tell

on coerceTwoDigit(num)
	if num < 10
		set num to "0" & (num as string)
	else
		set num to (num as string)
	end if
	return num
end coerceTwoDigit

on dateToString(aDate)
	if aDate is missing value then return aDate
	set y to year of aDate as string
	set m to coerceTwoDigit(month of aDate as integer)
	set d to coerceTwoDigit(day of aDate as integer)
	set h to coerceTwoDigit(hours of aDate as integer)
	set mm to coerceTwoDigit(minutes of aDate as integer)
	set ss to coerceTwoDigit(seconds of aDate as integer)
	return y & m & d & "T" & h & mm & ss
end dateToString

set infostr to infostr & dateToString(date1)
return infostr