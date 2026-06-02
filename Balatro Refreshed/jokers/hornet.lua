
SMODS.Joker{ --Hornet
    key = "hornet",
    config = {
        extra = {
            HornetXmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hornet',
        ['text'] = {
            [1] = 'this joker gains {X:mult,C:white}X0.2{} Mult',
            [2] = 'for every discard {C:inactive}(Currrently{}{X:mult,C:white} x#1# {} {C:inactive}Mult){}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.HornetXmult}}
    end,
    
    calculate = function(self, card, context)
        if context.pre_discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.HornetXmult = (card.ability.extra.HornetXmult) + 0.2
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.HornetXmult
            }
        end
    end
}