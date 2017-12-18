module Players
  class Computer < Player

    def move(board)
      board.display
      index = determine_move(board)
      puts "Computer #{self.token} selected position #{index + 1}." 
      sleep 1
      (index + 1).to_s
    end

    private
    
    def determine_move(board)
      #defense
      position_to_block = Game::WIN_COMBINATIONS.detect do |win_combination|
        opposing_positions = win_combination.find_all {|win_index| board.cells[win_index] == other_player_token }
        my_positions = win_combination.find_all {|win_index| board.cells[win_index] == self.token }
        opposing_positions.size == 2 && my_positions.size == 0
      end

      if position_to_block
        position_to_block.detect {|win_index| board.cells[win_index] != other_player_token }
      else
        #offense
        _, index = board.cells.each_with_index.detect {|x,i| x != "X" && x != "O"  }
        index
      end
    end

    def other_player_token
      self.token == "X" ? "O" : "X"
    end
  end
end