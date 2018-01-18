require 'pry'

class Player::Computer < Player
    
    def win_combos
        @win_combos = [
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

    def move(board)
        if board.turn_count == 0 || board.turn_count == 1
            if board.valid_move?("5")
                return "5" if board.valid_move?("5")
            elsif [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.length > 0
                [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.sample.to_s
            end
        elsif board.turn_count > 1 && board.turn_count < 8
            to_win = self.win_combos.dup.select {|combo| combo.reject! {|space| board.cells[space] == self.token}}
            to_block = self.win_combos.dup.select {|combo| combo.reject! {|space| board.cells[space] == self.opp_token}}
             
            if to_win.any? {|combo| combo.length == 1}
                to_win = to_win.find {|combo| combo.length == 1}
                return (to_win[0] + 1).to_s if board.valid_move?((to_win[0] + 1).to_s)
            elsif to_block.any? {|combo| combo.length == 1}
                to_block = to_block.find {|combo| combo.length == 1}
                return (to_block[0] + 1).to_s if board.valid_move?((to_block[0] + 1).to_s)
            end
            
            return rand(9).to_s if board.valid_move?(rand(9).to_s)
            move(board) 
        elsif board.turn_count == 8 
            last_index = 0
            board.cells.each_with_index{|cell, index| last_index = index if cell == " "}
            return (last_index + 1).to_s
        end
    end
end
