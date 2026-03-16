#Requires AutoHotkey v2.0
#Include <FindText>
#include otherfuncs.ahk
#include placeunit.ahk
#include variables.ahk
global App

getunit(no){
    global disconnected
    a:=0
    while True{
        sleep(2000)
        Send("{Blind}e")
        sleep(700)
        if FindText(&X, &Y, 520,374,820,574, 0.2,0.2, purchased) || FindText(&X, &Y, 520,374,820,574, 0.2,0.2, maxpurchased){
            a++
            AppendLog("eFound")
            sleep(2000)
            if a=no{
                Break
            }
        }
        else if find(failed){
            clickl(700,486)
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
    }
    sleep(2000)
}
rabbithero(n){  
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(665,94)
    sleep(1250)
    clickr(347,117)
    sleep(2000)
    clickl(1122,633)
    getunit(n)
    tpToSpawn()
}

speedwagon(n){
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(597,114)
    sleep(2000)
    clickl(1122,633)
    getunit(n)
}

takaroda(n){
    sleep(100)  
    clickr(731,186)
    sleep(1250)
    clickr(707,153)
    sleep(1250)
    clickr(621,216)
    sleep(1250)
    clickl(1122,633)
    getunit(n)
}

nami(n){
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(665,94)
    sleep(1250)
    clickr(439,104)
    sleep(2000)
    clickl(1122,633)
    getunit(n)
}

sunraku(n){
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(665,94)
    sleep(1250)
    clickr(531,137)
    sleep(2000)   
    clickl(1122,633)
    getunit(n)
    tpToSpawn()
}

aokiji(n){
    sleep(100)
    clickr(342,338)
    sleep(1250)
    clickr(642,635)
    sleep(1250)
    clickr(518,545)
    sleep(1250)
    clickl(1122,633)
    getunit(n)
    tpToSpawn()           
}

mage(n){
    sleep(100)
    clickr(342,338)
    sleep(1250)
    clickr(642,635)
    sleep(1250)
    clickr(666,515)
    sleep(1250)
    clickl(1122,633)
    getunit(n)
    tpToSpawn()  
}

mageability(){
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\Slot6", "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    for key in [1,2,3]{
        coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
        coordx := integer(coord[1])
        coordy := integer(coord[2])
        clickl(coordx,coordy)
        clickl(664,298)
        if key=2{
            clickl(933,477) ;click vangaurd
            clickl(1024,181)
            Continue
        }
        clickl(732,477) ;click duelist
        clickl(1024,181) ;click x button
    }      
}

activateportal(){
    loop 2{
        send("{d down}")
        sleep(240)
        send("{d up}") 
        sleep(1250)   
        send("{Blind}eee")
        sleep(2000)
        send("{s down}")
        sleep(50)
        send("{s up}")
        sleep(1250)
        send("{Blind}eee") 
    }
    sleep(500)
    tpToSpawn() 
}
benimaru(n){
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(665,94)
    sleep(1250)
    clickr(492,342)
    sleep(1300)
    clickl(1122,633)
    getunit(n)
    tpToSpawn()
    sleep 1250
}

queen(n){
    sleep(100)
    clickr(731,186)
    sleep(1250)
    clickr(597,114)
    sleep(1250)
    clickr(367,290)
    sleep(2000)
    clickl(1122,633)
    getunit(n)
    tpToSpawn() 
    sleep 1250   
}

monarch(unit,key){
    global disconnected

    while True{
        tpToSpawn()
        clickr(349,306)
        sleep(1250)
        clickr(393,336)
        sleep(1250)
        clickr(349,306)
        sleep(1250)
        clickr(757,61)
        sleep(1250)
        clickr(730,61)
        sleep(2000)
        clickl(1122,633)
        send("{Blind}e")
        sleep(500)
        if FindText(&X, &Y, 674, 427, 790, 473, 0.2,0.2, getmonarch){
            tpToSpawn()
            break
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
        sleep(1000)
    }
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    clickl(coordx,coordy)
    sleep(1000)
    ClickXButton()

}
modifier(){
    global disconnected
    ans:=False
    while true{
        clickl(1122,633)
        if find(fortune,&x,&y){
            clickl(x,y)
            sleep 1500
            clickl(1122,633)
            sleep(1500)
            ans:=True    
        }
        else if find(text1,&x,&y){
            clickl(x,y)
            sleep 1500
            clickl(1122,633)
            sleep(1500)
            if !find(text1,&x,&y){
                clickl(1000,371)
                sleep(500)
                Send("{WheelDown}")
                sleep(500)
            }
            Continue
        }

        else if find(armorbegone,&x,&y){
            clickl(x,y)
            sleep(1500)
            clickl(1122,633)
            sleep(1500)
            if !find(armorbegone,&x,&y){
                clickl(1000,371)
                sleep(500)
                Send("{WheelUp 6}")
                sleep(500)
                Break
            }
            Continue
    
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
        else{
            tpToSpawn()
            if ans{
                Break
            }
            clickr(349,306)
            sleep(1250)
            clickr(393,336)
            sleep(1250)
            clickr(349,345)
            sleep(1250)
            clickr(618,634)
            sleep(1250)
            clickr(683,638)
            sleep(1250)
            clickr(690,536)
            sleep(1000)
            clickl(1122,633)
            send("{Blind}eeee")
            sleep(1000)
            send("{Blind}eeee")
            sleep(1250)
            Continue
        }
    }
}