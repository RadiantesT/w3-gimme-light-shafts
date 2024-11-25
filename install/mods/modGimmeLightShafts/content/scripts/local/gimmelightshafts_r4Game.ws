@addField(CR4Game)
private var gls_reload_flag : bool;
@addField(CR4Game)
private var gls_loadworld_params : GLS_Loadworld_Params;

@addMethod(CR4Game)
public function get_gls_reload_flag() : bool 
{
	return this.gls_reload_flag;
}

@addMethod(CR4Game)
public function disable_gls_reload_flag() 
{
	this.gls_reload_flag = false;
}

@addMethod(CR4Game)
public function get_gls_loadworld_params() : GLS_Loadworld_Params 
{
	return this.gls_loadworld_params;
}

@addMethod(CR4Game)
public function set_gls_loadworld_params(gls_loadworld_params : GLS_Loadworld_Params)
{
	this.gls_loadworld_params = gls_loadworld_params;
}

@addMethod(CR4Game)
public function gls_reload() 
{
	//set gls_reload_flag so that thePlayer.OnSpawned only reloads gls_loadworld_params when flag set
	this.gls_reload_flag = true;
	this.ScheduleWorldChangeToPosition(this.gls_loadworld_params.world_path, this.gls_loadworld_params.position, this.gls_loadworld_params.rotation);
}