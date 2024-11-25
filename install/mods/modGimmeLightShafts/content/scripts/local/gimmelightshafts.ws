struct GLS_Loadworld_Params {
	//teleport params
	var world_path : string;
	var position : Vector;
	var rotation : EulerAngles;
	//environment params
	var weather_condition : name;
	var game_time : GameTime;
}

exec function GLS_gimmelightshafts()
{	
	gls_update_params_and_reload();
}

function gls_update_params_and_reload()
{
	var gls_loadworld_params : GLS_Loadworld_Params;
	
	/*
	//ws syntax test pending
	gls_loadworld_params = {
		.world_path = theGame.GetWorld().GetDepotPath(),
		.position = thePlayer.GetWorldPosition(),
		.rotation = thePlayer.GetWorldRotation(),
		.weather_condition = GetWeatherConditionName(),
		.game_time = theGame.GetGameTime()
	};
	*/
	gls_loadworld_params.world_path = theGame.GetWorld().GetDepotPath();
	gls_loadworld_params.position = thePlayer.GetWorldPosition();
	gls_loadworld_params.rotation = thePlayer.GetWorldRotation();
	gls_loadworld_params.weather_condition = GetWeatherConditionName();
	gls_loadworld_params.game_time = theGame.GetGameTime();
	theGame.set_gls_loadworld_params(gls_loadworld_params);
	theGame.gls_reload();
}

class GLS_Input_Listener {
	event On_gimmelightshafts(action : SInputAction)
	{
		if(IsPressed(action)) {
			gls_update_params_and_reload();
		}
	}
}