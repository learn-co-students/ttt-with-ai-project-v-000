module Players
  class Computer < Players
    # - AI Logic -
    # 1. Check to see if the computer has a winning combo with two tokens and one empty space
    # --> If yes: put the token in the empty space
    # 2. Check to see if the opponent has a winning combo with two tokens and one empty space
    # --> If yes: put the token in the empty space
    # 3. Else, check if the middle space is open
    # 4. Else, check if a corner space is open
    # 5. Else, choose another space at random

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    def move(board)
      @board = board
      set_tokens
      check_for_winning_move
      block_opponent


      # This method will return the move number
      # New method for checking your board tokens
      # New method for checking opponents board tokens
      # New method for middle, corners, and other spaces
    end

    def set_tokens
      if self.token == "X"
        @my_token = "X"
        @opponent_token = "O"
      else
        @my_token = "O"
        @opponent_token = "X"
      end
    end

    def check_for_winning_move
      WIN_COMBINATIONS.each do |win_combo|
        position_1 = @board.cells[win_combo[0]]
        position_2 = @board.cells[win_combo[1]]
        position_3 = @board.cells[win_combo[2]]

        if (position_1 == @my_token && position_2 == @my_token && position_3 == " ")
          return win_combo[2]
        elsif (position_1 == @my_token && position_2 == " " && position_3 == @my_token)
          return win_combo[1]
        elsif (position_1 == " " && position_2 == @my_token && position_3 == @my_token)
          return win_combo[0]
        end
            
      end
    end

    def block_opponent
      WIN_COMBINATIONS.each do |win_combo|
        position_1 = @board.cells[win_combo[0]]
        position_2 = @board.cells[win_combo[1]]
        position_3 = @board.cells[win_combo[2]]

        return win_combo if ((position_1 == @my_token && position_2 == @my_token && position_3 == " ") ||
                             (position_1 == @my_token && position_2 == " " && position_3 == @my_token) ||
                             (position_1 == " " && position_2 == @my_token && position_3 == @my_token))
      end
    end


  end
end
