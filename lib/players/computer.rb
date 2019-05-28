require 'pry'

module Players

  class Computer < Player

    def move(board)
      puts "Computer is thinking..."
      sleep(2)
      # FIRST TURN
      if board.turn_count == 0 && board.cells[4] == " "
        "5"
      elsif board.turn_count == 0 && board.cells[0] == " "
        "1"
      elsif board.turn_count == 0 && board.cells[2] == " "
        "3"
      elsif board.turn_count == 0 && board.cells[6] == " "
        "7"
      elsif board.turn_count == 0 && board.cells[8] == " "
        "9"
      # SECOND TURN
      elsif board.turn_count == 1 && board.cells[4] == " "
        "5"
      elsif board.turn_count == 1 && board.cells[0] == " "
        "1"
      elsif board.turn_count == 1 && board.cells[2] == " "
        "3"
      elsif board.turn_count == 1 && board.cells[6] == " "
        "7"
      elsif board.turn_count == 1 && board.cells[8] == " "
        "9"
      # THIRD TURN
      elsif board.turn_count == 2 && board.cells[4] == " "
        "5"
      elsif board.turn_count == 2 && board.cells[0] == " "
        "1"
      elsif board.turn_count == 2 && board.cells[2] == " "
        "3"
      elsif board.turn_count == 2 && board.cells[6] == " "
        "7"
      elsif board.turn_count == 2 && board.cells[8] == " "
        "9"
      # BEYOND THIRD TURN
      elsif potential_win(board).kind_of?(Array)
          i = potential_win(board).detect{|s|board.cells[s] == " "}
          (i + 1).to_s
      else
        default_move(board)
      end
    end

    def default_move(board)
      i = board.cells.find_index {|cell| cell == " "}
      (i + 1).to_s
    end

    def potential_win(board)
      Game::WIN_COMBINATIONS.find{|combo|
      (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) ||
      (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token) ||
      (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token)}
    end
  end
end
