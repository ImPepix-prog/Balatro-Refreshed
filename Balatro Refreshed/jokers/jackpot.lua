
SMODS.Joker{ --Jackpot
    key = "jackpot",
    config = {
        extra = {
            dollars0 = 1,
            odds = 7,
            xmult0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Jackpot',
        ['text'] = {
            [1] = 'Played 7s have a {C:green}1 in 7{} chance of giving {X:red,C:white}x7mult{} and {C:money}7${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_jackpot') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 7 then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_91e852e3', 1, card.ability.extra.odds, 'j_Refreshed_jackpot', false) then
                            SMODS.calculate_effect({Xmult = 7}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}