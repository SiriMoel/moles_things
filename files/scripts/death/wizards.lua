dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")
dofile_once("mods/tales_of_kupoli/files/alterants.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity = GetUpdatedEntityID()
	local x, y = EntityGetTransform(entity)

    SetRandomSeed(x, y)
    math.randomseed(x, y+GameGetFrameNum())

    local numbger = 8

    local target = ""

    local pool = { "MANA_REDUCE", }

    if ModIsEnabled("grahamsperks") then
        local grahamspells = {
            "GRAHAM_MANAHEART",
            "GRAHAM_MANAHEARTBREAK",
            "GRAHAM_PASSIVES",
        }
        for i,v in ipairs(grahamspells) do
            table.insert(pool, v)
        end
        numbger = numbger - 1
    end

    if ModIsEnabled("copis_things") then
        local copispells = {
            "COPIS_THINGS_MANA_RANDOM",
            "COPIS_THINGS_MANA_EFFICENCY",
            "COPIS_THINGS_MANA_ENGINE",
            "COPIS_THINGS_MANA_DELTA",
        }
        for i,v in ipairs(copispells) do
            table.insert(pool, v)
        end
        numbger = numbger - 1
    end

    target = pool[math.random(1, #pool)]

    if math.random(1, numbger) == 3 then
        CreateItemActionEntity( target, x , y )
    end
end