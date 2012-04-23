
## Running Xcode 3 User Scripts from inside Xcode 4

This collection of scripts allows for the running of arbitrary Xcode 3 User Scripts under Xcode 4.
It works by replacing the old style %%%{PBXFilePath}%%% variables in your scripts with values gleamed from Xcode 4 via AppleScript.


## PopulateXcode3UserScriptVariables.sh

An osascript that takes an Xcode 3 User Script as input and outputs the same script with all the PBX User Script placeholders replaced with values pulled from Xcode 4 via Applescript.
This allows for the use of Xcode 3 scripts under Xcode 4.

usage: ./populateXcode3UserScriptVariables.sh "pathToXcode3Script.sh" 
output: contents of input script with PBX values replaced with values gathered from Xcode 4 via Applescript

Currently suports the below variables:

```objectivec
%%%{PBXAllText}%%%
%%%{PBXTextLength}%%%
%%%{PBXFilePath}%%%
%%%{PBXSelectionStart}%%%
%%%{PBXSelectionEnd}%%%
%%%{PBXSelectionLength}%%%
%%%{PBXSelectedText}%%%
```

Feel free to use it to wrap other Xcode 3 scripts.

## PropertyFromInstanceVariable_Xcode4.sh

A wrapper script around populateXcode3UserScriptVariables.sh && PropertyFromInstanceVariable.pl that allows for running the Xcode 3 User Action script under Xcode 4



## Running from inside Xcode 4

* First we need to put the contents of this repository somewhere stable on your local FS.
* Now open Preferences in Xcode.
* Select the Behaviours Tab.
* Click the + button, bottom left.
* Select the new behaviour and give it a meaningful Name "Generate properties from ivars".
* Set a meaningful shortcut. I used "Command-Shift-P".
* In the right hand pane, select the Run Checkbox.
* Select the "Choose Script..." Option.
* Browse to, and select "PropertyFromInstanceVariable_Xcode4.sh".
* Thats It. You are done. Test it out on an ivar that you want a property for.

(./BehavioursTab.png "Complete Behaviours Tab.")

## Using populateXcode3UserScriptVariables.sh to convert other Xcode 3 scripts. 

The easiest way will be to create a copy of the PropertyFromInstanceVariable_Xcode4.sh wrapper script and modify its config to point to the Xcode 3 script you wish to run.


## Licence

### PropertyFromInstanceVariable.pl 
<pre>
Created by Matt Gallagher on 20/10/08.
Copyright 2008 Matt Gallagher. All rights reserved.

Enhancements by Yung-Luen Lan and Mike Schrag on 12/08/09.
(mainly: multiple lines)
Copyright 2009 Yung-Luen Lan and Mike Schrag. All rights reserved.

Enhancements by Pierre Bernard on 20/09/09.
(mainly: underbar storage name, behavior, dealloc,É)
Copyright 2009 Pierre Bernard. All rights reserved.

Permission is given to use this source code file without charge in any
project, commercial or otherwise, entirely at your risk, with the condition
that any redistribution (in part or whole) of source code must retain
this copyright and permission notice. Attribution in compiled projects is
appreciated but not required.
</pre>

### PopulateXcode3UserScriptVariables.sh && PropertyFromInstanceVariable_Xcode4.sh
Released under the Modified BSD License. 

<pre>
Copyright (c) 2012 Richard Heard. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
</pre>

