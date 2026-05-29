
SMODS.Joker{ --Monitoring Best Friend Edition
    key = "monitoringbestfriendedition",
    config = {
        extra = {
            MonitoringBestFriendEditiXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Monitoring Best Friend Edition',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.5{} Mult',
            [2] = 'when a king or jack is scored',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1# {} {C:inactive}Mult){}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
            or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MonitoringBestFriendEditiXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (context.other_card:get_id() == 11 or context.other_card:get_id() == 13) then
                card.ability.extra.MonitoringBestFriendEditiXMult = (card.ability.extra.MonitoringBestFriendEditiXMult) + 0.5
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.MonitoringBestFriendEditiXMult
            }
        end
    end
}