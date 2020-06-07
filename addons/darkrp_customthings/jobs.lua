--[[
    AnkoRP custom jobs.
    Not much to talk about here.
]]--

TEAM_SAS = DarkRP.createJob("British SAS", {
    color = Color(84, 109, 126, 255),
    model = "models/player/gasmask.mdl",
    description = [[The British SAS.
    Fight for the safety of the Citizens.]],
    weapons = {"tfa_cso_sealknife", "tfa_cso_p228", "tfa_cso_famas" },
    command = "sas",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Counter-Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_sealknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_p228" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_famas" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_GSG = DarkRP.createJob("German GSG-9", {
    color = Color(84, 109, 126, 255),
    model = "models/player/riot.mdl",
    description = [[The German GSG-9.
    Fight for the safety of the Citizens.]],
    weapons = {"tfa_cso_sealknife", "tfa_cso_automagv", "tfa_cso_xm1014" },
    command = "gsg",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Counter-Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_sealknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_automagv" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_xm1014" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_GIGN = DarkRP.createJob("French GIGN", {
    color = Color(84, 109, 126, 255),
    model = "models/player/swat.mdl",
    description = [[The French GIGN.
    Fight for the safety of the Citizens.]],
    weapons = {"tfa_cso_sealknife", "tfa_cso_infinite_silver", "tfa_cso_scout" },
    command = "gign",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Counter-Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_sealknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_infinite_silver" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_scout" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ST6 = DarkRP.createJob("American ST6", {
    color = Color(84, 109, 126, 255),
    model = "models/player/urban.mdl",
    description = [[The American SEAL Team 6.
    Fight for the safety of the Citizens.]],
    weapons = {"tfa_cso_sealknife", "tfa_cso_fiveseven", "tfa_cso_m4a1" },
    command = "seal",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Counter-Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_sealknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_fiveseven" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_m4a1" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_WW2AMER = DarkRP.createJob("American Soldier", {
    color = Color(84, 109, 126, 255),
    model = "models/player/dod_american.mdl",
    description = [[An American WW2 Soldier.
    Fight for the safety of the Citizens.]],
    weapons = {"tfa_cso_sealknife", "tfa_cso_m1911a1", "tfa_cso_m1918bar" },
    command = "america",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Counter-Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_sealknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_m1911a1" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_m1918bar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ARC = DarkRP.createJob("Arctic Avenger", {
    color = Color(125, 61, 64, 255),
    model = "models/player/arctic.mdl",
    description = [[An Arctic Avenger.
    Fight for whatever you believe is right.]],
    weapons = {"tfa_cso_butterflyknife", "tfa_cso_glock", "tfa_cso_awp" },
    command = "arc",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_butterflyknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_glock" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_awp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_WAR = DarkRP.createJob("Guerilla Warrior", {
    color = Color(125, 61, 64, 255),
    model = "models/player/guerilla.mdl",
    description = [[A Guerilla Warrior.
    Fight for whatever you believe is right.]],
    weapons = {"tfa_cso_butterflyknife", "tfa_cso_fnp45", "tfa_cso_negev" },
    command = "war",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_butterflyknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_fnp45" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_negev" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_LEET = DarkRP.createJob("Elite Crewman", {
    color = Color(125, 61, 64, 255),
    model = "models/player/leet.mdl",
    description = [[An Elite Crewman.
    Fight for whatever you believe is right.]],
    weapons = {"tfa_cso_butterflyknife", "tfa_cso_tacticalknife", "tfa_cso_elite" },
    command = "leet",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_butterflyknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_tacticalknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_elite" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_PHOE = DarkRP.createJob("Phoenix Connexion", {
    color = Color(125, 61, 64, 255),
    model = "models/player/phoenix.mdl",
    description = [[A Phoenix Connexion member.
    Fight for whatever you believe is right.]],
    weapons = {"tfa_cso_butterflyknife", "tfa_cso_deagle", "tfa_cso_ak47" },
    command = "phoe",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_butterflyknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_deagle" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_ak47" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_NAZI = DarkRP.createJob("Nazi Soldier", {
    color = Color(125, 61, 64, 255),
    model = "models/player/dod_german.mdl",
    description = [[A German WW2 soldier.
    Fight for whatever you believe is right.]],
    weapons = {"tfa_cso_butterflyknife", "tfa_cso_luger", "tfa_cso_mp40" },
    command = "nazi",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Terrorists", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_butterflyknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_luger" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_mp40" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ALYX = DarkRP.createJob("Alyx Vance", {
    color = Color(243, 207, 47, 255),
    model = "models/player/alyx.mdl",
    description = [[Alyx Vance.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_f2000" },
    command = "alyx",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 25 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_f2000" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_BARNEY = DarkRP.createJob("Barney Calhoun", {
    color = Color(243, 207, 47, 255),
    model = "models/player/barney.mdl",
    description = [[Barney Calhoun.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_mp5" },
    command = "barney",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_mp5" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ELI = DarkRP.createJob("Eli Vance", {
    color = Color(243, 207, 47, 255),
    model = "models/player/eli.mdl",
    description = [[Eli Vance.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python" },
    command = "eli",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_KLEINER = DarkRP.createJob("Isaac Kleiner", {
    color = Color(243, 207, 47, 255),
    model = "models/player/kleiner.mdl",
    description = [[Isaac Kleiner.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_spas12" },
    command = "kleiner",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_spas12" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_KLEINER = DarkRP.createJob("Arne Magnusson", {
    color = Color(243, 207, 47, 255),
    model = "models/player/magnusson.mdl",
    description = [[Arne Magnusson.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_spas12" },
    command = "magnusson",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_spas12" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_GRIGORI = DarkRP.createJob("Father Grigori", {
    color = Color(243, 207, 47, 255),
    model = "models/player/monk.mdl",
    description = [[Father Grigori.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_dbarrel" },
    command = "grigori",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 6, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 25 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_dbarrel" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ODESSA = DarkRP.createJob("Odessa Cubbage", {
    color = Color(243, 207, 47, 255),
    model = "models/player/odessa.mdl",
    description = [[Odessa Cubbage.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_at4" },
    command = "odessa",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 7, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 25 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_at4" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    return false end
})

TEAM_MOSSMAN = DarkRP.createJob("Judith Mossman", {
    color = Color(243, 207, 47, 255),
    model = {"models/player/mossman.mdl",
        "models/player/mossman_arctic.mdl"
    },
    description = [[Judith Mossman.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python" },
    command = "mossman",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 8, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_RESIST = DarkRP.createJob("Resistance Fighter", {
    color = Color(243, 207, 47, 255),
    model = {"models/player/group03/female_01.mdl",
        "models/player/group03/female_02.mdl",
        "models/player/group03/female_03.mdl",
        "models/player/group03/female_04.mdl",
        "models/player/group03/female_05.mdl",
        "models/player/group03/female_06.mdl",
        "models/player/group03/male_01.mdl",
        "models/player/group03/male_02.mdl",
        "models/player/group03/male_03.mdl",
        "models/player/group03/male_04.mdl",
        "models/player/group03/male_05.mdl",
        "models/player/group03/male_06.mdl",
        "models/player/group03/male_07.mdl",
        "models/player/group03/male_08.mdl",
        "models/player/group03/male_09.mdl"
    },
    description = [[A fighter in the resistance.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "tfa_cso_mp7a1" },
    command = "resist",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 9, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_mp7a1" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_MEDIC = DarkRP.createJob("Resistance Medic", {
    color = Color(243, 207, 47, 255),
    model = {"models/player/group03m/female_01.mdl",
        "models/player/group03m/female_02.mdl",
        "models/player/group03m/female_03.mdl",
        "models/player/group03m/female_04.mdl",
        "models/player/group03m/female_05.mdl",
        "models/player/group03m/female_06.mdl",
        "models/player/group03m/male_01.mdl",
        "models/player/group03m/male_02.mdl",
        "models/player/group03m/male_03.mdl",
        "models/player/group03m/male_04.mdl",
        "models/player/group03m/male_05.mdl",
        "models/player/group03m/male_06.mdl",
        "models/player/group03m/male_07.mdl",
        "models/player/group03m/male_08.mdl",
        "models/player/group03m/male_09.mdl"
    },
    description = [[A medic for the resistance.
    Fight for the freedom of your oppressed citizens.]],
    weapons = {"tfa_cso_crowbar", "tfa_cso_python", "weapon_medkit" },
    command = "medic",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Resistance", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 10, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_crowbar" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_python" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_BREEN = DarkRP.createJob("Wallace Breen", {
    color = Color(63, 92, 205, 255),
    model = "models/player/breen.mdl",
    description = [[Wallace Breen.
    Fight to keep a tight grip on your control.]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp" },
    command = "breen",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_coldsteelblade" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_usp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_SOLDIER = DarkRP.createJob("Soldier", {
    color = Color(63, 92, 205, 255),
    model = "models/player/combine_soldier.mdl",
    description = [[A basic foot soldier.
    Fight to keep a tight grip on your control.]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp", "tfa_cso_oicw" },
    command = "cmb",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_coldsteelblade" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_usp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_oicw" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_ELITE = DarkRP.createJob("Elite", {
    color = Color(63, 92, 205, 255),
    model = "models/player/combine_super_soldier.mdl",
    description = [[A heavy foot soldier.
    Fight to keep a tight grip on your control.
YOU GET NO LOADOUT WEAPONS AS THIS JOB!]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp", "tfa_cso_mg36" },
    command = "elite",
    max = 2, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 250 ) ply:SetArmor( 150 ) ply:SetMaxHealth( 250 )
    return false end
})

TEAM_GUARD = DarkRP.createJob("Prison Guard", {
    color = Color(63, 92, 205, 255),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = [[A combine prison guard.
    Fight to keep a tight grip on your control.]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp", "tfa_cso_uts15" },
    command = "guard",
    max = 4, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 75 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_coldsteelblade" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_usp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_uts15" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_POLICE = DarkRP.createJob("Civil Protection", {
    color = Color(63, 92, 205, 255),
    model = { "models/player/police.mdl",
        "models/player/police_fem.mdl" },
    description = [[A civil protection agent.
    Fight to keep a tight grip on your control.]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp", "tfa_cso_mp7a1" },
    command = "police",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 50 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_coldsteelblade" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_usp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_mp7a1" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_STRIPPED = DarkRP.createJob("Stripped Soldier", {
    color = Color(63, 92, 205, 255),
    model = "models/player/soldier_stripped.mdl",
    description = [[A stripped soldier.
    Fight to keep a tight grip on your control.]],
    weapons = {"tfa_cso_coldsteelblade", "tfa_cso_usp", "weapon_medkit" },
    command = "stripped",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Combine", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 6, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_coldsteelblade" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot2", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_usp" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot2" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot3", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot3" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot4", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot4" ) )
    end
    if ply:GetNWString( "WepLoadoutSlot5", "nil" ) != "nil" then
        ply:Give( ply:GetNWString( "WepLoadoutSlot5" ) )
    end
    return false end
})

TEAM_CHARPLE = DarkRP.createJob("Charple", {
    color = Color(112, 173, 71, 255),
    model = "models/player/charple.mdl",
    description = [[A burnt corpse.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "charple",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_CORPSE = DarkRP.createJob("Corpse", {
    color = Color(112, 173, 71, 255),
    model = "models/player/corpse1.mdl",
    description = [[A corpse that hasn't quite decomposed yet.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "corpse",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_SKELETON = DarkRP.createJob("Skeleton", {
    color = Color(112, 173, 71, 255),
    model = "models/player/skeleton.mdl",
    description = [[A completely clean corpse.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "skel",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_ZOMBIE = DarkRP.createJob("Zombie", {
    color = Color(112, 173, 71, 255),
    model = "models/player/zombie_classic.mdl",
    description = [[The dead resurrected.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "zombie",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_FZOMBIE = DarkRP.createJob("Fast Zombie", {
    color = Color(112, 173, 71, 255),
    model = "models/player/zombie_fast.mdl",
    description = [[The dead resurrected, but fast.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "fzombie",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_ZOMBINE = DarkRP.createJob("Zombine", {
    color = Color(112, 173, 71, 255),
    model = "models/player/zombie_soldier.mdl",
    description = [[A dead combine soldier resurrected.
    Fight against those who left you to die.
ONLY YOUR LOADOUT MELEE WEAPON WILL BE GIVEN!]],
    weapons = {"tfa_cso_combatknife" },
    command = "zombine",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Monsters", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 6, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 100 ) ply:SetArmor( 50 ) ply:SetMaxHealth( 150 )
    if ply:GetNWString( "WepLoadoutSlot1", "nil" ) != "nil" then
        ply:StripWeapon( "tfa_cso_combatknife" )
        ply:Give( ply:GetNWString( "WepLoadoutSlot1" ) )
    end
    return false end
})

TEAM_CIVIE = DarkRP.createJob("Civilian", {
    color = Color(0, 176, 80, 255),
    model = {"models/player/group01/female_01.mdl",
            "models/player/group01/female_02.mdl",
            "models/player/group01/female_03.mdl",
            "models/player/group01/female_04.mdl",
            "models/player/group01/female_06.mdl",
            "models/player/group01/male_01.mdl",
            "models/player/group01/male_02.mdl",
            "models/player/group01/male_03.mdl",
            "models/player/group01/male_04.mdl",
            "models/player/group01/male_05.mdl",
            "models/player/group01/male_06.mdl",
            "models/player/group01/male_07.mdl",
            "models/player/group01/male_08.mdl",
            "models/player/group01/male_09.mdl"
    },
    description = [[An average citizen lost on the battlefield.
    You have no real role.]],
    weapons = {},
    command = "civilian",
    max = 0, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end
})

TEAM_GUN = DarkRP.createJob("Gun Dealer", {
    color = Color(0, 176, 80, 255),
    model = {"models/player/hostage/hostage_01.mdl",
            "models/player/hostage/hostage_04.mdl"
    },
    description = [[You sell affordable guns at modest prices.
    Set up a little kiosk somewhere on the battlefield.]],
    weapons = {},
    command = "gundealer",
    max = 4, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 2, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end
})

TEAM_SPECGUN = DarkRP.createJob("Special Gun Dealer", {
    color = Color(0, 176, 80, 255),
    model = {"models/player/hostage/hostage_02.mdl",
            "models/player/hostage/hostage_03.mdl"
    },
    description = [[You sell special guns at ridiculous prices.
    Set up a little kiosk somewhere on the battlefield.]],
    weapons = {},
    command = "specgundealer",
    max = 2, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 3, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end
})

TEAM_MINER = DarkRP.createJob("Miner", {
    color = Color(0, 176, 80, 255),
    model = {"models/player/group02/male_02.mdl",
            "models/player/group02/male_04.mdl",
            "models/player/group02/male_06.mdl",
            "models/player/group02/male_08.mdl"
    },
    description = [[You mine rocks to make money.
    It pays the bills.
	Available on:
		Advaita
		Building
		Maxims
		Progress
		Variant]],
    weapons = { "urp_pickaxe" },
    command = "miner",
    max = 4, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 4, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end,
	maps = { "gm_advaita_construct", "gm_building_construct", "gm_maxims_construct", "gm_progress_construct", "gm_variant_construct" }
})

TEAM_FISHER = DarkRP.createJob("Fisher", {
    color = Color(0, 176, 80, 255),
    model = {"models/player/group02/male_02.mdl",
            "models/player/group02/male_04.mdl",
            "models/player/group02/male_06.mdl",
            "models/player/group02/male_08.mdl"
    },
    description = [[You fish to make money.
    It pays the bills.
	Available on:
		Maeva
		Maxims
		Progress
		Variant]],
    weapons = { "st_fishingrod" },
    command = "fisher",
    max = 4, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 5, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end,
	maps = { "gm_maeva_construct", "gm_maxims_construct", "gm_progress_construct", "gm_variant_construct" }
})

TEAM_CHELL = DarkRP.createJob( "Chell", {
	color = Color( 0, 176, 80, 255 ),
	model = "models/player/p2_chell.mdl",
	description = [[You are Chell.
	You jump around and figure out how to maneuver around the map,
	but you look like an Aperture test subject.
	You also take no fall damage.]],
	weapons = {},
	command = "chell",
	max = 1,
	salary = 50,
	admin = 0,
	vote = false,
	hasLicense = false,
	category = "Citizens",
	sortOrder = 6,
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end
})

TEAM_GMAN = DarkRP.createJob("The G-Man", {
    color = Color(0, 0, 0, 255),
    model = "models/player/gman_high.mdl",
    description = [[You are the G-Man.
    You know what to do.]],
    weapons = {},
    command = "gman",
    max = 1, -- at most 70% of the players can have this job. Set to a whole number to set an absolute limit.
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "???", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 1, -- The position of this thing in its category. Lower number means higher up.
    PlayerLoadout = function(ply) ply:SetHealth( 150 ) ply:SetArmor( 0 ) ply:SetMaxHealth( 150 ) return false end,
    customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:29801505" end,
    CustomCheckFailMsg = "You are not worthy..."
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CIVIE
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
--DarkRP.addHitmanTeam(TEAM_MOB)
