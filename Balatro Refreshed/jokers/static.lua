
SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            StaticMult = 0,
            basediscardsperround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = 'this joker gains {C:red}+3{} Mult',
            [2] = 'for each hand played',
            [3] = 'without discarting {C:inactive}(Currrently {C:red}+#1#{} {C:inactive} Mult){}'
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
    pools = { ["Refreshed_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.StaticMult, (G.GAME.round_resets.discards or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.discards_left) >= to_big(G.GAME.round_resets.discards) then
                card.ability.extra.StaticMult = (card.ability.extra.StaticMult) + 3
                return {
                    mult = card.ability.extra.StaticMult
                }
            else
                return {
                    mult = card.ability.extra.StaticMult
                }
            end
        end
    end
}