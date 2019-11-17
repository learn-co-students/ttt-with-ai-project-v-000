module Players
  class Computer < Player
    attr_accessor :move

    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # Left column
      [1,4,7],  # Middle column
      [2,5,8],  # Right row
      [0,4,8],  # First diagonal
      [2,4,6]  # Second diagonal
    ]

    def move(board)
      @status = false
      @move_made=""
      empty_cells = empty_moves(board)
      number_of_moves_left = empty_cells.count
      if self.token == "X"
        other_player_token = "O"
      else
        other_player_token = "X"
      end

      if empty_cells.include?(4) #takes center block if it can
        @move_made = "5"
      else
        if @status == false
          check_winning_combinations(self.token, board)
        end #if end
        if @status == false
          check_winning_combinations(other_player_token, board)
        end #if end

        if @status == false
          check_winning_combinations(" ", board)
        end

        if @status == false #selects random if all else fails
          @move_made = empty_cells[rand(0..number_of_moves_left-1)]+1
          @status = true
          @move_made.to_s
        end
      end #else end
      @move_made
    end #move end

    def check_winning_combinations(token_to_check, board)
      WIN_COMBINATIONS.each do |combination|
        if @status == false
          by_player_moves = Hash.new 0
          combination.each do |combo|
            by_player_moves[board.cells[combo]] += 1
          end # do end

          if by_player_moves[token_to_check] == 2
            row = []
            row = [board.cells[combination[0]],board.cells[combination[1]],board.cells[combination[2]]]
            if row.find_index(" ")
              if token_to_check == (" ")
                row_index = row.find_index(" ")
                if row_index != 1 || 3 || 7 || 9 #pick corner
                  row[row_index] = "N"
                  row.find_index(" ")
                end
              end
              @move_made = combination[row.find_index(" ")]+1
              @status = true
              @move_made = @move_made.to_s
            end #if end
          end # if by_player end
        end # if status end
      end # do end
    end



    def empty_moves(board)
      array = []
      index = 0
      board.cells.each do |i|
        if i == " "
          array.push(index)
        end
        index+=1
      end
      array
    end

  end

end
