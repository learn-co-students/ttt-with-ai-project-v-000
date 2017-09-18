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

    def move_with_one(board, player_token)
      WIN_COMBINATIONS.detect do |winning_combo|
        if winning_combo.select {|cell| board.cells[cell] == player_token}.count == 1 && winning_combo.select {|cell| board.cells[cell] == " "}.count == 2
          winning_num = winning_combo.detect {|index| board.cells[index] == " "}
          return (winning_num+1) if winning_num != nil
        end
      end
      return false
    end

    def op_player
      self.token == "X" ? "O" : "X"
    end

    def op_corner(board, player_token)
      corners = {0 => board.cells[0], 2 => board.cells[2], 6 => board.cells[6], 8 => board.cells[8]}
      if corners.values.all? { |cell| cell == " "  }
        return 1
      elsif corners.values[0] == player_token && corners.values[3] == " "
        return 9
      elsif corners.values[3] == player_token && corners.values[0] == " "
        return 1
      elsif corners.values[1] == player_token && corners.values[2] == " "
        return 7
      elsif corners.values[2] == player_token && corners.values[1] == " "
        return 3
      else
        return false
      end
    end

    def corner(board, player_token)
      corners = {0 => board.cells[0], 2 => board.cells[2], 6 => board.cells[6], 8 => board.cells[8]}

      corners.values.each_with_index do |cell, index|
        return corners.keys[index] if cell == player_token
      end
      return false
    end

    def sides(board, player_token)
      sides = {1 => board.cells[1], 3 => board.cells[3], 5 => board.cells[5], 7 => board.cells[7]}

      sides.values.each_with_index do |cell, index|
        if cell == player_token
          return sides.keys[index]
        end
      end
      return false
    end

    def move(board)
      if self.last_move(board,self.token) != false
        #1. when 2 current_player tokens are in a row, select third option
        self.last_move(board, self.token)

      elsif self.last_move(board, op_player) != false
        #2. when 2 op_player tokens are in a row, select third option
        self.last_move(board,op_player)

      elsif board.turn_count == 1 && corner(board, op_player)
        #If 2nd move, CPU plays middle
        "5"
      elsif board.cells.all? {|cell| cell == " "}
        #If CPU first player, select top left
        "1"

      elsif self.move_with_one(board, self.token) !=false
        #3. CPU creates two in a row to force the opponent into defending
        self.move_with_one(board, self.token)
      end

      elsif board.cells[4] == " "
        #5. CPU plays middle
        "5"
      elsif self.op_corner(board, op_player)
        self.op_corner(board, op_player)

      elsif corner(board, " ")
        #7. If empty corner, CPU plays empty corner square
        (corner(board, " ")+1)

      elsif sides(board, " ")

        #8. If empty sides, CPU plays empty middle square
        (sides(board, " ")+1)
    end

  end
end
