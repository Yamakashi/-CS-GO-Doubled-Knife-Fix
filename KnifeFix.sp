/* [ Includes ] */
#include <sourcemod>
#include <sdktools>
#include <smlib>

/* [ Compiler Options ] */
#pragma newdecls required
#pragma semicolon 1

/* [ Plugin Author and Information ] */
public Plugin myinfo =
{
	name = "[CS:GO] Knife Fix",
	author = "Yamakashi",
	description = "Plugin zabiera nóż na koniec rundy, aby uniknąć powielenia go.",
	version = "1.0",
	url = "https://steamcommunity.com/id/yamakashisteam"
};

/* [ Plugin Startup ] */
public void OnPluginStart()
{
	/* [ Hooks ] */
	HookEvent("round_end", Event_RoundEnd);
}

/* [ Events ] */
public Action Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
	for(int i = 1; i <= MaxClients; i++)
		if(IsValidClient(i))
		{
			Client_RemoveWeapon(i, "weapon_knife", true, false);
			Client_RemoveWeapon(i, "weapon_knife_karambit", true, false);
			Client_RemoveWeapon(i, "weapon_knife_m9_bayonet", true, false);
			Client_RemoveWeapon(i, "weapon_bayonet", true, false);
			Client_RemoveWeapon(i, "weapon_knife_butterfly", true, false);
			Client_RemoveWeapon(i, "weapon_knife_push", true, false);
			Client_RemoveWeapon(i, "weapon_knife_ursus", true, false);
			Client_RemoveWeapon(i, "weapon_knife_stiletto", true, false);
			Client_RemoveWeapon(i, "weapon_knife_gypsy_jackknife", true, false);
			Client_RemoveWeapon(i, "weapon_knife_widowmaker", true, false);
			Client_RemoveWeapon(i, "weapon_knife_gut", true, false);
			Client_RemoveWeapon(i, "weapon_knife_flip", true, false);
			Client_RemoveWeapon(i, "weapon_knife_falchion", true, false);
			Client_RemoveWeapon(i, "weapon_knife_survival_bowie", true, false);
			Client_RemoveWeapon(i, "weapon_knife_tactical", true, false);
		}
}		

/* [ Helpers ] */
stock bool IsValidClient(int client)
{
	if(client <= 0 ) return false;
	if(client > MaxClients) return false;
	if(!IsClientConnected(client)) return false;
	if(IsFakeClient(client)) return false;
	return IsClientInGame(client);
}