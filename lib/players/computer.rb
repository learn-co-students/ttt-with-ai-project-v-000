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

    #binding.pry

    def last_move(board, player_token)
      WIN_COMBINATIONS.detect do |winning_combo|
        if winning_combo.select {|cell| board.cells[cell] == player_token}.count == 2
          #binding.pry
          winning_num = winning_combo.detect {|index| board.cells[index] == " "}
          return (winning_num+1) if winning_num != nil
          #   return winning_num+1
          # return (winning_combo.detect {|index| board.cells[index] == " "}+1)
        end
      end
      return false
    end

    def op_player
      self.token == "X" ? "O" : "X"
    end

    def move(board)
      case
      when self.last_move(board,self.token) != false
        #when 2 current_player tokens are in a row, select third option
        self.last_move(board, self.token)

      when self.last_move(board, op_player) != false
        #when 2 op_player tokens are in a row, select third option
        self.last_move(board,op_player)

      when board.cells.all? {|cell| cell == " "}
        "5"
      else
        "8"
      end

    end


  end
end
