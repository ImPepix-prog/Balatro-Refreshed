
SMODS.Joker{ --Divorce Papers
    key = "divorcepapers",
    config = {
        extra = {
            odds = 2,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Divorce Papers',
        ['text'] = {
            [1] = 'Played {C:attention}Kings {}or {C:attention}Queens{}',
            [2] = 'have a {C:green}1 in 2{} chance of giving {C:money}5${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_divorcepapers') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 12) and (context.other_card:get_id() == 12) then
                if SMODS.pseudorandom_probability(card, 'group_0_7149e9ab', 1, card.ability.extra.odds, 'j_Refreshed_divorcepapers', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 5
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Divorced!", colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }