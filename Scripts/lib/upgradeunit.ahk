#include <FindText>
#include variables.ahk
CoordMode 'Mouse', 'Screen'
SendMode 'Event'
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"


global App
; ------------------------------
; 🔹 Level icons (FindText patterns)
; ------------------------------


; ------------------------------
; 🔹 Generalized Upgrade Function
; ------------------------------
upgrade(unit, key, no := 1) {
    ClickXButton()

    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    clickl(coordx,coordy)
    nomatch:=0
    while True {
        Presskey("t",50)
        Sleep 700
        ; try each level icon until one matches
        if !FindText(&X, &Y, 552, 436, 901, 560, 0.2, 0.2, lessmoney){
            nomatch++
            AppendLog("Upgraded " . nomatch)
            sleep(1000)
            if nomatch=no || FindText(&X, &Y, 414, 405, 485,497 ,0.1, 0.1, maxupgraded){
                Break
            }    
        }
        
        else if find(retry,&x,&y) {
            clickl(x,y)
            if !find(retry,&x,&y){
                break
            }
        }
        else if  find(failed) || find(victory){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
    }
    ClickXButton()
    AppendLog("Upgraded to level " . no . " of " . unit)
}

autoupgrade(unit,key){
    ClickXButton()
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    clickl(coordx,coordy)
    sleep(1000)
    Send("{Blind}z")
    sleep(1000)
    ClickXButton()
    AppendLog("Turned on autoupgrade of " . unit)
}

; ------------------------------
; 🔹 Convenience Wrappers (Optional)
; ------------------------------
upgrade1(unit,key) => upgrade(unit, key, no := 1)
upgrade2(unit,key) => upgrade(unit, key, no := 2)
upgrade3(unit,key) => upgrade(unit, key, no := 3)
upgrade4(unit,key) => upgrade(unit, key, no := 4)
upgrade5(unit,key) => upgrade(unit, key, no := 5)
upgrade6(unit,key) => upgrade(unit, key, no := 6)
upgrade7(unit,key) => upgrade(unit, key, no := 7)
upgrade8(unit,key) => upgrade(unit, key, no := 8)
upgrade9(unit,key) => upgrade(unit, key, no := 9)
upgrade10(unit,key) => upgrade(unit, key, no := 10)
upgrade11(unit,key) => upgrade(unit, key, no := 11)
upgrade12(unit,key) => upgrade(unit, key, no := 12)
upgrade13(unit,key) => upgrade(unit, key, no := 13)
upgrademax(unit,key) => upgrade(unit, key, no := 'max')

farm(mode){
    if mode==1{
        upgrade1('Slot6',1)
        upgrade1('Slot6',2)
        upgrade1('Slot6',3)
        upgrade1('Slot5',1)

        upgrade2('Slot6',1)
        upgrade2('Slot6',2)
        upgrade2('Slot6',3)
        upgrade2('Slot5',1)

        upgrade3('Slot6',1)
        upgrade3('Slot6',2)
        upgrade3('Slot6',3)
        upgrade3('Slot5',1)

        upgrade4('Slot6',1)
        upgrade4('Slot6',2)
        upgrade4('Slot6',3)
        upgrade5('Slot5',1)
    }
    else if mode==2{
        upgrade1('Slot6',1)
        upgrade1('Slot6',2)
        upgrade1('Slot6',3)
        upgrade1('Slot5',1)

        upgrade2('Slot6',1)
        upgrade2('Slot6',2)
        upgrade2('Slot6',3)
        upgrade2('Slot5',1)

        upgrade3('Slot6',1)
        upgrade3('Slot6',2)
        upgrade3('Slot6',3)
        upgrade3('Slot5',1)

        upgrade4('Slot6',1)
        upgrade4('Slot6',2)
        upgrade4('Slot6',3)
        upgrademax('Slot5',1)
    }
}