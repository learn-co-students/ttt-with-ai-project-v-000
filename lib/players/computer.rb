module Players

  attr_accessor :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  class Computer < Player
    # your code here
    def move(board)
      @board = board
  #    for i in 1..9
  #      input = i.to_s
  #      return input if board.valid_move?(input)
  #    end
      for i in 1..9
        input = i.to_s
        if @board.valid_move?(input)
          @board.cells[i-1] = self.token
          if won?
            @board.cells[i-1] = " "
            return input
          else
            @board.cells[i-1] = " "
          end
        end
      end
      for i in 1..9
        input = i.to_s
        if @board.valid_move?(input)
          opponent_token = (self.token == "X" ? "O" : "X")
          @board.cells[i-1] = opponent_token
          if won?
            @board.cells[i-1] = " "
            return input
          else
            @board.cells[i-1] = " "
          end
        end
      end

      best_pos = [5,1,3,7,9,2,4,6,8]

        best_pos.each do |i|
          input = i.to_s
          if @board.valid_move?(input)
            sleep(0.5)
            return input
          end
        end


    end
    def won?
      WIN_COMBINATIONS.each do |win_combo|
        position_1 = @board.cells[win_combo[0]]
        position_2 = @board.cells[win_combo[1]]
        position_3 = @board.cells[win_combo[2]]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return true
        end
      end
      return false
    end
  end
end
