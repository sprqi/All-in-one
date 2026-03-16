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

restartmatch(1)
VoteStart()
LookDown()
restartmatch()
VoteStart()
alignatspawn("Namek")
burnunit()
