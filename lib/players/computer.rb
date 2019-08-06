module Players
  class Computer < Player
    def winning_move(token, board)
      winning_moves_options = [
      ["#{board.cells[0]}", "#{board.cells[1]}", "#{board.cells[2]}"],
      ["#{board.cells[3]}", "#{board.cells[4]}", "#{board.cells[5]}"],
      ["#{board.cells[6]}", "#{board.cells[7]}", "#{board.cells[8]}"],
      ["#{board.cells[0]}", "#{board.cells[3]}", "#{board.cells[6]}"],
      ["#{board.cells[1]}", "#{board.cells[4]}", "#{board.cells[7]}"],
      ["#{board.cells[2]}", "#{board.cells[5]}", "#{board.cells[8]}"],
      ["#{board.cells[0]}", "#{board.cells[4]}", "#{board.cells[8]}"],
      ["#{board.cells[2]}", "#{board.cells[4]}", "#{board.cells[6]}"]
      ]
      winning_move_combo = winning_moves_options.detect {|combo| combo.count(token) == 2 && combo.include?(" ")}
      winning_move_combo_index = winning_moves_options.index(winning_move_combo)
      case winning_move_combo_index
      when 0
       winning_move = winning_move_combo.index(" ") + 1
      when 1
       winning_move = winning_move_combo.index(" ") + 4
      when 2
       winning_move = winning_move_combo.index(" ") + 7
      when 3
       winning_move = winning_move_combo.index(" ")
       case winning_move
       when 0
        winning_move = 1
       when 1
        winning_move = 4
       when 2
        winning_move = 7
       end
      when 4
       winning_move = winning_move_combo.index(" ")
       case winning_move
       when 0
        winning_move = 2
       when 1
        winning_move = 5
       when 2
        winning_move = 8
       end
      when 5
       winning_move = winning_move_combo.index(" ")
       case winning_move
       when 0
        winning_move = 3
       when 1
        winning_move = 6
       when 2
        winning_move = 9
       end
      when 6
       winning_move = winning_move_combo.index(" ")
       case winning_move
       when 0
        winning_move = 1
       when 1
        winning_move = 5
       when 2
        winning_move = 9
       end
      when 7
       winning_move = winning_move_combo.index(" ")
       case winning_move
       when 0
        winning_move = 3
       when 1
        winning_move = 5
       when 2
        winning_move = 7
       end
      end
      winning_move
    end

    def move(board)
      token_self = self.token
      if token_self == "X"
        token_opp = "O"
      else
        token_opp = "X"
      end
      if winning_move(token_self, board) != nil
        winning_move(token_self, board)
      elsif winning_move(token_opp, board) != nil
        winning_move(token_opp, board)
      else
        valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        move = valid_moves.sample
        if board.valid_move?(move)
          move
        end
      end
    end
  end
end
