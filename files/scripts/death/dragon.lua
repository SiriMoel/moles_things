dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity = GetUpdatedEntityID()
	local x, y = EntityGetTransform(entity)

	EntityLoad("mods/tales_of_kupoli/files/entities/revived/_tablets/dragon.xml", x, y)

	EntityLoad("mods/tales_of_kupoli/files/entities/items/dragonwand/weapon.xml", x, y)
end