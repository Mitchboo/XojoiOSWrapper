XojoiOSWrapper
==============

Module that brings legacy and additional functions to Xojo iOS

Here is the first of no doubt a long series. This module contains the functions I needed to adapt older code, 
plus a couple declares (setfocus/clearfocus) needed to activate and remove the keyboard in code in the Textfield or TextArea.

This repository contains the files as a xojo_project so they can be viewed online.The project now contains classes, each on a separate page :

- ViewBackgroundColor : changes the view background color

- SetNavigationBarColor

But if all you need is the wrapper module, simply download and drag Wrapper.xojo_binary_code into your program.

Methods available : 
Asc(),
Backdrop() (for iOSButton),
BackgroundColor (for TextField and TextArea),
BoolToText,
CDbl(), 
Chr(),
Clearfocus,
EncodeBase64
EncodeBase64 with memoryblock in, avoiding the sometimes impossible convertion to Text,
DecodeBase64(),
EncodeURLComponent(),
Floor(),
ForeColor,
Auto.FindType
hideTabBar(),
Instr(),
Left(),
Len(),
HTMLViewer.LoadPage(),
MainScreenScale,
MaxWidth(),
MD5, 
Mid(),
Msgbox(),
NthField(),
redColor,
Right(),
SetFocus,
SetBackgroundRoundedRectangle() (for iOSButton),
SetSeparatorColor() (for iOSTable),
SetSeparatorStyle() (for iOSTable),
ShellPath
ShowURL,
StringHeight(),
StringWidth(),
StripAccents(),
TextAscent(),
Tab (constant),
CC.TrueWindow, CC.TrueView,
Val(),

Constants :
EndOfLine

Will grow with future contributions ...

See http://dethomsoft.com/download.html for dtPLugins for iOS by Jean-Paul Devulder 
See https://github.com/kingj5/iOSKit for the iOSKit series of classes by Jason King
See https://github.com/sbeardsl/xojoGestures for a module from Stephen J. Beardslee which brings gesture support.
See https://github.com/UBogun/Xojo-AppleLib/ from Ulrich Bogun for extended modules and classes.
