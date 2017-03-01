
on stringToDate(y, m, d, h, mm, ss)
	set newDate to date (m & "/" & d & "/" & y)
	set hours of newDate to h
	set minutes of newDate to mm
	set seconds of newDate to ss
	return newDate
end stringToDate

set y to "2017"
set m to "03"
set d to "01"
set h to "16"
set mm to "02"
set ss to "56"
set date0 to stringToDate(y, m, d, h, mm, ss)

on readFile(unixPath)
	set targetFile to (open for access (POSIX file unixPath))
	set newcontent to (read targetFile as «class utf8»)
	close access targetFile
	return newcontent
end readFile

set newcontent to readFile("/Users/sho/Google_Drive/evnd/20170301/evnd_テスト.enml")
set infostr to ""
tell application "Evernote"
	set note1 to create note title "EVND テスト" with enml newcontent tags {"evnd"}  attachments {"/Users/sho/Google_Drive/evnd/20170301/img/svg047dabd12ae35845ac973ba004c565f9.png", "/Users/sho/Google_Drive/evnd/20170301/img/svgdaa23cc5e3d9d0e3e69a01d9a3a2b58a.png", "/Users/sho/Google_Drive/evnd/20170301/img/clipboard_20170301_155941_20170301_162039.png"} created date0
	if (notebook named "mazamachi のノートブック" exists) then
		move note1 to notebook "mazamachi のノートブック"
	else
		set infostr to infostr & "(notebook does not exist)"
	end if
	set source URL of note1 to "/Users/sho/Google_Drive/evnd/20170301/evnd_テスト.enml"
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