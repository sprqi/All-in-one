#Requires AutoHotkey v2.0
#Include <FindText>
#include otherfuncs.ahk
#include placeunit.ahk
#include variables.ahk

ImageOfRightPlace:="|<GreenScreen>*43$154.000Q007zzzwADzzzzzzzzUzzzw000600zzzzzsTzzzzzzzzUzzzk0003k3zzzzzh7zzzzzzzz0zzz60001tzzzzzzz3zzzzzzzz0zzw7U0007zzzzzzy7zzzzzzzzVzzk1k000zzzzzzzs1zzzzzzzzlzz00M001zzzzzzztVzzzzzzzzVzw00000Dzzzzzzzyxzzzzzzzzlzk00001zzzzzzzzzszzzzzzzzlz000007zzzzzzzzzwTzzzzzzzlw00000zzzzz3zzzzsTzzzzzzzlk00007zzzzs1zzzzyTzzzzzzzl00000TzzzzU0zzzzyjzzzzzzzs00001zzzzw00Tzzzz7zzzzzzzk00000zzzzk00Dzzzzrzzzzzzz000001zzzz0007zzzzXzzzzzzzs00001zzzw0C03zzzzvzzzzzzzw00001zzzk0z01zzzzjzzzzzzzw00001zzz03XU0zzzzzzzzzzzzz00000zzw0C1k0TzzzwzzzzzzzzU0000zzk0k0s0DzzzyTzzzzzzzs0000zz0700Q07zzzsTzzzzzzzy0000Dw0Q00C03zzzyzzzzzzzzzU0003k1k00301zzzzzzzzzzzzzy000107000000zzzzTzzzzzzzzzU0000s0000k0Tzzzbzzzzzzzzzs0003U0000M0Dzzzzzzzzzzzzzz000C00000407zzzzzzzzzzzzzzw00s00000203zzzzzzzzzzzzzzz03U00000101zzzzzzzzzzzzzzy0Q0000000U0zzzzzzzzzzzzzzs1k000000000Tzzzzzzzzzzzzz070000000000Dzzzzzzzzzzzzw0Q00000000007zzzzzzzzzzzzU1k00000000007zzzzzzzzzzzy0C000000000007zzzzzzzzzzzk0s000000000007zzzzzzzzzzz03U00000000000Dzzzzzzzzzzw0C0000000000007zzzzzzzzzzU0k0000000000003zzzzzzzzzy0700000000000001zzzzzzzzzk0Q00000000000000zzzzzzzzz01k00000000000003zzzzzzzzw0700000000000000Dzzzzzzzzk0s00000000000000Tzzzzzzzz03U000000000000003zzzzzzzw0C0000000000000003bzzzzzzk0s00000000000000040Tzzzzz03U000000000000006000zzzzw0Q00000000000000Cs001Xzzzk1k00000000000000zy0000Tzz07000000000000003zzk000nzw0Q00000000000000DzzzA036Tk1k00000000000000zzzzz0wkcUC000000000000003zzzzzzq6U0s00000000000000DzzzzzzwsM3U00000000000000zzzzzzzzz0C000000000000003zzzzzzzzs0k00000000000000DzzzzzzzzU7000000000000000zzzzzzzzw0Q000000000000003zzzzzzzzk1k00000000000000Dzzzzzzzz07000000000000000zzzzzzzzs0M000000000000003zzzzzzzzU3U00000000000000Dzzzzzzzw0C000000000000000zzzzzzzzk0s000000000000003zzzzzzzy03U00000000000000Dzzzzzzzs0Q000000000000000zzzzzzzz01k000000000000003zzzzzzzw07000000000000000Dzzzzzzzk0Q000000000000000zzzzzzzz01k000000000000003zzzzzzzw0C000000000000000Dzzzzzzzk0s000000000000000zzzzzzzz03U000000000000003zzzzzzzw0C000000000000000Dzzzzzzzk0s000000000000000zzzzzzzz070000000000000003zzzzzzzw0Q000000000000000Dzzzzzzzk1k0000000000000003zzzzzzz070000000000000000000Tzzzw0M0000000000000000000004Dk3U000000000000000000000000C0000000000000003zzk000000s000000000000000Dzzzzzs003U000000000000000zzzzzzzy0Q0000000000000003zzzzzzzs1k000000000000000Dzzzzzzz070000000000000000zzzzzzzw0Q0000000000000003zzzzzzzU1k000000000000000Dzzzzzzy0C0000000000000000zzzzzzzs0s0000000000000003zzzzzzz03U000000000000000Dzzzzzzw0C0000000000000000zzzzzzzU0s0000000000000003zzzzzzy070000000000000000Dzzzzzzk0Q0000000000000000zzzzzzz01k0000000000000003zzzzzzw070000000000000000Dzzzzzzk0Q0000000000000000zzzzzzz03U0000000000000003zzzzzzw0C0000000000000000Dzzzzzzk0s0000000000000000zzzzzzz03U0000000000000003zzzzzzw0Q0000000000000000Dzzzzzzk1k0000000000000000zzzzzzz0700000000000000003zzzzzzw0Q0000000000000000Dzzzzzzk1k0000000000000000zzzzzzz0C00000000000000003zzzzzzw0s0000000000000000Dzzzzzzk3U0000000000000000zzzzvwn0C00000000000000003zz5s4100s00000000000000000482000070000000000000000000000000Q0000000000000000008000zk1k000000000000000001Uzzzz0700000000000000000Tzzzzzw0Q00000000000000003zzzzzzU3U0000000000000000Dzzzzzy0C00000000000000000zzzzzzk0s00000000000000003zzzzzz03U0000000000000000Dzzzzzs0C00000000000000000zzzzzzU1k00000000000000003zzzzzy0700000000000000000Dzzzzzk0Q00000000000000000zzzzzz01k00000000000000003zzzzzs0C00000000000000000DzzzzzU0s00000000000000000zzzzzy03U00000000000000003zzzzzs0C00000000000000000DzzzzzU0s00000000000000000zzzzzy07000000000000000003zzzzzs0Q00000000000000000DzzzzzU1k00000000000000000zzzzzy07000000000000000003zzzzzs0Q00000000000000000DzzzzzU3U00000000000000000zzzzzy0C000000000000000003zzzzzs0s00000000000000000DzzzzzU3U00000000000000000zzzzzy0C000000000000000003zzzzzk1k00000000000000000Tzzzy007000000000000000001zzzk000Q000000000000000007zz001k1k00000000000000000Ts001z0D000000000000000001U007zs0s00000000000000000400TzzU3U00000000000000000k1zzzy0C0000000000000000037zzzzk0s00000000000000000Dzzzzz07000000000000000000zzzzzs0Q000000000000000003zzzzzU1k00000000000000000Dzzzzw07000000000000000001zzzzzk0Q000000000000000006zzzzy03U00000000000000000Pzzzzs0C000000000000000001jzzzzU0s000000000000000006zzzzw03U00000000000000000Pzzzzk0A000000000000000003Dzzzz01k00000000000000000Azzzzw07000000000000000000rzzzzk0Q000000000000000003Tzzzz01k00000000000000000Bzzzzw0C000000000000000003q"

Condition:="|<AdditiveCardsCondition>*125$84.zzzzTrzzzzzzzzwznsBnzzz3zzwzszntNrzzw1zzwzsTXlsyznwPzzsnkQ2000M1sz010VmA2082M0sz0105U8kM9W00sy86AVU0UE8X21wO878k7Y208371w10700Da31QLbVz3UjUVU"
Modifiers:=Map(
    "Restize","|<Restize>*52$62.zzzzzzlzzzk3zzzswTzzw0TzzyD7zzz03zzzXzzzzlkwTXkCw1wQSA1U8160A1720820FU2000V2DkAM1V00EkUSD7ksk040Q3XlsQ0FlXzkswQDXwQ8FWC3608F7X0M3klU30Hts71yAs0s6",
    "Mobilize","|<Mobilize>*53$73.zzzzszlXXzzzXz7zwTsllzzzkz3zyDwMszzzsT1zz7zwTzzzw70yDXziDS0yC1UQ1k7X760A100A0M1lXX040W160A0MllU6411X76CAMsy760llXX76AQS704TsllV36CC7lyDwM0k1X360817yC0s1lUX060bz7UwltsnU3UM",
    "Speech","|<Speech>*51$59.tzzzzzzzlz0TzzzzzzXw0zzzzzzz7s1zzzzzzyDlrrzlz7wQPVz0S0s3U810S0M0U20E30Q0EV241U3UMs30A0z77slk080VyC1lV2DszXAQ030A0k308s0C0Q1k70FlUwHw3kD3XXzszzzzzzzzzlzzzzzzzzzXzzzzzzzzzDzzzzzzzU"
)
ChooseModifer:="|<SomeShape>*115$15.z7zkTw1z07k0Q010000000A03k0z0700801U"

ChooseStartModifier(){
    sleep 500
    clickl(800,530,2)
    sleep 1000
    clickl(731,328,2)
    sleep 1000
}

tpToSpawn(){
    sleep(100)
    clickl(352,622)  ;settings button
    sleep 250
    clickl(1032,338) ;click tp to spawn
    clickl(1083,165) ;click x button
    sleep(200)
}

wave120(){
    global disconnected
    while True{
        if FindText(&X, &Y, 527, 61, 668, 84, 0,0, wv120){
            restartmatch()
            Break
        }
        if  find(failed) || find(victory){
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
            Break
        }
        else if disconnected{
            Break
        }
        sleep(5000)
        Continue
    }
}

placedummy(){
    while true{
        tpToSpawn()
        clickl(800,140) ;click vote start
        sleep 1000
        Presskey('1',100)
        clickl(769,323)
        sleep 1000
        if find(upg0){
            clickl(482,261) ;click spectate unit
            clickl(660,557) ;Click left arrow mark
            sleep 500
            clickl(735,622) ;Click leave buttton
            ClickXButton()
            Presskey('o',1000)
	        sleep 1000
            Presskey('v',100)
            Break
            }
        restartmatch()
        }
        Else{
            Presskey('6',100)            
        }
        sleep 1000
}

ChooseModifier(Type){
    clickl(1122,630)
    while true{
        if find(Modifiers[Type],&x,&y){
            clickl(x,y,2)
            clickl(1122,630,3)
            sleep 1000
            break
        }
        else if  find(failed) || find(victory){
            clickl(700,483)
            sleep 100
            clickl(700,483)
            Reload
        }
        sleep 2000
    }
}

