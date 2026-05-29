
SMODS.Joker{ --Medicine
    key = "medicine",
    config = {
        extra = {
            MedicineXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Medicine',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.2{} Mult',
            [2] = 'for every scoring heart',
            [3] = 'resets if any other suit is scored',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1# {} {C:inactive}Mult){}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MedicineXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_suit("Hearts") then
                card.ability.extra.MedicineXMult = (card.ability.extra.MedicineXMult) + 0.2
            elseif not (context.other_card:is_suit("Hearts")) then
                card.ability.extra.MedicineXMult = 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.MedicineXMult
            }
        end
    end
}