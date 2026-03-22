::MVMMindBloom_Desert <-
{
	function Cleanup()
	{
		delete ::MVMMindBloom_Desert
	}
	function OnGameEvent_recalculate_holidays(params)
	{
		Cleanup();
	}

	function OnGameEvent_mvm_wave_complete(params)
	{
		Cleanup();
	}

	function DesertArenaInit()
	{
		//// Player Teleport ////
		if(FindByName(null, "arena_teleport_desert_relay"))
		{
			return
		}
		local DesertArenaTeleportRelay = SpawnEntityFromTable("logic_relay", 
		{
			targetname = "arena_teleport_desert_relay"
			spawnflags = 2

			"OnTrigger#0" : "arena_teleport_desert_case,PickRandom,,0,-1"
			"OnTrigger#1" : "arena_teleporter,Enable,,5,-1"
			"OnTrigger#2" :	"!activator,$PlaySoundtoSelf,weapons/rescue_ranger_teleport_send_01.wav,5,-1"
			"OnTrigger#3" : "!activator,RunScriptCode,ScreenFade(self, 255, 255, 255, 192, 0.5, 0, 2),5,-1"
			"OnTrigger#4" : "arena_teleporter,Disable,,5.1,-1"
		})
		if(FindByName(null, "arena_teleport_desert_case"))
		local DesertArenaTeleportCase = SpawnEntityFromTable("logic_case",
		{
			targetname = "arena_teleport_case_relay"

			"OnCase01#0" : "arena_teleporter,AddOutput,target arena_teleport_target_desert1,0,-1"
			"OnCase02#0" : "arena_teleporter,AddOutput,target arena_teleport_target_desert2,0,-1"
		})

		//// Bot Spawners ////
		if(FindByName(null, "spawnbot_boss_desert_teleporter_relay"))
		{
			return
		}
		local DesertBossTeleporter = SpawnEntityFromTable("logic_relay",
		{
			targetname = "spawnbot_boss_desert_teleporter_relay"
			spawnflags = 2

			"OnTrigger#0" : "spawnbot_boss_teleporter,AddOutput,target spawnbot_boss_desert,0,-1"
			"OnTrigger#1" : "spawnbot_boss_teleporter,Enable,,0.5,-1"
			"OnTrigger#2" : "spawnbot_boss_teleporter,Disable,,0.6,-1"
		})
		if(FindByName(null, "spawnbot_boss_target_desert"))
		{
			return
		}
		local DesertBossTarget = SpawnEntityFromTable("info_teleport_destination",
		{
			targetname = "spawnbot_boss_target_desert"
			origin = Vector(129, 4927, -618)
			angles = QAngle(0, 270, 0)
		})

		if(FindByName(null, "spawnbot_support_desert_teleporter_relay"))
		{
			return
		}
		local DesertSupportTeleporter = SpawnEntityFromTable("logic_relay",
		{
			targetname = "spawnbot_support_desert_teleporter_relay"
			spawnflags = 2

			"OnTrigger#0" : "spawnbot_support_desert_teleporter_case,PickRandom,,0,-1"
			"OnTrigger#1" : "arena_desert_portalbeam,StrikeOnce,,0.5,-1"
			"OnTrigger#2" : "spawnbot_support_teleporter,Enable,,0.5,-1"
			"OnTrigger#3" : "spawnbot_support_teleporter,Disable,,0.6,-1"
		})

		if(FindByName(null, "spawnbot_support_desert_teleporter_case"))
		{
			return
		}
		local DesertSupportTeleporterCase = SpawnEntityFromTable("logic_case",
		{
			targetname = "spawnbot_support_desert_teleporter_case"

			"OnCase01#0" : "arena_desert_portalbeam,AddOutput,LightningEnd spawnbot_target_desert1,0,-1"
			"OnCase01#1" : "spawnbot_support_teleporter,AddOutput,target spawnbot_target_desert1,0,-1"
			"OnCase01#2" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleportedin_blue`, Vector(-448, 5056, -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase01#3" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleported_blue`, Vector(-448, 5056, -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase01#4" : "BigNet,RunScriptCode,EmitSoundEx({sound_name = `mvm/mvm_tele_deliver.wav`, channel = 6, volume = 1, sound_level = 70, origin = Vector(-448, 5056, -784)}),0.5,-1"

			"OnCase02#0" : "arena_desert_portalbeam,AddOutput,LightningEnd spawnbot_target_desert2,0,-1"
			"OnCase02#1" : "spawnbot_support_teleporter,AddOutput,target spawnbot_target_desert2,0,-1"
			"OnCase02#2" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleportedin_blue`, Vector(-449, 4832, -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase02#3" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleported_blue`, Vector(-449, 4832, -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase02#4" : "BigNet,RunScriptCode,EmitSoundEx({sound_name = `mvm/mvm_tele_deliver.wav`, channel = 6, volume = 1, sound_level = 70, origin = Vector(-449, 4832, -816)}),0.5,-1"

			"OnCase03#0" : "arena_desert_portalbeam,AddOutput,LightningEnd spawnbot_target_desert3,0,-1"
			"OnCase03#1" : "spawnbot_support_teleporter,AddOutput,target spawnbot_target_desert3,0,-1"
			"OnCase03#2" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleportedin_blue`, Vector(104, 5504 -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase03#3" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleported_blue`, Vector(104, 5504 -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase03#4" : "BigNet,RunScriptCode,EmitSoundEx({sound_name = `mvm/mvm_tele_deliver.wav`, channel = 6, volume = 1, sound_level = 70, origin = Vector(104, 5504 -816)}),0.5,-1"

			"OnCase04#0" : "arena_desert_portalbeam,AddOutput,LightningEnd spawnbot_target_desert4,0,-1"
			"OnCase04#1" : "spawnbot_support_teleporter,AddOutput,target spawnbot_target_desert4,0,-1"
			"OnCase04#2" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleportedin_blue`, Vector(296, 5504 -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase04#3" : "BigNet,RunScriptCode,DispatchParticleEffect(`teleported_blue`, Vector(296, 5504 -816), QAngle (0, 0, 0)),0.5,-1"
			"OnCase04#4" : "BigNet,RunScriptCode,EmitSoundEx({sound_name = `mvm/mvm_tele_deliver.wav`, channel = 6, volume = 1, sound_level = 70, origin = Vector(296, 5504 -816)}),0.5,-1"
		})

		if(FindByName(null, "spawnbot_target_desert1"))
		{
			return
		}
		local DesertSupportTarget1 = SpawnEntityFromTable("info_target",
		{
			targetname = "spawnbot_target_desert1"
			origin = Vector(-448, 5056, -816)
		})
		if(FindByName(null, "spawnbot_target_desert2"))
		{
			return
		}
		local DesertSupportTarget2 = SpawnEntityFromTable("info_target",
		{
			targetname = "spawnbot_target_desert2"
			origin = Vector(-449, 4832, -816)
		})
		if(FindByName(null, "spawnbot_target_desert3"))
		{
			return
		}
		local DesertSupportTarget3 = SpawnEntityFromTable("info_target",
		{
			targetname = "spawnbot_target_desert3"
			origin = Vector(104, 5504 -816)
		})
		if(FindByName(null, "spawnbot_target_desert3"))
		{
			return
		}
		local DesertSupportTarget4 = SpawnEntityFromTable("info_target",
		{
			targetname = "spawnbot_target_desert4"
			origin = Vector(296, 5504 -816)
		})

		//// The Cosmetics ////

		// Boss Spawn
		if(FindByName(null, "arena_desert_boss_spawn_relay"))
		{
			return
		}
		local DesertBossSpawnEffect = SpawnEntityFromTable("logic_relay",
		{
			targetname = "arena_desert_boss_spawn_relay"

			"OnTrigger#0" : "arena_desert_boss_spawn_tesla,TurnOn,,0,-1"
			"OnTrigger#1" : "BigNet,RunScriptCode,DispatchParticleEffect(`charge_up`, Vector(128, 4928, -616), QAngle (0, 0, 0)),0.5,-1"
			"OnTrigger#2" : "arena_desert_boss_spawn_tesla,TurnOff,,5,-1"
		})
		
		if(FindByName(null, "arena_desert_boss_spawn_tesla"))
		{
			return
		}
		local DesertBossSpawnTesla = SpawnEntityFromTable("point_tesla", 
		{
			targetname = "arena_desert_boss_spawn_tesla"
			origin = Vector(128, 4928, -616)

			texture = "sprites/physbeam.vmt"
			m_SoundName = "common/null.wav"
			m_Color = "255 32 32"
			m_flRadius = 550
			beamcount_min = 3
			beamcount_max = 9
			thick_min = 4
			thick_max = 10
			lifetime_min = 0.15
			lifetime_max = 0.15
			interval_min = 0.05
			interval_max = 0.05
			m_bOn = 0
		})

		// The Vortex
		if(FindByName(null, "arena_desert_vortex_spawn_relay"))
		{
			return
		}
		local DesertVortexSpawnEffect = SpawnEntityFromTable("logic_relay", {
			targetname = "arena_desert_vortex_spawn_relay"

			"OnTrigger#0" : "arena_desert_vortex,Enable,,0,-1"
			"OnTrigger#1" : "arena_desert_vortexarm1,Enable,,0,-1"
			"OnTrigger#2" : "arena_desert_vortexarm2,Enable,,0,-1"
			"OnTrigger#3" : "arena_desert_vortex_portal,Start,,2,-1"
		})
		if(FindByName(null, "arena_desert_vortex"))
		{
			return
		}
		local DesertVortexMain = SpawnEntityFromTable("prop_dynamic",
		{
			targetname = "arena_desert_vortex"
			origin = Vector(144, 4928, 530)
			angles = QAngle(0, 0, 0)
			model = "models/reudina/vortex_reu.mdl"
			modelscale = 1.5
			skin = 0
			solid = 0
			rendermode = 1
			renderamt = 255
			rendercolor = "255 128 128"
			disableshadows = 1
			disablebonefollowers = 1
		})

		if(FindByName(null, "arena_desert_vortexarm1"))
		{
			return
		}
		local DesertVortexArm1 = SpawnEntityFromTable("prop_dynamic",
		{
			targetname = "arena_desert_vortexarm1"
			origin = Vector(134, 4880, 428)
			angles = QAngle(0, 180, 90)
			model = "models/reudina/wof_reu.mdl"
			modelscale = 2
			skin = 0
			solid = 0
			rendermode = 1
			renderamt = 255
			rendercolor = "255 128 128"
			disableshadows = 1
			disablebonefollowers = 1
		})
		
		if(FindByName(null, "arena_desert_vortexarm2"))
		{
			return
		}
		local DesertVortexArm2 = SpawnEntityFromTable("prop_dynamic",
		{
			targetname = "arena_desert_vortexarm2"
			origin = Vector(122, 4976, 428)
			angles = QAngle(0, 0, 90)
			model = "models/reudina/wof_reu.mdl"
			modelscale = 2
			skin = 0
			solid = 0
			rendermode = 1
			renderamt = 255
			rendercolor = "255 128 128"
			disableshadows = 1
			disablebonefollowers = 1
		})

		if(FindByName(null, "arena_desert_vortex_portal"))
		{
			return
		}
		local DesertVortexPortal = SpawnEntityFromTable("info_particle_system",
		{
			targetname = "arena_desert_vortex_portal"
			origin = Vector(128, 4928, 624)
			effect_name = "eb_tp_vortex01"
			start_active = 1
		})

		if(FindByName(null, "arena_desert_portalbeam"))
		{
			return
		}
		local DesertVortexBeam = SpawnEntityFromTable("env_beam",
		{
			targetname = "arena_desert_portalbeam"
			LightningStart = "arena_desert_portalbeam_start"
			LightningEnd = ""
			life = 1
			texture = "effects/beam_generic_2.vmt"
			BoltWidth = 10
			NoiseAmplitude = 2
			TextureScroll = 35
			rendermode = 1
			renderamt = 255
			rendercolor = "255 128 128"
		})

		if(FindByName(null, "arena_desert_portalbeam_start"))
		{
			return
		}
		local DesertVortexBeamStart = SpawnEntityFromTable("info_target",
		{
			targetname = "arena_desert_portalbeam_start"
			origin = Vector(128, 4928, 624)
		})
	}
}

__CollectGameEventCallbacks(MVMMindBloom_Desert)