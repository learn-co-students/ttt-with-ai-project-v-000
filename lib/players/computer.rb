require 'pry'
module Players
  class Computer < Player

    def move(board)
      # binding.pry
      if self.token == "X" && (board.cells.find_all {|pos| pos == self.token}.length == 0 || board.cells.find_all {|pos| pos == self.token}.length == 1)
        rand(1..8).to_s
      else
        win?(WIN_COMBINATIONS, board.cells)
      end
    end

    def block?(win_cond, board)
      winning_combo = []
      turn_move = 0
      self.token == "X" ? opponent = "O" : opponent = "X"
      winning_combo = win_cond.find do  |combo|
        ([board[combo[0]], board[combo[1]]].all? { |position| position == opponent } && board[combo[2]] == " ") ||
        ([board[combo[1]], board[combo[2]]].all? { |position| position == opponent } && board[combo[0]] == " ") ||
        ([board[combo[0]], board[combo[2]]].all? { |position| position == opponent } && board[combo[1]] == " ")
      end
      if winning_combo != nil
        turn_move = winning_combo.find { |pos| board[pos] == " " }
        (turn_move += 1).to_s
      else
        corners(win_cond, board)
      end
    end

    def corners(win_cond, board)
      turn_move = 0
      corners = [board[0], board[2], board[6], board[8]]
      if board.find_all { |pos| pos == " "}.length == 1
        turn_move = board.find_index { |pos| pos == " "}
        (turn_move + 1).to_s
      elsif corners.any? { |pos| pos == " " }
          turn_move = corners.find_index { |i| i == " " }
          if turn_move == 0
            puts "moving to a corner"
            1.to_s
          elsif turn_move == 1
            puts "moving to a corner"
            3.to_s
          elsif turn_move == 2
            puts "moving to a corner"
            7.to_s
          elsif turn_move == 3
            puts "moving to a corner"
            9.to_s
          end
        else
          rand(1..8).to_s
        end
    end

    def win?(win_cond, board)
      turn_move = 0
      winning_combo = win_cond.find do |combo|
        ([board[combo[0]], board[combo[1]]].all? { |position| position == self.token } && board[combo[2]] == " ") ||
        ([board[combo[1]], board[combo[2]]].all? { |position| position == self.token } && board[combo[0]] == " ") ||
        ([board[combo[0]], board[combo[2]]].all? { |position| position == self.token } && board[combo[1]] == " ")
      end
      if winning_combo != nil
        turn_move = winning_combo.find { |pos| board[pos] == " " }
        (turn_move += 1).to_s
      else
        block?(win_cond, board)
      end
    end
  end
end
