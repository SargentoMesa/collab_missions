MindBloomRNG.AddRNGArena("wave_init_arena_industrial_relay", "Wave8_IndustrialGauntlet1");
MindBloomRNG.AddRNGArena("wave_init_arena_industrial_relay", "Wave8_IndustrialGauntlet2");
MindBloomRNG.AddRNGArena("wave_init_arena_rancher_relay", "Wave8_RancherGauntlet");
MindBloomRNG.InitRNGArena();

AlternateWaves.bTrackIcons = false;
AlternateWaves.ClearWaveIcons();

switch (MindBloomRNG.GlobalIndex)
{
	case 0:
	{
		AlternateWaves.AddWaveIcons([
			["soldier_bison_prismatic", 1, MVM_CLASS_FLAG_MINIBOSS],
			["pyro_giant", 1, MVM_CLASS_FLAG_MINIBOSS],
			["soldier_hellmet_lite", 1, MVM_CLASS_FLAG_MINIBOSS],
			["pyro", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["scout_sunstick_swordstone", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT]
		])
		break;
	}

	case 1:
	{
		AlternateWaves.AddWaveIcons([
			["demo_burst_giant", 1, MVM_CLASS_FLAG_MINIBOSS],
			["pyro_dragon_crown", 1, MVM_CLASS_FLAG_MINIBOSS],
			["demoknight_headtaker_nys", 1, MVM_CLASS_FLAG_MINIBOSS],
			["soldier", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["pyro", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["pyro_jug_axtinguisher", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["demoknight", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["demo_burst", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT]
		])
		break;
	}

	case 2:
	{
		AlternateWaves.AddWaveIcons([
			["heavy_shotgun_explode", 1, MVM_CLASS_FLAG_MINIBOSS],
			["heavy_fists_electro", 1, MVM_CLASS_FLAG_MINIBOSS],
			["soldier_barrage_mangler", 1, MVM_CLASS_FLAG_MINIBOSS],
			["demo_sticky_nuke_giant", 1, MVM_CLASS_FLAG_MINIBOSS],
			["soldier_blackbox", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT],
			["scout_batsaber_nys", 1, MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT | MVM_CLASS_FLAG_ALWAYSCRIT]
		])
		break;
	}
}