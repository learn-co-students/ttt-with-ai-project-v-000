module Players
  class Computer < Player
    def move(board)
      win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      moves = ["5", "1", "3", "7", "9", "4", "6", "2", "8"]
      other_token = token == "X" ? "O" : "X"

      puts "YOUR TURN, PLAYER #{token}."
      puts "Enter a number between 1 and 9."
      board.display

      winners = win_combinations.detect {|combo|
        combo.count { |cell| board.cells[cell] == token } == 2
      }

      blockers = win_combinations.detect {|combo|
        combo.count { |cell| board.cells[cell] == other_token } == 2
      }

      if winners != nil
        winning_move = winners.detect { |cell| board.cells[cell] == " " }
        if board.valid_move?(winning_move.to_i + 1)
          return winning_move + 1
        end
      end

      if blockers != nil
        blocking_move = blockers.detect { |cell| board.cells[cell] == " " }
        if board.valid_move?(blocking_move.to_i + 1)
          return blocking_move + 1
        end
      end
      moves.detect { |move| board.valid_move?(move) }
    end
  end
end
