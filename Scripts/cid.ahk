#Requires Autohotkey v2
CoordMode "Mouse", "Screen"
SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
disconnected:=False
global App
#include <FindText>
#include <otherfuncs>
#include <placeunit>
#include <position>
#include <unitlocations>
#include <upgradeunit>

clickl(1122,633)
restartmatch(1)
LookDown()
burnunit()
placedummy()
restartmatch()
burnunit()
Presskey("v")
Presskey("s",350)
VoteStart()
place1("Slot1")
autoupgrade("Slot1",1)
priority("Slot1",1,5)
cidattack("Slot1",1)
cidattack("Slot1",1)
while True{
    sleep(10000)
    if find(victory) || find(failed){
            sleep(1000)
            clickl(700,486,2)
            Reload
        } 
}