require 'pry'

module Players
  class Computer < Player
    attr_accessor :board
    def available_positions(board)
      valid_moves = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          valid_moves << "#{index + 1}"
        end
      end
      valid_moves
    end

    def move(board)

      move_to = nil
      #We are "O"

      #check to see if it's the first turn or the middle space is open, if it is - move to that space
      if board.turn_count == 1 || !board.taken?(5)
        move_to = "5"
      else
        #check to see if there are two of the same tokens next to eachother for a winning combination
        block_combo = Game::WIN_COMBINATIONS.detect do|combo|
          combo.count { |x| x == "X"} == 2 || combo.count { |x| x == "X"} == 2
        end

        #if there are two tokens next to eachother, move to that space, if not move to a random available position
        if block_combo != nil
          move_to = block_combo.include(" ")
        else
          postion = available_positions(board).sample(1)
          move_to = postion[0]
        end

      end
    end

  end
end
