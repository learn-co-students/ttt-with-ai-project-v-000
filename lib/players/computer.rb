module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def last_move(player_token)
      WIN_COMBINATIONS.detect do |winning_combo|
        if winning.select {|cell| board.cells[cell] == player_token}.count == 2
          return winning_combo.detect {|index| board.cells[index] == " "}
        end
      end
      return false
    end

    def op_player
      self.token == "X" ? "O" : "X"
    end

    def move(board)
      case
      when self.last_move(self.token) != false
        #when 2 current_player tokens are in a row, select third option
        self.last_move(self.token)

      when self.last_move(op_player) != false
        #when 2 op_player tokens are in a row, select third option
        self.last_move(op_player)
      when board.cells.all? {|cell| cell == " "}
        "4"
      else
        "7"
      end

    end


  end
end
