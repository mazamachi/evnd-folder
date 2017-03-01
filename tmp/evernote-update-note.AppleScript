on readFile(unixPath)
	set targetFile to (open for access (POSIX file unixPath))
	set newcontent to (read targetFile as «class utf8»)
	close access targetFile
	return newcontent
end readFile

set newcontent to readFile("/Users/sho/Google_Drive/evnd/20170301/世界で闘うプログラミング力を鍛える150問.html")
set infostr to ""
tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s133/401be46e-5672-4f04-b52a-ff80b8207f79/401be46e-5672-4f04-b52a-ff80b8207f79/"
	if note1 is not missing value then
		if (notebook named "mazamachi のノートブック" exists) then
			move note1 to notebook "mazamachi のノートブック"
		else
			set infostr to infostr & "(notebook does not exist)"
		end if
		set title of note1 to "世界で闘うプログラミング力を鍛える150問"
		set HTML content of note1 to newcontent
		set oldtags to tags of note1
		set count2 to count of oldtags
		if count2 is not 0 then
			unassign oldtags from note1
		end if
		if (not (tag named "evnd" exists)) then
			set tag1 to make tag with properties {name: "evnd"}
		else
			set tag1 to tag "evnd"
		end if
		assign tag1 to note1
		if (not (tag named "programming" exists)) then
			set tag1 to make tag with properties {name: "programming"}
		else
			set tag1 to tag "programming"
		end if
		assign tag1 to note1
		if (not (tag named "career" exists)) then
			set tag1 to make tag with properties {name: "career"}
		else
			set tag1 to tag "career"
		end if
		assign tag1 to note1
		set date1 to modification date of note1
	end if
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

if date1 is not missing value then
	set infostr to infostr & dateToString(date1)
	return infostr
else
	return infostr
end if
