#Requires Autohotkey v2
#include <Findtext>
#include position.ahk
#include placeunit.ahk

Stages:=map(
    "Namek","|<namek>*95$159.zzzzzzzzzzzzzzzzzzzzzzzqzzzzzzzVrzzzzknzzzzDzy7zzwbzzzzzzwAzzzzw2TzzzlzzUTzzYzzzzzzzjXXfRzXUksMwDzwT33kUwHzzzzw88A3Dy44623lzzkkEA4307zzzzkaNj9zsH4W2TC0z0G94WF8zzzzxYnBwTymMYE3tk7q2H8YGN7zzzzUX1jXzUFUkETDzw22NUUM0zzzzwCQRyzy7A723tzzkkHA472TzzzzzzzzbzzzzkTzzzzzzzzzzzzzzzzzzzxzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzztzzzzzzzzzzzzzzzjzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzk00000000000000000001y2Tyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzs80Tzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzzzzy0rzzzzzzzzzzzzzzzzzzzzzzzzs0zzzzzzzzzzzzzzzzzzzzzzzzzbDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7UTzzy1zzzzzzzzzzzzzzzzzU0000CRzUzzzzzzzzzzzzzzzzzk000000DwCzzzzzzzzzzzzzzzzs0000001zz3zzzzzzzzzDzzzzzs0000000Dzk/zzzzzzzzxzzzzzy00000005yENDzzzzzzzzjzzzzzU0000000jsHDzzzzzzzzxzzzzzs00000005z6Nzzzzzzzzzjzzzzz00000000DkMDzzzzzzzzxzzzzzs00000001yP3zzzzzzzzzzzzzzs00000000Dzzzzzzzzzzzzzzzzz000000005zzzzzzzzzzzzzzzzzs00000000jzzzzzzzzzzzzzzzzz000000001zzzzzzzzzzzzzzzzzs00000s00Lzzzzzzzzzzzzzzzzz00000D006Tzzzzzzzzzzzzzzzzk0000zzU0w000000000s00zzzzy001zzzzzzzzzzzs000Dzzzzzzk000TzzzzzzzzzzzU001zzzzzzs0007zzzzzzzzzzzy000Dzzzzzz0003zzzzzzzzzzzzs001zzzzzzs000zzzzzzzzzzzzzU007zzzzzz0007zzzzzzzzzzzzz000Tzzzzzs001zzzzzzzzzzzzzw003zzzzzz000zzzzzzzzzVzzzzk60zzzzzzs00DzzzzzzzzyDzzzzVw7zzzzzz001zzzzzzzzzzzzzzzzvzzzzzzs00Dzzzzzzzzzrzzzzzzzzzzzzz001zzzzzzzzzsTzzzzzzzqzzzzs00Dzzzzzzzzy1zzzzzzzSzzzzz001zzzzzzzzm3Dzzzzzzlrzzzzs00Dzzzzzzzz2Nzzzzzzyipjzzz001zzzzzzzjsnDzzzzzzUqczzzs00Dzzzzzzxy31zzzzzzxqqTzzz001zzzzzzzjnMTzzzzzzimrzzzs00Dzzzzzzxzzzzzzzzzzzzzzzz000zzzzzzzjzzzzzzzzzzzzzzzs007zzzzzzxzzzzzzzzzzzzzzzz000zzzzzzzzzzzzzzzzzzzzzzzw007zzzzzzyzzzzzzzzzzzzzzzzU00zzzzzzzvzzzzzzzzzzzzzzzw007zzzzzzzU000000000007zzz000zzzzzzzzzzzzzzzs01zzU"
    )
find(text,&coordx:=0,&coordy:=0){ 
    if FindText(&foundx:=0, &foundy:=0, 335,45,1135,645, 0, 0, text){
        coordx:=foundx
        coordy:=foundy
        return True
    }
    else{
        return False
    }
}

clickl(x,y,times:=1){
    loop times{
        MouseMove x, y, 2
        Sleep 100
        Click "L"
        sleep 100
    }
}

clickr(x,y,times:=1){
    loop times{
        MouseMove x, y, 2
        Sleep 100
        Click "R"
        sleep 500
    }
}

Presskey(key, duration:=100){
    if duration=100 || duration<100{
        Send '{Blind}{' key '}'
        Sleep duration
        return
    }
    else if (duration>100){ 
        Send "{" key " down}"
        Sleep duration
        Send "{" key " up}"
        Sleep 100
    return
    }
}

ClickXButton(){
    clickl(629,246)
}


VoteStart() {
    time:=0
    while true {
        
        if find(Start,&x,&y) {
            clickl(x,y,2)
            if !find(Start,&x,&y) {
                break
            }
            Continue
        }
        else if  find(failed) || find(replay){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
        else if time>=60000{
            restartmatch(0)
        }
        Sleep 700
        time:= time + A_TickCount 
        
    }

}

; --- Retry function ---
retry() {
    while true {
        if find(replay,&x,&y) {
            clickl(x,y)
            if !find(replay,&x,&y){
                break
            }
            Continue
        }
        else if  find(failed) || find(victory){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
        sleep 500
    }

}
LookDown(){
    Presskey('i',2500)
    MouseGetPos &x,&y 
    MouseMove x,y+100,5
    PressKey('o',2500)
}

restartmatch(mode:=0){
    sleep 500
    if mode=1{
        VoteStart()
        sleep 5500
    }
    sleep 1000
    clickl(352,622)
    sleep(500)
    clickl(1032,305)
    sleep(500)
    clickl(675,379)
    sleep(2000)
    clickl(738,373)

    sleep 1000
}

trackedobjectives(){
    if find(text,&x,&y){
        clickl(x+139,y)
    }
}

BossEvents(){
    clickl(420,322) ;click areas
    sleep 500
    if find(boss,&x,&y){
        clickl(x,y)
    }
    sleep 2500
    Presskey("w",1500)
    Presskey("E")
    clickl(400,320) ;changes mode from normal to nightmare
    clickl(530,430) ;clicks create
    clickl(400,500) ;clicks start
}

autoplayesc(){
    restartmatch()    
}
alignatspawn(stage){
    restartmatch()
    while True{
        if find(Stages[stage]){
            Break
        }
        tpToSpawn()
        sleep(1000)
    }
}

winternodisconnect(){
    global disconnected
    while True{
        if find(rewards) || find(dailyrewards){
            sleep(1000)
            clickl(970,126) ;closes the tab list
            sleep(500)
            if find(rewards){
                clickl(981,201) ;closes inventory
            }
            sleep(500)
            clickl(425,327) ;clicks Areas
            sleep(5000)
            clickl(545,425) ;Clicks story mode
            sleep(500)
            Send("{Blind}v")
            sleep(500)
            Presskey("s",3500)
            sleep(500)
            Send("{Blind}v")
            sleep(500)
            presskey("a",1000)
            sleep(500)
            send("{Blind}e")
            sleep(500)
            clickl(507,482) ;clicks create in event
            sleep(1000)
            clickl(685,345) ;clicks event mode
            sleep(1000)
            if find(startmap,&x,&y){
                clickl(x,y)
            }
        }
        else if find(reconnect,&x,&y){
            sleep(500)
            clickl(x,y,2)
        }
        else if FindText(&X, &Y, 898, 250, 1130, 286, 0.2,0.2, winter){
            clickl(970,126) ;closes the tab list
            Break
        }
    }
    sleep(500)
    if find(comment,&x,&y){
        clickl(x,y)
    }
    sleep(500)
    LookDown()
    sleep(500)
    sleep(500)
    restartmatch(1)
    sleep(500)
    clickl(542,367,2)
    tpToSpawn()
}

arcanespells(unit){
    Obj:=FileOpen("Slots\" . unit, "r")
    AinzLocation:=StrSplit(Obj.Read(),"`n")
    Obj.Close()

    coord:=StrSplit(Trim(AinzLocation[1],"`r`n"),",")
    unitcoordx := integer(coord[1])
    unitcoordy := integer(coord[2])
    clickl(unitcoordx,unitcoordy)
    sleep 500
    clickl(650,365) ;clicks arcane spells
    sleep 100
    clickl(570,371) ;clicks elementless
    sleep 100
    clickl(756,296) ;clicks undead control
    sleep 100
    clickl(557,261) ;clicks back button
    sleep 100
    clickl(625,305) ;clicks curse
    sleep 100
    clickl(756,296) ;clicks create greater undead
    sleep 100
    clickl(756,342) ;clicks supreme summoning
    sleep 100
    clickl(890,444)
    sleep 100
    clickl(735,386) ;clicks cancel button
    
}

burnunit(){
    sleep(500)
    clickl(735,475)
    clickl(600,587)
    clickl(655,587)
    clickl(710,587)
    clickl(765,587)
    clickl(820,587)
    clickl(875,587)
    clickl(735,475)
}

bounties(){
    while True{
            if find(rewards) || find(dailyrewards){
                sleep(1000)
                send("{Blind}{Tab}") ;closes the tab list
                sleep(500)
                if find(rewards){
                    clickl(981,201) ;closes inventory
                }
                sleep(500)
                clickl(425,327) ;clicks Areas
                sleep(5000)
                clickl(545,425) ;Clicks story mode
                sleep(500)
                Send("{Blind}v")
                sleep(500)
                Presskey("w",2000)
                sleep(500)
                Send("{Blind}v")
                sleep(500)
                Presskey("e")
                sleep(500)
                clickl(731,419) ;clicks skip quest story
                sleep(500)
                Presskey("e")
                sleep(1000)
                clickl(1074,208) ;clicks play
                sleep(500)
                clickl(790,490) ;clicks start
                sleep(500)
                clickl(737,377)
                sleep(500)
                if find(startmap,&x,&y){
                    clickl(x,y)
                }
            }
            if FindText(&X, &Y, 665, 210, 808, 274, 0.1, 0.1, LegendModifier){
                clickl(x,y)
                sleep(2000)
            }
            else if find(start,&x,&y){
                    clickl(x,y,2)
                    sleep(500)
                    clickl(1061,457)
                    sleep(3000)
                    restartmatch()
                    sleep(2000)
                    
                    Break
            }
            clickl(1122,633)
            sleep(2000)
    }
    n:=0
    while True{
        if find(victory) || find(failed){
            clickl(554,486,2)
            sleep(500)
            clickl(790,357)
            sleep(500)
            clickl(857,278)
        }
        else if FindText(&X, &Y, 665, 210, 808, 274, 0.1, 0.1, LegendModifier){
            clickl(x,y)
            sleep(2000)
        }
        else if find(start,&x,&y){
            burnunit()
            clickl(x,y)
        }
        sleep(2000)
    }
}

priority(unit,key,n){
    ClickXButton()
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    clickl(coordx,coordy)
    sleep(100)
    loop n{
        send("{Blind}r")
        sleep(250)
    }    
    ClickXButton()
}

cidattack(unit,key){
    filename:=StrReplace(A_ScriptName,".ahk","")
    Obj:=FileOpen(  "Slots\" . filename . "\" . unit, "r")
    Slots:=StrSplit(Obj.Read(),"`n")
    Obj.Close()
    coord:=StrSplit(Trim(Slots[key],"`r`n"),",")
    coordx := integer(coord[1])
    coordy := integer(coord[2])
    order:=[]
    while order.Length<4{
        sleep(250)
        if FindText(&X, &Y, 598, 420, 864, 535, 0, 0, one){
            order.Push(1)
            AppendLog("1")
            if order.Length=4{
                Break
            }
            sleep(4000)
        }
        else if FindText(&X, &Y, 598, 420, 864, 535, 0, 0, two){
            order.Push(2)
            AppendLog("2")
            if order.Length=4{
                Break
            }
            sleep(4000)
        }
        else if FindText(&X, &Y, 598, 420, 864, 535, 0, 0, three){
            order.Push(3)
            AppendLog("3")
            if order.Length=4{
                Break
            }
            sleep(4000)
        }
        else if FindText(&X, &Y, 598, 420, 864, 535, 0, 0, four){
            order.Push(4)
            AppendLog("4")
            if order.Length=4{
                Break
            }
            sleep(4000)
        }
        if find(victory) || find(failed){
            Break
        }  
    }
    clickl(coordx,coordy)
    tpToSpawn()
    for i in order
        
        if i=1{
            clickl(482,261) ;click spectate unit
            clickl(660,557) ;Click left arrow mark
            sleep(300)
            clickl(735,622)
            Send("{S down}{d down}")
            sleep(1800)
            Send("{d up}")
            sleep(400)
            Send("{s up}")
            sleep(100)
            Presskey("e")
            tpToSpawn()
            sleep(750)
        }
        else if i=2{
            clickl(482,261) ;click spectate unit
            clickl(660,557) ;Click left arrow mark
            sleep(300)
            clickl(735,622)           
            Send("{S down}{a down}")
            sleep(1800)
            Send("{a up}")
            sleep(600)
            Send("{s up}")
            sleep(100)
            Presskey("e")
            tpToSpawn()
            sleep(750)
        }
        else if i=3{
            clickl(482,261) ;click spectate unit
            clickl(660,557) ;Click left arrow mark
            sleep(300)
            clickl(735,622)            
            Send("{w down}{a down}")
            sleep(1650)
            Send("{w up}{a up}")
            sleep(100)
            Presskey("e")
            tpToSpawn()
            sleep(750)
        }
        else if i=4{
            clickl(482,261) ;click spectate unit
            clickl(660,557) ;Click left arrow mark
            sleep(300)
            clickl(735,622)           
            Send("{w down}{d down}")
            sleep(1550)
            Send("{w up}{d up}")
            sleep(100)
            sleep(100)
            Presskey("e")
            tpToSpawn()
            sleep(750)
        }
    clickl(482,261) ;click spectate unit
    clickl(660,557) ;Click left arrow mark
    sleep(300)
    clickl(735,622)
    ClickXButton()
    Presskey("o",1000)
    Presskey("s",350)
}