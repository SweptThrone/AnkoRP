--[[
	AnkoRP custom shipments.
	This was a special type of hell, let me tell you about it.

	Since CSO has over 400 weapons in it, I had to find some easy way
	to add them all as shipments.
	
	My original plan was to put them in a data file,
	then use that to construct shipments.
	This didn't work, because the client also needs the data file.

	So then I tried net.Sending the table when the player joined,
	but that didn't work either because shit ran out of order.

	So I ended up writing some hellish script to construct
	this whole file.
]]--

DarkRP.createShipment( "M79", {
	model = "models/weapons/tfa_cso/w_m79.mdl",
	entity = "tfa_cso_m79",
	price = 1848000,
	amount = 10,
	separate = true,
	pricesep = 168000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Green Dragon Blade", {
	model = "models/weapons/tfa_cso/w_dragonblade.mdl",
	entity = "tfa_cso_dragonblade",
	price = 93500,
	amount = 10,
	separate = true,
	pricesep = 8500,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Hunter Killer X-15", {
	model = "models/weapons/tfa_cso/w_x-15.mdl",
	entity = "tfa_cso_x-15",
	price = 363000,
	amount = 10,
	separate = true,
	pricesep = 33000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Tomahawk", {
	model = "models/weapons/tfa_cso/w_tomahawk.mdl",
	entity = "tfa_cso_tomahawk",
	price = 9900,
	amount = 10,
	separate = true,
	pricesep = 900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Lightning Rail", {
	model = "models/weapons/tfa_cso/w_lightning_rail.mdl",
	entity = "tfa_cso_lightning_rail",
	price = 2750000,
	amount = 10,
	separate = true,
	pricesep = 250000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "TAR-21", {
	model = "models/weapons/tfa_cso/w_tar_21.mdl",
	entity = "tfa_cso_tar_21",
	price = 35200,
	amount = 10,
	separate = true,
	pricesep = 3200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "FAMAS F1", {
	model = "models/weapons/w_rif_famas.mdl",
	entity = "tfa_cso_famas",
	price = 29700,
	amount = 10,
	separate = true,
	pricesep = 2700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "MAC-10", {
	model = "models/weapons/w_smg_mac10.mdl",
	entity = "tfa_cso_mac10_v2",
	price = 12100,
	amount = 10,
	separate = true,
	pricesep = 1100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M1 Garand", {
	model = "models/weapons/tfa_cso/w_m1garand.mdl",
	entity = "tfa_cso_m1garand",
	price = 20900,
	amount = 10,
	separate = true,
	pricesep = 1900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "PSG-1", {
	model = "models/weapons/tfa_cso/w_psg1.mdl",
	entity = "tfa_cso_psg1",
	price = 55000,
	amount = 10,
	separate = true,
	pricesep = 5000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Storm Giant", {
	model = "models/weapons/tfa_cso/w_storm_giant.mdl",
	entity = "tfa_cso_stormgiant",
	price = 6160000,
	amount = 10,
	separate = true,
	pricesep = 560000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "P228", {
	model = "models/weapons/w_pist_p228.mdl",
	entity = "tfa_cso_p228_v2",
	price = 3300,
	amount = 10,
	separate = true,
	pricesep = 300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "UTS-15", {
	model = "models/weapons/tfa_cso/w_uts15.mdl",
	entity = "tfa_cso_uts15",
	price = 51700,
	amount = 10,
	separate = true,
	pricesep = 4700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "QBZ-95B", {
	model = "models/weapons/tfa_cso/w_qbz95b.mdl",
	entity = "tfa_cso_qbz95b",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "MK3A1", {
	model = "models/weapons/tfa_cso/w_mk3a1.mdl",
	entity = "tfa_cso_mk3a1",
	price = 35200,
	amount = 10,
	separate = true,
	pricesep = 3200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "PKM", {
	model = "models/weapons/tfa_cso/w_pkm.mdl",
	entity = "tfa_cso_pkm",
	price = 60500,
	amount = 10,
	separate = true,
	pricesep = 5500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Kujang", {
	model = "models/weapons/tfa_cso/w_kujang.mdl",
	entity = "tfa_cso_kujang",
	price = 13200,
	amount = 10,
	separate = true,
	pricesep = 1200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "M60E4", {
	model = "models/weapons/tfa_cso/w_m60.mdl",
	entity = "tfa_cso_m60",
	price = 67100,
	amount = 10,
	separate = true,
	pricesep = 6100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Benelli M3", {
	model = "models/weapons/w_shot_m3super90.mdl",
	entity = "tfa_cso_m3",
	price = 29700,
	amount = 10,
	separate = true,
	pricesep = 2700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Winchester M1887", {
	model = "models/weapons/tfa_cso/w_m1887.mdl",
	entity = "tfa_cso_m1887",
	price = 23100,
	amount = 10,
	separate = true,
	pricesep = 2100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "SPAS-12", {
	model = "models/weapons/w_shot_m3super90.mdl",
	entity = "tfa_cso_spas12",
	price = 33000,
	amount = 10,
	separate = true,
	pricesep = 3000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Falcon", {
	model = "models/weapons/tfa_cso/w_falcon.mdl",
	entity = "tfa_cso_falcon",
	price = 99000,
	amount = 10,
	separate = true,
	pricesep = 9000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M16A1", {
	model = "models/weapons/tfa_cso/w_m16a1.mdl",
	entity = "tfa_cso_m16a1",
	price = 33000,
	amount = 10,
	separate = true,
	pricesep = 3000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Remington M24", {
	model = "models/weapons/tfa_cso/w_m24.mdl",
	entity = "tfa_cso_m24",
	price = 34100,
	amount = 10,
	separate = true,
	pricesep = 3100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Serpent Blade", {
	model = "models/weapons/tfa_cso/w_serpent_blade.mdl",
	entity = "tfa_cso_serpent_blade",
	price = 16500,
	amount = 10,
	separate = true,
	pricesep = 1500,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Lightning Dao-1 (A Mode)", {
	model = "models/weapons/tfa_cso/w_cartblue.mdl",
	entity = "tfa_cso_cartblue_a",
	price = 40700,
	amount = 10,
	separate = true,
	pricesep = 3700,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Norinco Type 86S", {
	model = "models/weapons/tfa_cso/w_norinco_86s.mdl",
	entity = "tfa_cso_norinco_86s",
	price = 27500,
	amount = 10,
	separate = true,
	pricesep = 2500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Tornado (No Charge)", {
	model = "models/weapons/tfa_cso/w_tornado.mdl",
	entity = "tfa_cso_tornadoa",
	price = 74800,
	amount = 10,
	separate = true,
	pricesep = 6800,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Wakizashi", {
	model = "models/weapons/tfa_cso/w_katana.mdl",
	entity = "tfa_cso_katana",
	price = 77000,
	amount = 10,
	separate = true,
	pricesep = 7000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Lightning HMG-1", {
	model = "models/weapons/tfa_cso/w_cameragun.mdl",
	entity = "tfa_cso_cameragun",
	price = 792000,
	amount = 10,
	separate = true,
	pricesep = 72000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Holy Sword Divine Crusader", {
	model = "models/weapons/tfa_cso/w_holysword.mdl",
	entity = "tfa_cso_holysword",
	price = 8635000,
	amount = 10,
	separate = true,
	pricesep = 785000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "HK416", {
	model = "models/weapons/tfa_cso/w_hk416.mdl",
	entity = "tfa_cso_hk416",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AK-74U", {
	model = "models/weapons/tfa_cso/w_ak74u.mdl",
	entity = "tfa_cso_ak74u",
	price = 25300,
	amount = 10,
	separate = true,
	pricesep = 2300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "MP40", {
	model = "models/weapons/tfa_cso/w_mp40.mdl",
	entity = "tfa_cso_mp40",
	price = 14300,
	amount = 10,
	separate = true,
	pricesep = 1300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Negev", {
	model = "models/weapons/tfa_cso/w_negev.mdl",
	entity = "tfa_cso_negev",
	price = 57200,
	amount = 10,
	separate = true,
	pricesep = 5200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Sha Wujing Dual Handgun", {
	model = "models/weapons/tfa_cso/w_monkeywpnset2.mdl",
	entity = "tfa_cso_dualshawujing",
	price = 3938000,
	amount = 10,
	separate = true,
	pricesep = 358000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Trinity - Flame", {
	model = "models/weapons/tfa_cso/w_trinity_flame.mdl",
	entity = "tfa_cso_trinity_flame",
	price = 825000,
	amount = 10,
	separate = true,
	pricesep = 75000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Anaconda", {
	model = "models/weapons/tfa_cso/w_anaconda.mdl",
	entity = "tfa_cso_anaconda",
	price = 9900,
	amount = 10,
	separate = true,
	pricesep = 900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "PP2000", {
	model = "models/weapons/tfa_cso/w_pp2000.mdl",
	entity = "tfa_cso_pp2000",
	price = 11000,
	amount = 10,
	separate = true,
	pricesep = 1000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "M1918 BAR", {
	model = "models/weapons/tfa_cso/w_m1918bar.mdl",
	entity = "tfa_cso_m1918bar",
	price = 41800,
	amount = 10,
	separate = true,
	pricesep = 3800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Jay's Dagger", {
	model = "models/weapons/tfa_cso/w_jaydagger.mdl",
	entity = "tfa_cso_jaydagger",
	price = 5500000,
	amount = 10,
	separate = true,
	pricesep = 500000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "XM8", {
	model = "models/weapons/tfa_cso/w_xm8.mdl",
	entity = "tfa_cso_xm8",
	price = 38500,
	amount = 10,
	separate = true,
	pricesep = 3500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "SIG SG550 Sniper", {
	model = "models/weapons/w_snip_sg550.mdl",
	entity = "tfa_cso_sg550",
	price = 55000,
	amount = 10,
	separate = true,
	pricesep = 5000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Nata Knife", {
	model = "models/weapons/tfa_cso/w_nata.mdl",
	entity = "tfa_cso_nata",
	price = 11550,
	amount = 10,
	separate = true,
	pricesep = 1050,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "SIG SG552 Commando", {
	model = "models/weapons/w_rif_sg552.mdl",
	entity = "tfa_cso_sg552",
	price = 33000,
	amount = 10,
	separate = true,
	pricesep = 3000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Trinity - Stun", {
	model = "models/weapons/tfa_cso/w_trinity_stun.mdl",
	entity = "tfa_cso_trinity_stun",
	price = 550000,
	amount = 10,
	separate = true,
	pricesep = 50000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Colt Python", {
	model = "models/weapons/tfa_cso/w_python.mdl",
	entity = "tfa_cso_python",
	price = 8800,
	amount = 10,
	separate = true,
	pricesep = 800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Lightning Bazzi-1 (A Mode)", {
	model = "models/weapons/tfa_cso/w_cartred.mdl",
	entity = "tfa_cso_cartred_a",
	price = 40700,
	amount = 10,
	separate = true,
	pricesep = 3700,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Calico M950", {
	model = "models/weapons/tfa_cso/w_m950.mdl",
	entity = "tfa_cso_m950",
	price = 27500,
	amount = 10,
	separate = true,
	pricesep = 2500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "MG3", {
	model = "models/weapons/tfa_cso/w_mg3.mdl",
	entity = "tfa_cso_mg3",
	price = 95700,
	amount = 10,
	separate = true,
	pricesep = 8700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "K3", {
	model = "models/weapons/tfa_cso/w_k3.mdl",
	entity = "tfa_cso_k3",
	price = 44000,
	amount = 10,
	separate = true,
	pricesep = 4000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Cheytac Intervention M200", {
	model = "models/weapons/tfa_cso/w_m200.mdl",
	entity = "tfa_cso_m200",
	price = 869000,
	amount = 10,
	separate = true,
	pricesep = 79000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Ethereal", {
	model = "models/weapons/tfa_cso/w_ethereal.mdl",
	entity = "tfa_cso_ethereal",
	price = 69300,
	amount = 10,
	separate = true,
	pricesep = 6300,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "HK G11", {
	model = "models/weapons/tfa_cso/w_hk_g11.mdl",
	entity = "tfa_cso_hk_g11",
	price = 42900,
	amount = 10,
	separate = true,
	pricesep = 3900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Benelli XM1014", {
	model = "models/weapons/w_shot_xm1014.mdl",
	entity = "tfa_cso_xm1014",
	price = 22000,
	amount = 10,
	separate = true,
	pricesep = 2000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "BALROG-V", {
	model = "models/weapons/tfa_cso/w_balrog5.mdl",
	entity = "tfa_cso_balrog5",
	price = 1353000,
	amount = 10,
	separate = true,
	pricesep = 123000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Blaser R93 Tactical", {
	model = "models/weapons/tfa_cso/w_r93.mdl",
	entity = "tfa_cso_r93",
	price = 693000,
	amount = 10,
	separate = true,
	pricesep = 63000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Divine Lock", {
	model = "models/weapons/tfa_cso/w_flintlock_pistol.mdl",
	entity = "tfa_cso_divinelock",
	price = 1089000,
	amount = 10,
	separate = true,
	pricesep = 99000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Steyr AUG A1", {
	model = "models/weapons/w_rif_aug.mdl",
	entity = "tfa_cso_aug",
	price = 36300,
	amount = 10,
	separate = true,
	pricesep = 3300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "HK23E", {
	model = "models/weapons/tfa_cso/w_hk23.mdl",
	entity = "tfa_cso_hk23",
	price = 72600,
	amount = 10,
	separate = true,
	pricesep = 6600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Mauser C96", {
	model = "models/weapons/tfa_cso/w_mauser_c96.mdl",
	entity = "tfa_cso_mauser_c96",
	price = 4400,
	amount = 10,
	separate = true,
	pricesep = 400,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Infinity Laser Fist", {
	model = "models/weapons/tfa_cso/w_laserfist_r.mdl",
	entity = "tfa_cso_laserfist",
	price = 35200000,
	amount = 10,
	separate = true,
	pricesep = 3200000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Fire Vulcan", {
	model = "models/weapons/tfa_cso/w_fire_vulcan.mdl",
	entity = "tfa_cso_fire_vulcan",
	price = 1496000,
	amount = 10,
	separate = true,
	pricesep = 136000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "FNP-45", {
	model = "models/weapons/tfa_cso/w_fnp45.mdl",
	entity = "tfa_cso_fnp45",
	price = 4400,
	amount = 10,
	separate = true,
	pricesep = 400,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Ultimax 100", {
	model = "models/weapons/tfa_cso/w_ultimax100.mdl",
	entity = "tfa_cso_ultimax100",
	price = 66000,
	amount = 10,
	separate = true,
	pricesep = 6000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Petrol Boomer", {
	model = "models/weapons/tfa_cso/w_petrolboomer.mdl",
	entity = "tfa_cso_petrolboomer",
	price = 1034000,
	amount = 10,
	separate = true,
	pricesep = 94000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "FNC", {
	model = "models/weapons/tfa_cso/w_fnc.mdl",
	entity = "tfa_cso_fnc",
	price = 32450,
	amount = 10,
	separate = true,
	pricesep = 2950,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "SKULL-9", {
	model = "models/weapons/tfa_cso/w_skull_9.mdl",
	entity = "tfa_cso_skull9",
	price = 473000,
	amount = 10,
	separate = true,
	pricesep = 43000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "KSG-12", {
	model = "models/weapons/tfa_cso/w_ksg12.mdl",
	entity = "tfa_cso_ksg12",
	price = 35200,
	amount = 10,
	separate = true,
	pricesep = 3200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Remington XM2010 ESR", {
	model = "models/weapons/tfa_cso/w_xm2010.mdl",
	entity = "tfa_cso_xm2010",
	price = 192500,
	amount = 10,
	separate = true,
	pricesep = 17500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Thunder Ghost Walker", {
	model = "models/weapons/tfa_cso/w_thunderpistol.mdl",
	entity = "tfa_cso_thunderpistol",
	price = 25300000,
	amount = 10,
	separate = true,
	pricesep = 2300000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Trinity - Knockback", {
	model = "models/weapons/tfa_cso/w_trinity_knockback.mdl",
	entity = "tfa_cso_trinity_knockback",
	price = 385000,
	amount = 10,
	separate = true,
	pricesep = 35000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "M1911 A1", {
	model = "models/weapons/tfa_cso/w_m1911a1.mdl",
	entity = "tfa_cso_m1911a1",
	price = 3300,
	amount = 10,
	separate = true,
	pricesep = 300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "FN F2000", {
	model = "models/weapons/tfa_cso/w_f2000.mdl",
	entity = "tfa_cso_f2000",
	price = 52800,
	amount = 10,
	separate = true,
	pricesep = 4800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "USAS-12", {
	model = "models/weapons/tfa_cso/w_usas12camo.mdl",
	entity = "tfa_cso_usas12",
	price = 55000,
	amount = 10,
	separate = true,
	pricesep = 5000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Dragunov SVD", {
	model = "models/weapons/w_snip_awp.mdl",
	entity = "tfa_cso_svd",
	price = 79200,
	amount = 10,
	separate = true,
	pricesep = 7200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Kriss Super V", {
	model = "models/weapons/tfa_cso/w_kriss.mdl",
	entity = "tfa_cso_kriss_v",
	price = 28600,
	amount = 10,
	separate = true,
	pricesep = 2600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Dread Nova", {
	model = "models/weapons/tfa_cso/w_dreadnova_a.mdl",
	entity = "tfa_cso_dreadnova",
	price = 8965000,
	amount = 10,
	separate = true,
	pricesep = 815000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Thompson Chicago", {
	model = "models/weapons/tfa_cso/w_thompson_chicago.mdl",
	entity = "tfa_cso_thompson_chicago",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AI AW50F", {
	model = "models/weapons/tfa_cso/w_aw50.mdl",
	entity = "tfa_cso_aw50",
	price = 352000,
	amount = 10,
	separate = true,
	pricesep = 32000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "USP45", {
	model = "models/weapons/w_pist_usp.mdl",
	entity = "tfa_cso_usp",
	price = 3300,
	amount = 10,
	separate = true,
	pricesep = 300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "M95", {
	model = "models/weapons/tfa_cso/w_m95.mdl",
	entity = "tfa_cso_m95",
	price = 440000,
	amount = 10,
	separate = true,
	pricesep = 40000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "STG44", {
	model = "models/weapons/tfa_cso/w_stg44.mdl",
	entity = "tfa_cso_stg44",
	price = 34650,
	amount = 10,
	separate = true,
	pricesep = 3150,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AKM", {
	model = "models/weapons/tfa_cso/w_akm.mdl",
	entity = "tfa_cso_akm",
	price = 30800,
	amount = 10,
	separate = true,
	pricesep = 2800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "OTs-14 Groza", {
	model = "models/weapons/tfa_cso/w_groza.mdl",
	entity = "tfa_cso_groza",
	price = 33550,
	amount = 10,
	separate = true,
	pricesep = 3050,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Double-barreled shotgun", {
	model = "models/weapons/tfa_cso/w_dbarrel.mdl",
	entity = "tfa_cso_dbarrel",
	price = 23100,
	amount = 10,
	separate = true,
	pricesep = 2100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Dual Elites", {
	model = "models/weapons/w_pist_elite.mdl",
	entity = "tfa_cso_elite",
	price = 5500,
	amount = 10,
	separate = true,
	pricesep = 500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Balisong", {
	model = "models/weapons/tfa_cso/w_butterflyknife.mdl",
	entity = "tfa_cso_butterflyknife",
	price = 6600,
	amount = 10,
	separate = true,
	pricesep = 600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Crossbow", {
	model = "models/weapons/tfa_cso/w_crossbow.mdl",
	entity = "tfa_cso_crossbow",
	price = 66000,
	amount = 10,
	separate = true,
	pricesep = 6000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Hunter Killer X-12", {
	model = "models/weapons/tfa_cso/w_x-12.mdl",
	entity = "tfa_cso_x-12",
	price = 264000,
	amount = 10,
	separate = true,
	pricesep = 24000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M136 AT4", {
	model = "models/weapons/tfa_cso/w_at4.mdl",
	entity = "tfa_cso_at4",
	price = 2079000,
	amount = 10,
	separate = true,
	pricesep = 189000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Destroyer", {
	model = "models/weapons/tfa_cso/w_destroyer.mdl",
	entity = "tfa_cso_destroyer",
	price = 22000000,
	amount = 10,
	separate = true,
	pricesep = 2000000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M67 Frag Grenade", {
	model = "models/weapons/tfa_cso/w_fragnade.mdl",
	entity = "tfa_cso_fragnade",
	price = 66000,
	amount = 10,
	separate = true,
	pricesep = 6000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "FG-Launcher", {
	model = "models/weapons/tfa_cso/w_fglauncher.mdl",
	entity = "tfa_cso_fglauncher",
	price = 583000,
	amount = 10,
	separate = true,
	pricesep = 53000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Lightning AR-2", {
	model = "models/weapons/tfa_cso/w_violingun.mdl",
	entity = "tfa_cso_violingun",
	price = 539000,
	amount = 10,
	separate = true,
	pricesep = 49000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Daewoo K1A", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "tfa_cso_k1a",
	price = 31900,
	amount = 10,
	separate = true,
	pricesep = 2900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Cold Steel Knife", {
	model = "models/weapons/tfa_cso/w_cold_steel_knife.mdl",
	entity = "tfa_cso_coldsteelblade",
	price = 6600,
	amount = 10,
	separate = true,
	pricesep = 600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "UMP45", {
	model = "models/weapons/w_smg_ump45.mdl",
	entity = "tfa_cso_ump45",
	price = 27500,
	amount = 10,
	separate = true,
	pricesep = 2500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "THANATOS-9", {
	model = "models/weapons/tfa_cso/w_thanatos_9.mdl",
	entity = "tfa_cso_thanatos9",
	price = 451000,
	amount = 10,
	separate = true,
	pricesep = 41000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "JANUS-9", {
	model = "models/weapons/tfa_cso/w_janus9.mdl",
	entity = "tfa_cso_janus9",
	price = 42900,
	amount = 10,
	separate = true,
	pricesep = 3900,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "TMP", {
	model = "models/weapons/tfa_cso/w_tmp.mdl",
	entity = "tfa_cso_tmp",
	price = 20900,
	amount = 10,
	separate = true,
	pricesep = 1900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Infinity Silver", {
	model = "models/weapons/tfa_cso/w_infinity_silver.mdl",
	entity = "tfa_cso_infinite_silver",
	price = 6600,
	amount = 10,
	separate = true,
	pricesep = 600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Beretta ARX-160", {
	model = "models/weapons/tfa_cso/w_arx160.mdl",
	entity = "tfa_cso_arx160",
	price = 46200,
	amount = 10,
	separate = true,
	pricesep = 4200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Dual Sword Hellfire", {
	model = "models/weapons/tfa_cso/w_budgetsword_hell.mdl",
	entity = "tfa_cso_budgetsword",
	price = 2310000,
	amount = 10,
	separate = true,
	pricesep = 210000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "SAKO TRG-42", {
	model = "models/weapons/tfa_cso/w_trg42.mdl",
	entity = "tfa_cso_trg42",
	price = 220000,
	amount = 10,
	separate = true,
	pricesep = 20000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Avalanche", {
	model = "models/weapons/tfa_cso/w_avalanche.mdl",
	entity = "tfa_cso_avalanche",
	price = 1518000,
	amount = 10,
	separate = true,
	pricesep = 138000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Tactical Knife", {
	model = "models/weapons/tfa_cso/w_tknife.mdl",
	entity = "tfa_cso_tacticalknife",
	price = 4400,
	amount = 10,
	separate = true,
	pricesep = 400,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "VSK-94", {
	model = "models/weapons/w_rif_sg552.mdl",
	entity = "tfa_cso_vsk94",
	price = 79200,
	amount = 10,
	separate = true,
	pricesep = 7200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Lightning SMG-1", {
	model = "models/weapons/tfa_cso/w_watergun.mdl",
	entity = "tfa_cso_watergun",
	price = 748000,
	amount = 10,
	separate = true,
	pricesep = 68000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Sten Mk2", {
	model = "models/weapons/tfa_cso/w_sten_mk2.mdl",
	entity = "tfa_cso_sten_mk2",
	price = 22000,
	amount = 10,
	separate = true,
	pricesep = 2000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Gilboa Carbine", {
	model = "models/weapons/tfa_cso/w_gilboa.mdl",
	entity = "tfa_cso_gilboa",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AI AS50", {
	model = "models/weapons/w_snip_awp.mdl",
	entity = "tfa_cso_as50",
	price = 374000,
	amount = 10,
	separate = true,
	pricesep = 34000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "MP5", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "tfa_cso_mp5",
	price = 19800,
	amount = 10,
	separate = true,
	pricesep = 1800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Gae Bolg", {
	model = "models/weapons/tfa_cso/w_speargun.mdl",
	entity = "tfa_cso_speargun",
	price = 4378000,
	amount = 10,
	separate = true,
	pricesep = 398000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Desert Eagle", {
	model = "models/weapons/w_pist_deagle.mdl",
	entity = "tfa_cso_deagle",
	price = 7700,
	amount = 10,
	separate = true,
	pricesep = 700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Walther WA2000", {
	model = "models/weapons/tfa_cso/w_wa2000.mdl",
	entity = "tfa_cso_wa2000",
	price = 88000,
	amount = 10,
	separate = true,
	pricesep = 8000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Bazooka", {
	model = "models/weapons/tfa_cso/w_bazooka.mdl",
	entity = "tfa_cso_bazooka",
	price = 1067000,
	amount = 10,
	separate = true,
	pricesep = 97000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Lightning SG-1", {
	model = "models/weapons/tfa_cso/w_umbrella.mdl",
	entity = "tfa_cso_umbrella",
	price = 473000,
	amount = 10,
	separate = true,
	pricesep = 43000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Milkor M32 MGL", {
	model = "models/weapons/tfa_cso/w_m32.mdl",
	entity = "tfa_cso_milkorm32",
	price = 1958000,
	amount = 10,
	separate = true,
	pricesep = 178000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Rail Cannon", {
	model = "models/weapons/tfa_cso/w_railcannon.mdl",
	entity = "tfa_cso_railcannon",
	price = 15950000,
	amount = 10,
	separate = true,
	pricesep = 1450000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Glock 18", {
	model = "models/weapons/w_pist_glock18.mdl",
	entity = "tfa_cso_glock",
	price = 3300,
	amount = 10,
	separate = true,
	pricesep = 300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "M249", {
	model = "models/weapons/tfa_cso/w_m249.mdl",
	entity = "tfa_cso_m249",
	price = 62700,
	amount = 10,
	separate = true,
	pricesep = 5700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "MG36", {
	model = "models/weapons/tfa_cso/w_mg36.mdl",
	entity = "tfa_cso_mg36",
	price = 56650,
	amount = 10,
	separate = true,
	pricesep = 5150,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "RPG-7", {
	model = "models/weapons/tfa_cso/w_rpg7.mdl",
	entity = "tfa_cso_rpg7",
	price = 385000,
	amount = 10,
	separate = true,
	pricesep = 35000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Soul Bane Dagger", {
	model = "models/weapons/tfa_cso/w_combatknife.mdl",
	entity = "tfa_cso_combatknife",
	price = 13200,
	amount = 10,
	separate = true,
	pricesep = 1200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Ruyi Stick", {
	model = "models/weapons/tfa_cso/w_monkeywpnset3.mdl",
	entity = "tfa_cso_ruyi",
	price = 104500,
	amount = 10,
	separate = true,
	pricesep = 9500,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "M16A4", {
	model = "models/weapons/tfa_cso/w_m16a4.mdl",
	entity = "tfa_cso_m16a4",
	price = 33000,
	amount = 10,
	separate = true,
	pricesep = 3000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "UZI", {
	model = "models/weapons/tfa_cso/w_uzi.mdl",
	entity = "tfa_cso_uzi",
	price = 11000,
	amount = 10,
	separate = true,
	pricesep = 1000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AK-47", {
	model = "models/weapons/tfa_cso/w_ak47.mdl",
	entity = "tfa_cso_ak47",
	price = 29700,
	amount = 10,
	separate = true,
	pricesep = 2700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Mosin Nagant", {
	model = "models/weapons/tfa_cso/w_mosin.mdl",
	entity = "tfa_cso_mosin",
	price = 20900,
	amount = 10,
	separate = true,
	pricesep = 1900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M2", {
	model = "models/weapons/tfa_cso/w_m2.mdl",
	entity = "tfa_cso_m2",
	price = 85800,
	amount = 10,
	separate = true,
	pricesep = 7800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Snap Blade", {
	model = "models/weapons/tfa_cso/w_snap_blade.mdl",
	entity = "tfa_cso_snap_blade",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Compound Bow", {
	model = "models/weapons/tfa_cso/w_compound.mdl",
	entity = "tfa_cso_bow",
	price = 7238000,
	amount = 10,
	separate = true,
	pricesep = 658000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "HK G3SG-1", {
	model = "models/weapons/w_snip_g3sg1.mdl",
	entity = "tfa_cso_g3sg1",
	price = 55000,
	amount = 10,
	separate = true,
	pricesep = 5000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "M14 EBR", {
	model = "models/weapons/tfa_cso/w_m14.mdl",
	entity = "tfa_cso_m14ebr",
	price = 46200,
	amount = 10,
	separate = true,
	pricesep = 4200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Lightning AR-1", {
	model = "models/weapons/tfa_cso/w_guitar.mdl",
	entity = "tfa_cso_guitar",
	price = 473000,
	amount = 10,
	separate = true,
	pricesep = 43000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Blaster", {
	model = "models/weapons/tfa_cso/w_blaster.mdl",
	entity = "tfa_cso_blaster",
	price = 451000,
	amount = 10,
	separate = true,
	pricesep = 41000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Seal Knife", {
	model = "models/weapons/tfa_cso/w_sealknife.mdl",
	entity = "tfa_cso_sealknife",
	price = 3300,
	amount = 10,
	separate = true,
	pricesep = 300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "AutoMag V", {
	model = "models/weapons/tfa_cso/w_automagv.mdl",
	entity = "tfa_cso_automagv",
	price = 8800,
	amount = 10,
	separate = true,
	pricesep = 800,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Tempest", {
	model = "models/weapons/tfa_cso/w_tempest.mdl",
	entity = "tfa_cso_tempest",
	price = 418000,
	amount = 10,
	separate = true,
	pricesep = 38000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "SCAR-L", {
	model = "models/weapons/tfa_cso/w_scarl.mdl",
	entity = "tfa_cso_scar_l",
	price = 44000,
	amount = 10,
	separate = true,
	pricesep = 4000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "M4A1", {
	model = "models/weapons/tfa_cso/w_m4a1.mdl",
	entity = "tfa_cso_m4a1",
	price = 34100,
	amount = 10,
	separate = true,
	pricesep = 3100,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "L85A2", {
	model = "models/weapons/tfa_cso/w_l85a2.mdl",
	entity = "tfa_cso_l85a2",
	price = 39600,
	amount = 10,
	separate = true,
	pricesep = 3600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Stun Rifle (No Charge)", {
	model = "models/weapons/tfa_cso/w_stunrifle.mdl",
	entity = "tfa_cso_stunriflea",
	price = 2530000,
	amount = 10,
	separate = true,
	pricesep = 230000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "MG42", {
	model = "models/weapons/tfa_cso/w_mg42.mdl",
	entity = "tfa_cso_mg42",
	price = 137500,
	amount = 10,
	separate = true,
	pricesep = 12500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "FN MK48", {
	model = "models/weapons/tfa_cso/w_mk48.mdl",
	entity = "tfa_cso_mk48",
	price = 58300,
	amount = 10,
	separate = true,
	pricesep = 5300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Steyr Scout", {
	model = "models/weapons/w_snip_scout.mdl",
	entity = "tfa_cso_scout",
	price = 18700,
	amount = 10,
	separate = true,
	pricesep = 1700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Magnum Launchcer", {
	model = "models/weapons/tfa_cso/w_magnum_lancer.mdl",
	entity = "tfa_cso_magnum_lancer",
	price = 27500000,
	amount = 10,
	separate = true,
	pricesep = 2500000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "HK121", {
	model = "models/weapons/tfa_cso/w_hk121.mdl",
	entity = "tfa_cso_hk121",
	price = 64900,
	amount = 10,
	separate = true,
	pricesep = 5900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "SL8", {
	model = "models/weapons/tfa_cso/w_sl8.mdl",
	entity = "tfa_cso_sl8",
	price = 66000,
	amount = 10,
	separate = true,
	pricesep = 6000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Coil Machine Gun", {
	model = "models/weapons/tfa_cso/w_coilmg.mdl",
	entity = "tfa_cso_coilmg",
	price = 4015000,
	amount = 10,
	separate = true,
	pricesep = 365000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Black Dragon Cannon", {
	model = "models/weapons/tfa_cso/w_black_dragon_cannon.mdl",
	entity = "tfa_cso_dragoncannon",
	price = 5302000,
	amount = 10,
	separate = true,
	pricesep = 482000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "M24 Grenade", {
	model = "models/weapons/tfa_cso/w_m24_grenade.mdl",
	entity = "tfa_cso_m24grenade",
	price = 66000,
	amount = 10,
	separate = true,
	pricesep = 6000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 5 - Explosives"
})

DarkRP.createShipment( "Runebreaker", {
	model = "models/weapons/tfa_cso/w_runebreaker.mdl",
	entity = "tfa_cso_runebreaker",
	price = 1848000,
	amount = 10,
	separate = true,
	pricesep = 168000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "QBS-09", {
	model = "models/weapons/tfa_cso/w_qbs_09.mdl",
	entity = "tfa_cso_qbs09",
	price = 38500,
	amount = 10,
	separate = true,
	pricesep = 3500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "M134 Vulcan", {
	model = "models/weapons/tfa_cso/w_m134_vulcan.mdl",
	entity = "tfa_cso_m134_vulcan",
	price = 7810000,
	amount = 10,
	separate = true,
	pricesep = 710000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Zhu Bajie Minigun", {
	model = "models/weapons/tfa_cso/w_monkeywpnset1.mdl",
	entity = "tfa_cso_m134_zhubajie",
	price = 7535000,
	amount = 10,
	separate = true,
	pricesep = 685000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Gungnir", {
	model = "models/weapons/tfa_cso/w_gungnira.mdl",
	entity = "tfa_cso_gungnir_nrm",
	price = 110000000,
	amount = 10,
	separate = true,
	pricesep = 10000000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Magnum Drill", {
	model = "models/weapons/tfa_cso/w_magnum_drill.mdl",
	entity = "tfa_cso_magnumdrill",
	price = 5258000,
	amount = 10,
	separate = true,
	pricesep = 478000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "KH-2002", {
	model = "models/weapons/tfa_cso/w_kh2002.mdl",
	entity = "tfa_cso_kh2002",
	price = 40700,
	amount = 10,
	separate = true,
	pricesep = 3700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Plasma Gun", {
	model = "models/weapons/tfa_cso/w_plasmagun.mdl",
	entity = "tfa_cso_plasmagun",
	price = 1804000,
	amount = 10,
	separate = true,
	pricesep = 164000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Savery", {
	model = "models/weapons/tfa_cso/w_savery.mdl",
	entity = "tfa_cso_savery",
	price = 106700,
	amount = 10,
	separate = true,
	pricesep = 9700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "OICW", {
	model = "models/weapons/tfa_cso/w_oicw.mdl",
	entity = "tfa_cso_oicw",
	price = 79200,
	amount = 10,
	separate = true,
	pricesep = 7200,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Beam Sword", {
	model = "models/weapons/tfa_cso/w_beam_sword.mdl",
	entity = "tfa_cso_beam_sword",
	price = 5500000,
	amount = 10,
	separate = true,
	pricesep = 500000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Luger P08", {
	model = "models/weapons/tfa_cso/w_luger.mdl",
	entity = "tfa_cso_luger",
	price = 4400,
	amount = 10,
	separate = true,
	pricesep = 400,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "PGM Hécate II", {
	model = "models/weapons/tfa_cso/w_pgm.mdl",
	entity = "tfa_cso_pgm",
	price = 297000,
	amount = 10,
	separate = true,
	pricesep = 27000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "PP-19 Bizon", {
	model = "models/weapons/tfa_cso/w_bizon.mdl",
	entity = "tfa_cso_bizon",
	price = 17600,
	amount = 10,
	separate = true,
	pricesep = 1600,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AN 94", {
	model = "models/weapons/tfa_cso/w_an94.mdl",
	entity = "tfa_cso_an94",
	price = 53900,
	amount = 10,
	separate = true,
	pricesep = 4900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "QBB-95", {
	model = "models/weapons/w_mach_m249para.mdl",
	entity = "tfa_cso_qbb95",
	price = 31900,
	amount = 10,
	separate = true,
	pricesep = 2900,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Drill Gun", {
	model = "models/weapons/tfa_cso/w_drillgun.mdl",
	entity = "tfa_cso_drillgun",
	price = 3894000,
	amount = 10,
	separate = true,
	pricesep = 354000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Needler", {
	model = "models/weapons/tfa_cso/w_needler.mdl",
	entity = "tfa_cso_needler",
	price = 5335000,
	amount = 10,
	separate = true,
	pricesep = 485000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "SCAR-H", {
	model = "models/weapons/tfa_cso/w_scarh.mdl",
	entity = "tfa_cso_scarh",
	price = 47300,
	amount = 10,
	separate = true,
	pricesep = 4300,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Cyclone", {
	model = "models/weapons/tfa_cso/w_cyclone.mdl",
	entity = "tfa_cso_cyclone",
	price = 9625000,
	amount = 10,
	separate = true,
	pricesep = 875000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "FN P90", {
	model = "models/weapons/w_smg_p90.mdl",
	entity = "tfa_cso_p90",
	price = 27500,
	amount = 10,
	separate = true,
	pricesep = 2500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "FN Five-seveN", {
	model = "models/weapons/w_pist_fiveseven.mdl",
	entity = "tfa_cso_fiveseven",
	price = 5500,
	amount = 10,
	separate = true,
	pricesep = 500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "MP7A1", {
	model = "models/weapons/tfa_cso/w_mp7a1.mdl",
	entity = "tfa_cso_mp7a1",
	price = 18700,
	amount = 10,
	separate = true,
	pricesep = 1700,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "AWP", {
	model = "models/weapons/w_snip_awp.mdl",
	entity = "tfa_cso_awp",
	price = 52250,
	amount = 10,
	separate = true,
	pricesep = 4750,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "X-TRACKER", {
	model = "models/weapons/tfa_cso/w_xtracker_nrm.mdl",
	entity = "tfa_cso_xtracker_nrm",
	price = 2750000,
	amount = 10,
	separate = true,
	pricesep = 250000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Parker Hale M82", {
	model = "models/weapons/tfa_cso/w_m82.mdl",
	entity = "tfa_cso_m82",
	price = 37400,
	amount = 10,
	separate = true,
	pricesep = 3400,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Galil", {
	model = "models/weapons/w_rif_galil.mdl",
	entity = "tfa_cso_galil",
	price = 27500,
	amount = 10,
	separate = true,
	pricesep = 2500,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 3 - Light Weapons"
})

DarkRP.createShipment( "Laser Minigun", {
	model = "models/weapons/tfa_cso/w_laserminigun.mdl",
	entity = "tfa_cso_laserminigun",
	price = 17600000,
	amount = 10,
	separate = true,
	pricesep = 1600000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Ballista", {
	model = "models/weapons/tfa_cso/w_ballista.mdl",
	entity = "tfa_cso_ballista",
	price = 2500000,
	amount = 10,
	separate = true,
	pricesep = 2500000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Crowbar", {
	model = "models/weapons/tfa_cso/w_crowbar.mdl",
	entity = "tfa_cso_crowbar",
	price = 3000,
	amount = 10,
	separate = true,
	pricesep = 3000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})

DarkRP.createShipment( "Dart Pistol", {
	model = "models/weapons/tfa_cso/w_dartpistol.mdl",
	entity = "tfa_cso_dartpistol",
	price = 71000,
	amount = 10,
	separate = true,
	pricesep = 71000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 2 - Sidearms"
})

DarkRP.createShipment( "Heaven Scorcher", {
	model = "models/weapons/tfa_cso/w_heavenscorcher.mdl",
	entity = "tfa_cso_heavenscorcher",
	price = 7500000,
	amount = 10,
	separate = true,
	pricesep = 7500000,
	noship = true,
	allowed = {TEAM_SPECGUN},
	category = "Slot 4 - Heavy Weapons"
})

DarkRP.createShipment( "Hwando", {
	model = "models/weapons/tfa_cso/w_hwando.mdl",
	entity = "tfa_cso_hwando",
	price = 28000,
	amount = 10,
	separate = true,
	pricesep = 28000,
	noship = true,
	allowed = {TEAM_GUN},
	category = "Slot 1 - Melee"
})