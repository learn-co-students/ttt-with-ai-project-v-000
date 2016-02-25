class Player::Computer < Player
    
    def move(board)
        return find_winning_cell(board, "O") if find_winning_cell(board, "O") != nil
        return find_winning_cell(board, "X") if find_winning_cell(board, "X") != nil
        return random_move(board)
    end
      
      def find_winning_cell(board, mark)
        return find_cell(board, mark) if find_cell(board, mark) != nil
        return nil
      end
    
    def random_move(board)
      while(true)
        trial_number = rand(9) + 1
        if board.cells[trial_number-1] == nil
          return trial_number
        end
      end
    end
    
    def find_cell(board, mark)
        Game::WIN_COMBINATIONS.each do |array|
          define_permutation(array[0], array[1], array[2]).each do |item|
            return item[2] if it_finds_a_winning_triple(board, mark, item[0], item[1], item[2])
          end
        end
        return nil
    end
      
      def define_permutation(cell_one, cell_two, cell_three)
        return [cell_one, cell_two, cell_three].permutation.to_a
      end

    def it_finds_a_winning_triple(board, mark, filled_spot_one, filled_spot_two, potential_move)
      if board.cells[filled_spot_one-1] == mark && board.cells[filled_spot_two-1] == mark && spot_is_empty?(board, potential_move-1)
        return true
      else
        return false
      end
    end
    
    def spot_is_empty?(board, position)
      ["X", "O"].each do |mark|
        return false if board.cells[position] == mark
      end
      return true
    end
end
    
