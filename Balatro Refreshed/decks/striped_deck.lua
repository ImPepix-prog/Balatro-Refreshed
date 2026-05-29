
SMODS.Back {
    key = 'striped_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Striped Deck',
        text = {
            [1] = '{C:blue}+3{} Hands, lose all {C:red}Discards{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 3
        G.GAME.starting_params.hands = 0
    end
}