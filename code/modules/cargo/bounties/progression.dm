/datum/bounty/item/progression
	var/list/unlocked_crates = list()

/datum/bounty/progression/reward_string()
	return "[reward] Credits and clearance to order new crates"

/datum/bounty/item/progression/claim(mob/user)
	..()
	for(var/i in unlocked_crates)
		var/datum/supply_pack/to_unlock = SSshuttle.supply_packs[i]
		to_unlock.special_enabled = TRUE

/datum/bounty/item/progression/mining_basic
	name = "Common Mineral Prospecting"
	description = "Basic materials are worth pocket change, but are integral for station longevity. Ship us any 20 sheets of gold, uranium, or silver to certify your mining program as \"functional\""
	reward = 5000
	required_count = 20
	wanted_types = list(/obj/item/stack/sheet/mineral/silver,/obj/item/stack/sheet/mineral/gold,/obj/item/stack/sheet/mineral/uranium)
	unlocked_crates = list(/datum/supply_pack/clearance/ka_damage,/datum/supply_pack/clearance/ka_cooldown,/datum/supply_pack/clearance/ka_range)

/datum/bounty/item/progression/mining_basic/reward_string()
	return "[reward] Credits and clearance to order basic kinetic accelerator modification crates"

/datum/bounty/item/progression/mining_plasma
	name = "Plasma Extraction"
	description = "The reason you're here: plasma. Ship us 20 sheets of it and we can certify your mining program as \"profitable\", allowing access to plasma-based mining equipment."
	reward = 4000
	wanted_types = list(/obj/item/stack/sheet/mineral/plasma)
	required_count = 20
	unlocked_crates = list(/datum/supply_pack/clearance/plasmacutter)

/datum/bounty/item/progression/mining_plasma/reward_string()
	return "[reward] Credits and clearance to order plasmacutters"

/datum/bounty/item/progression/mining_advanced
	name = "Strange Material Prospecting"
	description = "Initial scanning of your mining locale showed anomalous readings in line with that of bluespace crystals. ship us five to confirm their presence and we'll allow you to order a special treat."
	reward = 15000
	required_count = 5
	wanted_types = list(/obj/item/stack/sheet/bluespace_crystal, /obj/item/stack/ore/bluespace_crystal) //we'll let them send artficial crystals since those would require department cooperation or shooting swarmers
	unlocked_crates = list(/datum/supply_pack/clearance/plasmacutter_advanced)

/datum/bounty/item/progression/mining_advanced/reward_string()
	return "[reward] Credits and clearance to order high quality mining gear"
