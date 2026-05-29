
SMODS.Back {
    key = 'purple_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            hand_size0 = 1
        },
    },
    loc_txt = {
        name = 'Purple Deck',
        text = {
            [1] = '{C:blue}+1{} Hand {C:red}+1{} Discard {C:attention}-1{} Handsize'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(-1)
                    return true
                end
            }))
        }
    end
}