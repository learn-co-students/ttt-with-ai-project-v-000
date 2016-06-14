require 'pry'

class Player::Computer < Player
    
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

    def move(board)
        if board.turn_count == 0 || board.turn_count == 1
            if board.valid_move?("5")
                return "5"
            elsif [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.length > 0
                [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.sample.to_s
            end
        else
            to_win = WIN_COMBINATIONS.dup.select {|combo| combo.reject! {|space| board.cells[space] == self.token && board.cells[space] != " "}}
            to_block = WIN_COMBINATIONS.dup.select {|combo| combo.reject! {|space| board.cells[space] != self.token && board.cells[space] != " "}}
             
            
            binding.pry
            if to_win.any? {|combo| combo.length == 1}
                to_win = to_win.find {|combo| combo.length == 1}
                return (to_win[0] + 1).to_s
            elsif to_block.any? {|combo| combo.length == 1}
                to_block = to_block.find {|combo| combo.length == 1}
                return (to_block[0] + 1).to_s
            else
                return rand(9).to_s
            end
        end
    end
end
