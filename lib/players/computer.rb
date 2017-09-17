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

    def last_move(board, player_token)
      WIN_COMBINATIONS.detect do |winning_combo|
        if winning_combo.select {|cell| board.cells[cell] == player_token}.count == 2
          winning_num = winning_combo.detect {|index| board.cells[index] == " "}
          return (winning_num+1) if winning_num != nil
        end
      end
      return false
    end

    def op_player
      self.token == "X" ? "O" : "X"
    end

    def corner(board, player_token)
      corners = [board.cells[0], board.cells[2], board.cells[6], board.cells[8]]
      corners.detect do |cell|
        cell == " "
      end

    end

    def move(board)
      binding.pry
      case
      when self.last_move(board,self.token) != false
        #when 2 current_player tokens are in a row, select third option
        self.last_move(board, self.token)

      when self.last_move(board, op_player) != false
        #when 2 op_player tokens are in a row, select third option
        self.last_move(board,op_player)

      when board.turn_count == 1 && board.cells[0] == op_player
        "5"
      when board.cells.all? {|cell| cell == " "}
        "1"
      else
        "8"
      end

    end


  end
end
