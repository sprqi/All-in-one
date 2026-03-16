#include <FindText>
#include ..\..\main.ahk
#include variables.ahk
CoordMode 'Mouse', 'Screen'
SendMode 'Event'

RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
global App
global NextIndex


;unit refers to the 
placeunits(unit,no){
    key:=1
    global disconnected
    
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()

    Critical "Off"
    Presskey(key)
    while True {
        coord:=StrSplit(Trim(Slots[NextIndex[unit]],"`r`n"),",")
        unitcoordx := integer(coord[1])
        unitcoordy := integer(coord[2])
        clickl(unitcoordx,unitcoordy)
        sleep 500
        MouseMove(1122,633)
        sleep(500)
        ; At successful placement:
        if FindText(&X, &Y, 602, 222, 652, 269, 0, 0, upg0) and (no>0){
            ClickXButton()
            NextIndex[unit]++    ; ← use next coordinate
            no--
            if no=0{
                break
            }
            MouseMove coord[1], coord[2], 5  ;unit coords
            Presskey(key)
        }
        else if  find(failed) || find(victory){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
        else if find(reconnect,&x,&y){
            sleep(500)
            clickl(x,y,2)
            disconnected:=True
            Reload
        }
        else if disconnected{
            Break
        }

        sleep 200
    }

    AppendLog("Placed " . (NextIndex[unit]-1) . " units of " . unit)
}
place7thslot(unit){
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    AinzLocation:=StrSplit(Obj.Read(),"`n")
    Obj.Close()

    coord:=StrSplit(Trim(AinzLocation[1],"`r`n"),",")
    unitcoordx := integer(coord[1])
    unitcoordy := integer(coord[2])

    
    Obj:=FileOpen("Slots\Slot7","r")
    unit7:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coordinates:=StrSplit(Trim(unit7[1],"`r`n"),",")
    x := integer(coordinates[1])
    y := integer(coordinates[2])
    clickl(unitcoordx,unitcoordy)
    sleep 200
    clickl(645,420) ;clicks world item
    sleep 200
    clickl(690,466) ;clicks place 7th unit
    sleep 200
    clickl(526,246) ;clicks search bar
    sleep 200
    Send '{Blind}isca' ;types units name
    clickl(544,300)
    sleep 100
    clickl(642,352) ;clicks select
    sleep 500
    while true{
        clickl(x,y)
        sleep 500
        if find(upg0){
            ClickXButton()
            Break
        }
        else if  find(failed) || find(victory){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
    }

    Critical "Off"     
}

sellunit(unit,key){
    ClickXButton()
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    clickl(coordx,coordy)
    Send("{Blind}x")
}

; --- Specific helper wrappers for convenience ---
place1(unit) => placeUnits(unit, 1)
place2(unit) => placeUnits(unit, 2)
place3(unit) => placeUnits(unit, 3)
place4(unit) => placeUnits(unit, 4)
place5(unit) => placeUnits(unit, 5)