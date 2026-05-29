
SMODS.Joker{ --Hito maniac
    key = "hitomaniac",
    config = {
        extra = {
            odds = 2,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Hito maniac',
        ['text'] = {
            [1] = 'when a post-score joker triggers {C:green}1 in 2{} chance of giving {X:mult,C:white}X1.5{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_hitomaniac') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a753fe59', 1, card.ability.extra.odds, 'j_Refreshed_hitomaniac', false) then
                    SMODS.calculate_effect({Xmult = 1.5}, card)
                end
            end
        end
    end
}