
SMODS.Joker{ --M Joker
    key = "mjoker",
    config = {
        extra = {
            MJokerMult = 0,
            MJokerChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'M Joker',
        ['text'] = {
            [1] = 'this joker gains {C:blue}+15{} Chips and {C:red}+2{} Mult',
            [2] = 'for every played hand containing a pair',
            [3] = '{C:inactive}(Currently {}{C:blue}+#2# {}{C:inactive}Chips{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
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
        
        return {vars = {card.ability.extra.MJokerMult, card.ability.extra.MJokerChips}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Pair"]) then
                return {
                    func = function()
                        card.ability.extra.MJokerMult = (card.ability.extra.MJokerMult) + 2
                        return true
                    end,
                    message = "Upgrade!",
                    extra = {
                        func = function()
                            card.ability.extra.MJokerChips = (card.ability.extra.MJokerChips) + 15
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.MJokerChips,
                extra = {
                    mult = card.ability.extra.MJokerMult
                }
            }
        end
    end
}