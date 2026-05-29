
SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            StaticMult = 0,
            FUCK = 0,
            discardsusedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = 'this joker gains {C:red}+3{} Mult',
            [2] = 'for each hand played',
            [3] = 'without discarting {C:inactive}(Currrently {}{C:red}+#1# {}{C:inactive}Mult){}.'
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.StaticMult, card.ability.extra.FUCK, (G.GAME.current_round.discards_used or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.StaticMult
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.FUCK or 0)) <= to_big(G.GAME.current_round.discards_used) then
            else
                return {
                    func = function()
                        card.ability.extra.FUCK = G.GAME.current_round.discards_used
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.StaticMult = (card.ability.extra.StaticMult) + 3
                            return true
                        end,
                        message = "Upgrade!",
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}