; AutoHotkey script for unikeyboard
; Cheat Sheet: ^ Ctrl, ! alt, # Win, + Shift


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Debugging
#Warn
; ListVars
; Pause

; https://www.autohotkey.com/board/topic/41206-modal-vim/
; https://github.com/JakubNer/autokey-autohotkey-vim-nav

; Variables first

num =




; Timer
; ---------------------------------------

SetTimer, checkMultipliers, 800

checkMultipliers()  
{
    ;If (not A_PriorHotkey < 10)
    If (A_TimeSincePriorHotkey > 800)
        global num = 
    return
}


; Greek Symbols
<^>!a::Send α   ; alpha
<^>!+a::Send Α  ; Alpha
<^>!b::Send β   ; beta
<^>!+b::Send Β  ; Beta
<^>!g::Send γ   ; gamma
<^>!+g::Send Γ  ; Gamma
<^>!d::Send δ   ; delta
<^>!+d::Send Δ  ; Delta
<^>!e::Send ε   ; epislon
<^>!+e::Send €  ; leave Euro untouched
<^>!z::Send ζ   ; zeta
<^>!+z::Send Ζ  ; Zeta
<^>!h::Send η   ; eta
<^>!+h::Send Η  ; Eta
<^>!j::Send θ   ; theta
<^>!+j::Send Θ  ; Theta
<^>!i::Send ι   ; iota
<^>!+i::Send Ι  ; Iota
<^>!k::Send κ   ; kappa
<^>!+k::Send Κ  ; Kappa
<^>!l::Send λ   ; lambda
<^>!+l::Send Λ  ; Lambda
<^>!m::Send μ   ; mu
<^>!+m::Send Μ  ; Mu
<^>!n::Send ν   ; nu
<^>!+n::Send Ν  ; Nu
<^>!x::Send ξ   ; xi
<^>!+x::Send Ξ  ; Xi
<^>!o::Send ο   ; omicron
<^>!+o::Send Ο  ; Omicron
<^>!p::Send π   ; pi
<^>!+p::Send Π  ; Pi
<^>!r::Send ρ   ; rho
<^>!+r::Send Ρ  ; Rho
<^>!s::Send σ   ; sigma
<^>!+s::Send Σ  ; Sigma
; <^>!s::Send ς  ; final sigma
<^>!t::Send τ   ; tau
<^>!+t::Send Τ  ; Tau
<^>!y::Send υ   ; upsilon
<^>!+y::Send Υ  ; Upsilon
<^>!f::Send φ   ; phi
<^>!+f::Send Φ  ; Phi
<^>!c::Send χ   ; chi
<^>!+c::Send Χ  ; Chi
<^>!u::Send ψ   ; psi
<^>!+u::Send Ψ  ; Psi
<^>!w::Send ω   ; omega
<^>!+w::Send Ω  ; Omega


; Typography
<^>!1::Send „
<^>!2::Send “
<^>!3::Send ”
<^>!.::Send …
<^>!-::Send –
<^>!+-::Send —
<^>!Left::Send ←
<^>!Right::Send →
<^>!Up::Send ←
<^>!Down::Send →
<^>!+Left::Send ⇐
<^>!+Right::Send ⇒
<^>!ä::Send {#}



; Math Symbols (Right Ctrl)
>^e::Send ∈
>^+e::Send ∉
>^i::Send ∫

>^-::Send ---------------------------------------


vim_off(){
    SetCapsLockState, off
    if GetKeyState("LShift")
        Send {LShift Up}
    ToolTip
    global num =
    return
}

vim_on(){
    SetCapsLockState, on
    ToolTip, VIM-Mode`n===ON===, 20, 20
    return
}

; Disable the key (or don't)
CapsLock::Return


CapsLock Up::
    If (A_PriorKey = "CapsLock") ;  If CapsLock was pressed alone
        if (GetKeyState("CapsLock", "T") = 1){
            vim_off()
        } else {
            vim_on()
        }
    return


:*?:jk::
:*?:kj::
    vim_on()
    return

; Capslock Press
; --------------------------------------
#If GetKeyState("CapsLock", "P") or GetKeyState("CapsLock", "T")

Space::
    if (GetKeyState("CapsLock", "T") = 1){
	    vim_off()
    } else {
	    vim_on()
    }
    return

q::Send, {ESC}

; Moving Cursor + Modifier
; ---------------------------------------
*h::Send, {Blind}{Left %num%}
*k::Send, {Blind}{Up %num%}
*j::Send, {Blind}{Down %num%}
*l::Send, {Blind}{Right %num%}

u::Send, {WheelUp}
d::Send, {WheelDown}
m::Send, {LButton}

+u::Send, {PgUp %num%}
+d::Send, {PgDn %num%}

^::Send, {Home}
$::Send, {End}

b::Send, ^{Left %num%}
w::Send, ^{Right}^{Right %num%}^{Left %num%}
e::Send, ^{Right %num%}
+e::Send, {End}
+b::Send, {Home}

; Multiplierss
; ---------------------------------------

1::
2::
3::
4::
5::
6:: 
7::
8::
9::
0::
    num = %num%%A_ThisHotKey%
    return


; search and replace
; ---------------------------------------
t::
    Send, ^f
    vim_off()
    Input, L, L1     ;; read a single char
    Send %L%{ESC}
    vim_on()         ;; Return back to vim mode
    return    


.::
^f::
    Send, ^f
    vim_off()
    KeyWait, Esc, D  ;; Esc exits replace dialog
    vim_on()         ;; Return back to vim mode
    return

+-::
    Send, ^h
    vim_off()
    return

n::Send {F3}{ESC}    ;; Search next
+n::Send +{F3}{ESC}  ;; Search previous


+<::Send, {Home}`t                      ;; Indent  
<::Send, {Shift Down}{Tab}{Shift Up}   ;; Un-indent



; Visual mode
a::Send, ^{Left}^+{Right}
+a::Send, {Home}+{End}

v::
    if GetKeyState("LShift")
        Send {LShift Up}
    else
        Send {LShift Down}
    return


x::Send, {Del}
z::Send, ^z
+z::Send, ^y
y::Send, ^c
p::Send, ^v

s::
    SendInput, {BS}
    vim_off()
    return
o::
    SendInput , {End}{Enter}
    vim_off()
    return
+o::
    SendInput , {Home}{Enter}{Up}
    vim_off()
    return
c::
    Send, ^{Left}^+{Right}
    vim_off()
    return


i::vim_off()
+i::
    Send, {Home}
    vim_off()
    return



; Extra: lines
ü::Send, {End}{Del}{Space}   ; join lines
ö::Send, {Home}+{End}^c{Right}+{Enter}^v   ; duplicate line


; End if directive
#if








; Windows Shortcuts
#+h::Send, #{Left}
#+l::Send, #{Right}

#<::Send, !+{ESC}
#y::Send, !{ESC}


; Date
#,::
    FormatTime, CurrentDateTime,, yyyy-MM-dd
    SendInput %CurrentDateTime%
return



; Seach selected term in Browser
#s::
    Send, ^c
    Sleep 50
    Run, https://www.google.com/search?q=%clipboard%
    Return


; auto correct
::teh::the
::abnd::and
::ot::to
::fo::of




::mfg::Mit freundlichen Grüßen`nEmanuel Regnath
::vg::Viele Grüße`nEmanuel
::@t::emanuel.regnath@t-online.de
::@s::emanuel.regnath@siemens.com
::@g::emanuel.regnath@gmail.com

::tldr::TL;DR

::\l::\begin`{`itemize}{Enter}\item
