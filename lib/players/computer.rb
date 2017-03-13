module Players

  #combination of all tic tac toe wins
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #third column
    [0,4,8], #1 diagonal
    [2,4,6] #2nd diagonal
  ]

  class Computer < Player

    def move(board)
      #checks for valid board and creates one if there isn't
      if board == []
        board = Board.new
      end
      #initialize opponent_token variable
      opponent_token = ""
      #checks itself for token to set the opponent_token
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end

      #iterate through win combination to check for opponent moves
      WIN_COMBINATIONS.each do |combo|
        #checks the board for opponent moves and open space to block win based on the win combinations
        #it will return the move to the open space to block the opponent win
        block_counter = 0
        empty_space = nil
        combo.each do |x|
          if board.cells[x] == opponent_token
            block_counter += 1
          end
          if board.cells[x] == " "
            empty_space = x
          end
        end
        if block_counter == 2 && empty_space != nil
          return (empty_space+1).to_s
        end
      end
      #attempts to move to the middle if opponent hasn't gone yet
      if(board.valid_move?("5"))
        return "5"
      end

      # corners = ["1", "3", "7", "9"]
      # corners.each do |x|
      #   if board.position(x) == self.token
      #
      # end
      #
      # middles = ["2", "4", "6", "8"]
      # middles.each do |x|
      #
      # end

      #if the middle is unavailable and there is no need to block win, go for an open space
      player_move = "1"
      count = 1
      9.times do
        if(!board.valid_move?(player_move))
          count = count + 1
          player_move = count.to_s
        end
      end
      return player_move
    end

  end

end
