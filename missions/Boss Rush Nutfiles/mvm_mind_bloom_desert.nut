::MVMMindBloom_Desert <-
{
	function DesertArenaInit()
	{
		if(FindByName(null, "spawnbot_boss_desert_teleporter_relay"))
		{
			return
		}
		local DesertBossTeleporter = SpawnEntityFromTable("logic_relay",
		{
			targetname = "spawnbot_boss_desert_teleporter_relay"
			spawnflags = 2

			"OnTrigger" : "spawnbot_boss_teleporter,AddOutput,target spawnbot_boss_desert,0,-1"
			"OnTrigger" : "spawnbot_boss_teleporter,Enable,,0.05,-1"
			"OnTrigger" : "spawnbot_boss_teleporter,Disable,,0.1,-1"
		})

		if(FindByName(null, "arena_desert_boss_spawn_relay"))
		{
			return
		}
		local DesertBossSpawnEffect = SpawnEntityFromTable("logic_relay",
		{
			targetname = "arena_desert_boss_spawn_relay"

			"OnTrigger" : "arena_desert_boss_spawn_tesla,TurnOn,,0,-1"
			"OnTrigger" : "arena_desert_boss_spawn_particle,Start,,0.5,-1"
			"OnTrigger" : "arena_desert_boss_spawn_particle,Stop,,5,-1"
			"OnTrigger" : "arena_desert_boss_spawn_tesla,TurnOff,,5,-1"
		})
	}
}

__CollectGameEventCallbacks(MVMMindBloom_Desert)