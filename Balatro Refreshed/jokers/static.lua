
SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            StaticMult = 0,
            StaticChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = 'When a hand is played this Joker gains {C:red}+3{} Mult',
            [2] = 'when a hand is discarted this Joker gains {C:blue}+15{} Chips',
            [3] = '{C:inactive}(Currrently {}{C:red}+#1# {}{C:inactive}Mult {}{C:blue}+#2# {}{C:inactive} Chips{}'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 7,
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
            
            return {vars = {card.ability.extra.StaticMult, card.ability.extra.StaticChips}}
        end,
        
        calculate = function(self, card, context)
            if context.before and context.cardarea == G.jokers  then
                return {
                    func = function()
                        card.ability.extra.StaticMult = (card.ability.extra.StaticMult) + 3
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
            if context.pre_discard  then
                return {
                    func = function()
                        card.ability.extra.StaticChips = (card.ability.extra.StaticChips) + 15
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.StaticChips,
                    extra = {
                        mult = card.ability.extra.StaticMult
                    }
                }
            end
        end
    }