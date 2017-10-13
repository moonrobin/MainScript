; -----------------------------
; Robin Lu's Auto Hotkey Script
; Use at own risk
; -----------------------------
; For HOME usage 
;
;==============================================================================
;                               Global Directives
;==============================================================================
#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode, 2
SendMode Input

;==============================================================================
;                                General Hotkeys
;==============================================================================

; Shift Wheel up/down: Horizontal scrolling
+WheelUp::
    ControlGetFocus, fcontrol, A
    ; Increase the int to change the speed of scrolling
    Loop 3
        SendMessage, 0x114, 0, 0, %fcontrol%, A
Return

; Media Controls
; Note: double binding of reverse
AppsKey & Down::
	Send, {Volume_Down}
	Send, {Volume_Down}
	Send, {Volume_Down}
Return

AppsKey & RControl::
RControl & AppsKey::
	Send, {Volume_Mute}
Return

AppsKey & Up::
	Send, {Volume_Up}
	Send, {Volume_Up}
	Send, {Volume_Up}
Return

AppsKey & Right::
	Send, {Media_Next}
Return

AppsKey & Left::
	Send, {Media_Prev}
Return

AppsKey & RShift::
RShift & AppsKey::
	Send, {Media_Play_Pause}
Return

;==============================================================================
;                                    Launchy
;==============================================================================

#IfWinExist ahk_exe Discord.exe
    #3::WinActivate, ahk_exe Discord.exe
#IfWinExist

#IfWinExist ahk_class iTunes
    #4::WinActivate, ahk_class iTunes
#IfWinExist

#IfWinNotExist ahk_class iTunes
    #4::Run, iTunes
#IfWinNotExist

#IfWinExist ahk_exe OUTLOOK.EXE
    #5::WinActivate, ahk_exe OUTLOOK.EXE
#IfWinExist

;==============================================================================
;                           Context Specific Hotkeys
;==============================================================================

; Runescape
; #IfWinActive ahk_class SunAwtFrame
; 
;     PgUp::
;     WheelUp::
;         MouseGetPos, , , , ClassNN
;         if (ClassNN = "SunAwtCanvas1" or ClassNN = "LWJGL1") {
;             GetKeyState, state, Shift
;             if (state != D)
;             {
;                 Loop 50
;                     Send {CtrlDown}{WheelUp}{CtrlUp}
;             } 
;             Else
;             {
;                 Loop 50
;                     Send {WheelUp}
;             }
;         }
;         else
;         {
;             Send {WheelUp}
;         }
;     Return
; 
;     PgDn::
;     WheelDown::
;         MouseGetPos, , , , ClassNN
;         if (ClassNN = "SunAwtCanvas1" or ClassNN = "LWJGL1") {
;             GetKeyState, state, Shift
;             if (state != D)
;             {
;                 Loop 50
;                     Send {CtrlDown}{WheelDown}{CtrlUp}
;             }
;             Else
;             {
;                 Loop 50
;                     Send {WheelDown}
;             }
;         }
;         else
;         {
;             Send {WheelDown}
;         }
;     Return
; 
; #IfWinActive

; Visual Studio
#IfWinActive Visual ahk_exe devenv.exe

    *MButton:: 
    MouseGetPos, posX, posY ; Get mouse position
    if (posY >= 110) { ; Mouse is not in Text Editor (Hard coded pos)
        Send {Ctrl down}{Alt down}{Click}{Alt up}{Ctrl up}
    } else {
        Send {Click middle}
    }
    Return

#IfWinActive

; Photos
#IfWinActive, Photos

    ^w::
    Send !{f4}
    Return

    ^Tab::
    Send {Right}
    Return

    ^+Tab::
    Send {Left}
    Return

#IfWinActive