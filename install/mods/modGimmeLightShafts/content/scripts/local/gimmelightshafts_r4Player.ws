@addField(CR4Player)
public var gls_input_listener : GLS_Input_Listener;

@wrapMethod(CR4Player) function OnSpawned(spawnData : SEntitySpawnData)
{
	var gls_loadworld_params : GLS_Loadworld_Params;
	
	//init gls_input_listener : GLS_Input_Listener
	if(!gls_input_listener){
		gls_input_listener = new GLS_Input_Listener in this;
		theInput.RegisterListener(gls_input_listener, 'On_gimmelightshafts', 'GimmeLightShafts');
	}
	//altes Wetter und Zeit wiederherstellen
	if(theGame.get_gls_reload_flag()) {
		gls_loadworld_params = theGame.get_gls_loadworld_params();
		RequestWeatherChangeTo(gls_loadworld_params.weather_condition, 1.0f, false );
		theGame.SetGameTime(gls_loadworld_params.game_time, false);
		theGame.disable_gls_reload_flag();
	}
	wrappedMethod(spawnData);
}