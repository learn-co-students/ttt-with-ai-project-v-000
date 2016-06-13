class Game
    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
    [0, 1, 2], #top row, remember commas after each sub-array
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 4, 8], #diagonal left
    [6, 4, 2], #diagonal right
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8] #right column
    ]
    
end