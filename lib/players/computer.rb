require 'pry'
module Players
  class Computer < Player

    def move(board)
      computer_move = "0"
      possible_moves = available_moves(board)
      board_copy = board
      possible_moves.each_with_index do |move,index|
        #binding.pry
        board_copy.cells[move] = self.token
        if board_copy.cells.winning_board?
          move
        else
          move(board_copy)
        end
      end

      #while !board.valid_move?(computer_move)
      #  computer_move = (rand(9)+1).to_s
      #end
      computer_move
    end

    def available_moves(board)
      available_moves =[]
      board.cells.each_with_index do |cell, index|
        if cell ==" "
          available_moves.push(index)
        end
      end
      available_moves
    end


#end class & module
  end
end
