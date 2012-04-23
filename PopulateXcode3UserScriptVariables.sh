#!/usr/bin/osascript

-- Created by Richard Heard on 23/04/12.
-- Copyright (c) 2012 Richard Heard. All rights reserved.
--
-- Script that uses Applescript to populate Xcode 3 PBX User Script Variables for a given script
-- This allows for the use of Xcode 3 scripts under Xcode 4
--
--  usage: ./populateXcode3UserScriptVariables.sh "pathToXcode3Script.sh" 
-- output: contents of input script with PBX values replaced with values gathered from Xcode 4 via Applescript


-- search & replace text method
to switchText from thisText to replacement instead of searchTerm
	set AppleScript's text item delimiters to searchTerm
	set thisText to thisText's text items
	set AppleScript's text item delimiters to replacement
	set thisText to "" & thisText
	set AppleScript's text item delimiters to {""}
	return thisText
end switchText


-- get cmd line args
on run file_to_be_populated

-- get properties from the current xcode file in the old PBX Form
tell application "Xcode"
	
	set current_document to text document 1 whose name ends with (word -1 of (get name of window 1))
	tell current_document
		
		-- capture variables for later replacement
		set PBXAllText to (get text of contents)
		set PBXTextLength to (get length of PBXAllText)

		set PBXFilePath to path
		
		set {PBXSelectionStart, PBXSelectionEnd} to selected character range
		set PBXSelectionLength to PBXSelectionEnd - PBXSelectionStart
		if (PBXSelectionLength > -1) then
			set PBXSelectedText to (text PBXSelectionStart thru PBXSelectionEnd of PBXAllText)
		else
			set PBXSelectedText to ""
		end if
		
		-- convert integers to strings
		set PBXTextLength to PBXTextLength as text
		set PBXSelectionStart to PBXSelectionStart as text
		set PBXSelectionEnd to PBXSelectionEnd as text
		set PBXSelectionLength to PBXSelectionLength as text
		
	end tell
end tell

-- open the script to be processed
set theScript to (POSIX file file_to_be_populated)

open for access theScript
set scriptContents to (read theScript)
close access theScript


-- replace PBX values
set scriptContents to (switchText from scriptContents to PBXAllText instead of "%%%{PBXAllText}%%%")
set scriptContents to (switchText from scriptContents to PBXTextLength instead of "%%%{PBXTextLength}%%%")

set scriptContents to (switchText from scriptContents to PBXFilePath instead of "%%%{PBXFilePath}%%%")

set scriptContents to (switchText from scriptContents to PBXSelectionStart instead of "%%%{PBXSelectionStart}%%%")
set scriptContents to (switchText from scriptContents to PBXSelectionEnd instead of "%%%{PBXSelectionEnd}%%%")
set scriptContents to (switchText from scriptContents to PBXSelectionLength instead of "%%%{PBXSelectionLength}%%%")
set scriptContents to (switchText from scriptContents to PBXSelectedText instead of "%%%{PBXSelectedText}%%%")

(*
PBXTextLength
PBXSelectionLength
PBXSelectedText

*)

--return the modified text
return scriptContents as text

end run
