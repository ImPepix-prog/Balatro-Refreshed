
SMODS.Joker{ --Nerd Joker
    key = "nerdjoker",
    config = {
        extra = {
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Nerd Joker',
        ['text'] = {
            [1] = '{C:red}+20{} Mult if played hand only contains aces'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count == #context.full_hand
            end)() then
                return {
                    mult = 20
                }
            end
        end
    end
}