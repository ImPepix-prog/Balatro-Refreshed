SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/lazyjoker.lua"))()
    assert(SMODS.load_file("jokers/jackpot.lua"))()
    assert(SMODS.load_file("jokers/jokerapp.lua"))()
    assert(SMODS.load_file("jokers/yoyleland.lua"))()
    assert(SMODS.load_file("jokers/hornet.lua"))()
    assert(SMODS.load_file("jokers/machinelove.lua"))()
    assert(SMODS.load_file("jokers/toxicjoker.lua"))()
    assert(SMODS.load_file("jokers/monitoring.lua"))()
    assert(SMODS.load_file("jokers/static.lua"))()
    assert(SMODS.load_file("jokers/spokenfor.lua"))()
    assert(SMODS.load_file("jokers/hitomaniac.lua"))()
    assert(SMODS.load_file("jokers/feverdream.lua"))()
    assert(SMODS.load_file("jokers/nerdjoker.lua"))()
    assert(SMODS.load_file("jokers/duality.lua"))()
    assert(SMODS.load_file("jokers/pngjoker.lua"))()
    assert(SMODS.load_file("jokers/medicine.lua"))()
    assert(SMODS.load_file("jokers/monitoringbestfriendedition.lua"))()
end
-- load the decks
if true then
    assert(SMODS.load_file("decks/doodle_deck.lua"))()
end

SMODS.ObjectType({
    key = "Refreshed_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_mycustom_jokers",
    cards = {
        ["j_Refreshed_lazyjoker"] = true,
        ["j_Refreshed_jackpot"] = true,
        ["j_Refreshed_jokerapp"] = true,
        ["j_Refreshed_yoyleland"] = true,
        ["j_Refreshed_hornet"] = true,
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_toxicjoker"] = true,
        ["j_Refreshed_monitoring"] = true,
        ["j_Refreshed_static"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_feverdream"] = true,
        ["j_Refreshed_nerdjoker"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_Refreshed_jokers",
    cards = {
        ["j_Refreshed_duality"] = true,
        ["j_Refreshed_pngjoker"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_monitoringbestfriendedition"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end