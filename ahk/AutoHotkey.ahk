; AutoHotkey script for unikeyboard
; Cheat Sheet: ^ Ctrl, ! alt, # Win, + Shift

; Features
; * vim mode: use vim like behavior everywhere!
; * emojis: write fa or github names → will auto expand


#Persistent  ; Keep the script running until the user exits it.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Personalized Settings → EDIT THIS and "Mails" section!
name = Max Mustermann




; Variables first
num =


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
<^>!u::Send υ   ; upsilon
<^>!+u::Send Υ  ; Upsilon
<^>!f::Send φ   ; phi
<^>!+f::Send Φ  ; Phi
<^>!c::Send χ   ; chi
<^>!+c::Send Χ  ; Chi
<^>!y::Send ψ   ; psi
<^>!+y::Send Ψ  ; Psi
<^>!w::Send ω   ; omega
<^>!+w::Send Ω  ; Omega


; Typography
<^>!1::Send „
<^>!2::Send “
<^>!3::Send ”
<^>!4::Send €
<^>!+8::Send ⟨
<^>!+9::Send ⟩
<^>!.::Send …
<^>!+.::Send ·
<^>!-::Send –
<^>!+-::Send —
<^>!Left::Send ←
<^>!Right::Send →
<^>!Up::Send ↑
<^>!Down::Send ↓
<^>!+Left::Send ⇐
<^>!+Right::Send ⇒
<^>!+Up::Send ⇑
<^>!+Down::Send ⇓
<^>!ö::Send §
<^>!ä::Send {#}
<^>!+ä::Send '


; Compose arrows ↓↖↗↙↘
:?:→←::⇄
:?:←→::⇆
:?:↑↓::⇅
:?:⇑⇓::⇕


; Math Symbols (Right Ctrl)
>^SC029::Send ₀
>^1::Send ₁
>^2::Send ₂
>^3::Send ₃
>^4::Send ₄
>^5::Send ₅
>^6::Send ₆
>^7::Send ₇
>^8::Send ₈
>^9::Send ₉
>^0::Send ≠

>^+SC029::Send ⁰
>^+1::Send ¹
>^+2::Send ²
>^+3::Send ³
>^+4::Send ⁴
>^+5::Send ⁵
>^+6::Send ⁶
>^+7::Send ⁷
>^+8::Send ⁸
>^+9::Send ⁹
>^+0::Send ≈

>^++::Send ⁺
>^+-::Send ⁻






>^>!0::Send ⁰
>^>!1::Send ¹
>^>!2::Send ²
>^>!3::Send ³
>^>!4::Send ⁴
>^>!5::Send ⁵
>^>!6::Send ♀
>^>!+6::Send ♂


>^q::Send ℚ
>^w::Send √
>^e::Send ∈
>^+e::Send ∉
>^r::Send ℝ
>^t::Send ⊤
>^+t::Send ⊥
>^z::Send ℤ
>^u::Send ⋃
>^+u::Send ⋂
>^i::Send ∫
>^+i::Send ∞
>^o::Send ∨
>^p::Send ∝
>^+::Send ±


>^a::Send ∧
>^s::Send ∑
>^d::Send ∂


>^<::Send ≤
>^+<::Send ≥
>^y::Send ≥
>^+y::Send ✔
>^x::Send ×
>^+x::Send ✘
>^c::Send ℂ
>^v::Send ∀
>^b::Send ∃
>^+b::Send ∄
>^n::Send ℕ
>^-::Send ∓


  



; >^-::Send ---------------------------------------

; Vim Mode
; ------------------------------------------------
; navigation mapping: ijkl + u (up), o(dOwn)
; mouse mapping: wasd


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
    SetScrollLockState, Off
    SetNumLockState, Off
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


; Capslock Press
; --------------------------------------
#If GetKeyState("CapsLock", "P") or GetKeyState("CapsLock", "T")

Space::vim_off()
*q::SendInput {Blind}{ESC}


; Moving Cursor + Modifier
; ---------------------------------------
$k::Down
$i::Up
$j::Left
$l::Right

*u::Send, {Blind}{PgUp %num%}
*o::Send, {Blind}{PgDn %num%}

!u::Send, {Up 5}
!o::Send, {Down 5}


h::Send, ^{Left %num%}
+h::Send, +^{Left %num%}
!h::Send, {Home}
+!h::Send, +{Home}
^h::Send, {Home}
+^h::Send, +{Home}
SC027::Send, ^{Right %num%}
+SC027::Send, +^{Right %num%}
!SC027::Send, {End}
+!SC027::Send, +{End}
^SC027::Send, {End}
+^SC027::Send, +{End}

; Alt+Gr for Ctrl + J/K/L/I U/O
<^>!h::^h
<^>!j::^j
<^>!k::^k
<^>!l::^l
<^>!i::^i
<^>!u::^u
<^>!o::^o





; Scroll movement
a & i::
    While GetKeyState("i","P")
    {
        SendInput {WheelUp}
        Sleep, 70
    }
    return
a & k::
    While GetKeyState("k","P")
    {
        SendInput {WheelDown}
        Sleep, 70
    }
    return
a & j::
    While GetKeyState("j","P")
    {
        SendInput {WheelLeft}
        Sleep, 70
    }
    return
a & l::
    While GetKeyState("l","P")
    {
        SendInput {WheelRight}
        Sleep, 70
    }
    return
a & u::SendInput ^{WheelUp}
a & o::SendInput ^{WheelDown}
a & Enter::Send, {LButton}
a & Space::Send, {LButton}
m::Send, {LButton}

; delete combinations
s & j::SendInput {BS}
s & l::SendInput {Del}
s & h::SendInput ^+{Left}{BS}
s & SC027::SendInput ^+{Right}{Del}
s & e::SendInput +{End}{Del}
s & b::SendInput +{Home}{BS}
s::SendInput {BS}
+s::SendInput {Del}
^s::SendInput ^s


^::Send, {Home}
$::Send, {End}



; Multiplierss
; ---------------------------------------



; search and replace
; ---------------------------------------
t::
    Send, ^f
    vim_off()
    Input, L, L1     ;; read a single char
    Send %L%{ESC}
    vim_on()         ;; Return back to vim mode
    return    


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

n::
    SendInput {F3}{ESC}   ;; Search next
    return
+n::
    Send +{F3}{ESC}  ;; Search previous
    return


+<::
.::SendInput {Home}`t                     ;; Indent  
<::
,::SendInput {Shift Down}{Tab}{Shift Up}   ;; Un-indent



; Visual mode (mark & change)
; ---------------------------------------
w::SendInput {Right}^{Left}^+{Right}  ;; mark word
+w::SendInput {Home}+{End}             ;; mark line

d::                            
    SendInput {Right}^{Left}^+{Right}
    vim_off()
    return
!d::
    SendInput {Home}+{End}      ; mark line
    vim_off()
    return


; Lines
y::
+d::    ; duplicate line            
    cbtemp := ClipboardAll
    Clipboard =
    SendInput {Home}+{End}^c
    ClipWait, 1
    SendInput {End}+{Enter}^v
    Clipboard := cbtemp
    return


+!d::SendInput {End}{Del}{Space}   ; join lines

#::
    if GetKeyState("LShift")
        Send {LShift Up}
    else
        Send {LShift Down}
    return

; control pass thorugh

z::Send, ^z
+z::Send, ^y
c::Send, ^c
v::Send, ^v


~x::
    SendInput ^x
    vim_off()
    return
r::
    SendInput {BS}
    vim_off()
    return
a::
    SendInput {Right}^{Left}^{Right}
    vim_off()
    return
+a::
    SendInput ^{Left}
    vim_off()
    return
*b::
    SendInput {Blind}{Home}
    vim_off()
    return
*e::
    SendInput {Blind}{End}
    vim_off()
    return
^BS::                       ; delete to word start
    SendInput ^+{Left}{BS}
    vim_off()
    return
^+BS::                      ; delete to line start
    SendInput +{Home}{BS}
    vim_off()
    return
^Del::                      ; delete to word end
    SendInput ^+{Right}{Del}
    vim_off()
    return
^+Del::                      ; delete to line end
    SendInput +{End}{Del}
    vim_off()
    return
p::
^Enter::
    SendInput {End}{Enter}
    vim_off()
    return
+p::
+^Enter::
    SendInput {Home}{Enter}{Up}
    vim_off()
    return
!Enter::
    SendInput {Enter}
    vim_off()
    return











!3::Send, {F3}
!5::Send, {F5}


; End if directive
#if






; Windows Shortcuts
; -------------------------------------------------------
#+h::Send, #{Left}
#+l::Send, #{Right}

#<::Send, !+{ESC}   ; switch windows
#y::Send, !{ESC}

#f::SendInput {F11}


#q::SendInput !{F4}  ; close window
#w::SendInput ^w     ; close tab

; media keys Win+Ctrl+Arrows
#^Right::SendInput {Media_Next}
#^Left::SendInput {Media_Prev}
#^Down::SendInput {Media_Play_Pause}

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


; Fluent Search Improvements
#Enter::SendEvent ^+{Space}
#m::SendEvent ^m

; Windows explorer
#IfWinActive ahk_class CabinetWClass
!4::SendInput +{AppsKey}l
#If



; hotstrings
; ---------------------------------------
#Hotstring c r

; auto correct
::teh::the
::abnd::and
::ot::to



::sgf::
    SendInput Sehr geehrte Frau`n`nvielen Dank für die Info.`n`nMit freundlichen Grüßen`n%name%{Up 5}{End}
    return
::sgh::
    SendInput Sehr geehrter Herr`n`nvielen Dank für die Info.`n`nMit freundlichen Grüßen`n%name%{Up 5}{End}
    return
::h@::
    SendInput Hallo`n`nvielen Dank für die Info.`n`nViele Grüße`n%name%{Up 5}{End}
    return
::mfg::
    SendInput Mit freundlichen Grüßen`n%name%
    return
::vg::
    SendInput Viele Grüße`n%name%
    return


; Mails (EDIT)
::mm@g::max.mustermannh@gmail.com


::tldr::TL;DR

:T:----::--------------------------------------
:T:-----::----------------------------------------------------------------
:T:====::======================================
:T:+--+::`+------------`+`n|            |`n`+------------`+



::\l::\begin`{`itemize}{Enter}\item

:::house::🏠
:::bug::🐞
:::bee::🐝
:::fish::🐟
:::cat::🐱
:::cow::🐮
:::whale::🐳 
:::horse::🐴
:::dog::🐶
:::pig::🐷
:::frog::🐸

:::+1::👍
:::_1::👎
:::cop::👮
:::pill::💊

:::bulb::💡
:::bomb::💣
:::zzz::💤
:::boom::💥
:::100::💯
:::droplet::💧
:::date::📅 
:::calendar::📆

; auto corrections
:?:aiton::ation
:?:itino::ition
::cant::cannot
::dont::do not

