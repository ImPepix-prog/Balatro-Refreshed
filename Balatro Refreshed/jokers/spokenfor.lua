
SMODS.Joker{ --Spoken for
    key = "spokenfor",
    config = {
        extra = {
            xmult0 = 3,
            xmult = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Spoken for',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult if played hand',
            [2] = 'doesnt contain a face card',
            [3] = 'otherwise {X:red,C:white}X0.75{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                return {
                    Xmult = 3
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                return {
                    Xmult = 0.75
                }
            end
        end
    end
}