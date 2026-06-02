
SMODS.Seal {
    key = 'tanseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 2
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Tan seal',
        label = 'Tan seal',
        text = {
            [1] = 'When scored, {C:green}#1# in #2# {}chance of creating a',
            [2] = '{C:purple}Loteria{} card'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_a6328724', 1, card.ability.seal.extra.odds, 'j_Refreshed_tanseal', false) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'loteria', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    }