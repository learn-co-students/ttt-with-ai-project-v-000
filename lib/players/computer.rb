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
        cell == player_token
      end
    end

    def sides(board, player_token)
      sides = {board.cells[1] => 1, board.cells[3] => 3, board.cells[5] => 5, board.cells[7] => 7}
      #sides = [board.cells[1], board.cells[3], board.cells[5], board.cells[7]]
      sides.keys.detect.with_index do |cell, index|
        cell == player_token
        return sides.values[index]
      end
    end

    def move(board)
      binding.pry
      case
      when self.last_move(board,self.token) != false
        #1. when 2 current_player tokens are in a row, select third option
        self.last_move(board, self.token)

      when self.last_move(board, op_player) != false
        #2. when 2 op_player tokens are in a row, select third option
        self.last_move(board,op_player)

      when board.turn_count == 1 && corner(board, op_player)
        #5. If 2nd move, CPU plays middle
        "5"
      when board.cells.all? {|cell| cell == " "}
        #If CPU first player, select top left
        "1"

      when corner(board, " ")
        #7. If empty corner, CPU plays empty corner square
        corner(board, " ")

      when sides(board, " ")
        #8. If empty sides, CPU plays empty middle square
        sides(board, " ")
      else
        "8"
      end

    end


  end
end
