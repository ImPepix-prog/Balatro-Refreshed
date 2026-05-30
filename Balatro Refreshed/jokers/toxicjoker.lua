
SMODS.Joker{ --Toxic Joker
    key = "toxicjoker",
    config = {
        extra = {
            odds = 2,
            pb_h_mult_f1bc673a = 3
        }
    },
    loc_txt = {
        ['name'] = 'Toxic Joker',
        ['text'] = {
            [1] = 'Scoring cards have a {C:green}1 in 2{} chance of',
            [2] = 'giving {C:red}+3{} Mult while held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_toxicjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d27fc866', 1, card.ability.extra.odds, 'j_Refreshed_toxicjoker', false) then
                    context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult or 0
                    context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult + 3
                    SMODS.calculate_effect({extra = { message = "Upgraded!", colour = G.C.MULT }, card = card}, card)
                end
            end
        end
    end
}