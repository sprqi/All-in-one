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
winternodisconnect()
sleep(1000)
send("{blind}v")
tpToSpawn()
sleep(1000)
rabbithero(2)
VoteStart()

place2("Slot1")
speedwagon(3)
place3("Slot2")
autoupgrade("Slot2",1)
autoupgrade("Slot2",2)
autoupgrade("Slot2",3)

tpToSpawn()
rabbithero(1)
place1("Slot1")
takaroda(1)
place1("Slot3")
autoupgrade("Slot3",1)

tpToSpawn()
sellunit("Slot1",2)
rabbithero(1)
place1("Slot1")
nami(1)
sleep(2000)
place1("Slot3")
autoupgrade("Slot3",2)

tpToSpawn()
sunraku(3)
sleep(3000)
place3("Slot4")
modifier()
clickl(1000,205) ;clicks x button
tpToSpawn()
autoupgrade("Slot4",1)

aokiji(4)
place4("Slot5")
sleep(2000)
mage(3)
place3("Slot6")
sleep(10000)
activateportal()
autoupgrade("Slot6",1)
autoupgrade("Slot6",3)
sleep(50000)
mageability()
ClickXButton()
autoupgrade("Slot4",2)
autoupgrade("Slot4",3)

monarch("Slot4",1)
monarch("Slot4",2)
monarch("Slot4",3)
autoupgrade("Slot1",1)
autoupgrade("Slot1",4)
autoupgrade("Slot1",3)
monarch("Slot6",1)
monarch("Slot6",3)
monarch("Slot1",1)
monarch("Slot1",4)
monarch("Slot1",3)
monarch("Slot5",1)
monarch("Slot5",2)
monarch("Slot5",3)
monarch("Slot5",4)
autoupgrade("Slot5",1)
autoupgrade("Slot5",2)
autoupgrade("Slot5",3)
autoupgrade("Slot5",4)

benimaru(3)
place3("Slot7")
monarch("Slot7",1)
monarch("Slot7",2)
monarch("Slot7",3)
autoupgrade("Slot7",1)
autoupgrade("Slot7",2)
autoupgrade("Slot7",3)
queen(3)
place3("Slot8")
monarch("Slot8",1)
monarch("Slot8",2)
monarch("Slot8",3)
autoupgrade("Slot8",1)
autoupgrade("Slot8",2)
autoupgrade("Slot8",3)
clickl(1122,633)
wave120()

Reload