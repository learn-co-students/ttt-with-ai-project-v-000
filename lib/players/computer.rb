require 'pry'
module Players
  class Computer < Player

    def move(board)
      win?(WIN_COMBINATIONS, board.cells)
    end

    def block?(win_cond, board)
      move = 0
      self.token == "X" ? opponent = "O" : opponent = "X"
      if winning_combo = win_cond.find { |combo|
        if [board[combo[0]], board[combo[1]]].all? {|pos| pos == opponent } && board[combo[2]] == " "
          3.to_s
        elsif [board[combo[0]], board[combo[2]]].all? {|pos| pos == opponent } && board[combo[1]] == " "
          2.to_s
        elsif [board[combo[1]], board[combo[2]]].all? {|pos| pos == opponent } && board[combo[0]] == " "
          1.to_s
        end
        }
        (winning_combo[move] + 1).to_s
      elsif [board[0], board[2], board[6], board[8]].any? {|pos| pos == " "}
        corners = [board[0], board[2], board[6], board[8]]
        move = corners.find_index {|i| i == " "}
        if move == 0
          puts "moving to a corner"
          1.to_s
        elsif move == 1
          puts "moving to a corner"
          3.to_s
        elsif move == 2
          puts "moving to a corner"
          7.to_s
        elsif move == 3
          puts "moving to a corner"
          # binding.pry
          9.to_s
        end
      else
        rand(1..8).to_s
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
      # binding.pry
      winning_combo = []
      turn_move = 0
      winning_combo = win_cond.find do |combo|
        # binding.pry
        ([board[combo[0]], board[combo[1]]].all? { |position| position == self.token } && board[combo[2]] == " ") ||
        ([board[combo[1]], board[combo[2]]].all? { |position| position == self.token } && board[combo[0]] == " ") ||
        ([board[combo[0]], board[combo[2]]].all? { |position| position == self.token } && board[combo[1]] == " ")
      end
      if winning_combo != nil
        # binding.pry
        turn_move = winning_combo.find { |pos| board[pos] == " " }
        # binding.pry
        (turn_move += 1).to_s
      else
        corners(win_cond, board)
      end
    end
  end
end
