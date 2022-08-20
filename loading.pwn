#include <YSI_Coding\y_hooks>

#define Warning:%0(%1,%2) \
	forward WNG_%0(%1,%2);public WNG_%0(%1,%2)

enum WNGInfo
{
	w_callback[32],
	w_timer
}
new Warning_Info[MAX_PLAYERS][WNGInfo], PlayerText:warningTDE[MAX_PLAYERS][4], Float:loadingbar[MAX_PLAYERS] = 0.0;

#define show_warning(%0, %1, warning(%0, #%1,
stock swarning(playerid, const callback[], const title[], const params[], timer = 80)
{
    LoadTDE_Warning(playerid);
    loadingbar[playerid] = 0.0;
    format(Warning_Info[playerid][w_callback], 32, "WNG_%s", callback);
    PlayerTextDrawSetString(playerid, warningTDE[playerid][2], title);
    PlayerTextDrawSetString(playerid, warningTDE[playerid][3], params);
    for(new i = 0; i < 4; i++)
        PlayerTextDrawShow(playerid, warningTDE[playerid][i]);
    SetTimerEx("swarning_update", (Warning_Info[playerid][w_timer]=timer), false, "i", playerid);
    return 1;
}

stock LoadTDE_Warning(playerid)
{
    warningTDE[playerid][0] = CreatePlayerTextDraw(playerid, 230.000000, 320.000000, "_");
    PlayerTextDrawFont(playerid, warningTDE[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid, warningTDE[playerid][0], 0.649999, 4.800001);
    PlayerTextDrawTextSize(playerid, warningTDE[playerid][0], 412.500000, 77.000000);
    PlayerTextDrawSetOutline(playerid, warningTDE[playerid][0], 3);
    PlayerTextDrawSetShadow(playerid, warningTDE[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, warningTDE[playerid][0], 1);
    PlayerTextDrawColor(playerid, warningTDE[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, warningTDE[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, warningTDE[playerid][0], 269488383);
    PlayerTextDrawUseBox(playerid, warningTDE[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, warningTDE[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, warningTDE[playerid][0], 0);

    warningTDE[playerid][1] = CreatePlayerTextDraw(playerid, 230.000000, 364.000000, "_");
    PlayerTextDrawFont(playerid, warningTDE[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, warningTDE[playerid][1], 0.649999, -0.050000);
    PlayerTextDrawTextSize(playerid, warningTDE[playerid][1], 412.500000, 75.500000);
    PlayerTextDrawSetOutline(playerid, warningTDE[playerid][1], 3);
    PlayerTextDrawSetShadow(playerid, warningTDE[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, warningTDE[playerid][1], 1);
    PlayerTextDrawColor(playerid, warningTDE[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, warningTDE[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, warningTDE[playerid][1], 1097458175);
    PlayerTextDrawUseBox(playerid, warningTDE[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, warningTDE[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, warningTDE[playerid][1], 0);

    warningTDE[playerid][2] = CreatePlayerTextDraw(playerid, 243.000000, 324.000000, "AVISO:");
    PlayerTextDrawFont(playerid, warningTDE[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, warningTDE[playerid][2], 0.229166, 1.050000);
    PlayerTextDrawTextSize(playerid, warningTDE[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, warningTDE[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, warningTDE[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, warningTDE[playerid][2], 1);
    PlayerTextDrawColor(playerid, warningTDE[playerid][2], 1097458175);
    PlayerTextDrawBackgroundColor(playerid, warningTDE[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, warningTDE[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, warningTDE[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, warningTDE[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, warningTDE[playerid][2], 0);

    warningTDE[playerid][3] = CreatePlayerTextDraw(playerid, 238.000000, 333.000000, "Quais quer duvida, basta digitar '/noob (sua pergunta)'.");
    PlayerTextDrawFont(playerid, warningTDE[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, warningTDE[playerid][3], 0.150000, 0.750000);
    PlayerTextDrawTextSize(playerid, warningTDE[playerid][3], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, warningTDE[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, warningTDE[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, warningTDE[playerid][3], 1);
    PlayerTextDrawColor(playerid, warningTDE[playerid][3], -160);
    PlayerTextDrawBackgroundColor(playerid, warningTDE[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, warningTDE[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, warningTDE[playerid][3], 0);
    PlayerTextDrawSetProportional(playerid, warningTDE[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, warningTDE[playerid][3], 0);
    return 1;
}

forward swarning_update(playerid);
public swarning_update(playerid)
{
    if(loadingbar[playerid] > 104)
    {
        for(new i = 0; i < 4; i++)
            PlayerTextDrawDestroy(playerid, warningTDE[playerid][i]);
        return false;
    }
    SetTimerEx("swarning_update", Warning_Info[playerid][w_timer], false, "i", playerid);
    PlayerTextDrawTextSize(playerid, warningTDE[playerid][1], 412.500000 - (loadingbar[playerid]*1.82), 1.0);
    PlayerTextDrawShow(playerid, warningTDE[playerid][1]);
    loadingbar[playerid] += 0.8;
    return CallLocalFunction(Warning_Info[playerid][w_callback], "if", playerid, loadingbar[playerid]);
}
