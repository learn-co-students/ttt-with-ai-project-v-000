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
      [2,4,6]
    ]

    CORNERS = [0,2,6,8]

    def move(board=nil)
      if winning_combo = self.check_mate?(board) # for the winning opp when a row or diagonal is 2/3 occupied by computer (using WIN_COMBINATIONS)
        final_move = winning_combo.detect do |cell_index|
          board.valid_move?(cell_index + 1)
        end
        final_move += 1
        final_move.to_s
      elsif defense_needed = self.defense(board) #defense for when the opponent is 2/3 in a row or diagonal
        safety = defense_needed.detect do |cell_index|
          board.valid_move?(cell_index + 1)
        end
        safety += 1
        safety.to_s
      else # for the first or second move of the game, going for corners
        index = CORNERS.detect do |corner|
          board.valid_move?(corner + 1)
        end
        index += 1
        index.to_s
      end
    end

    def check_mate?(board)
      WIN_COMBINATIONS.detect do |combo|
        board_combo = combo.collect do |index|
          board.cells[index]
        end
        board_combo.count(self.token) == 2 && board_combo.count(" ") == 1
      end
    end

    def defense(board)
      WIN_COMBINATIONS.detect do |combo|
        board_combo = combo.collect do |index|
          board.cells[index]
        end
        board_combo.count(self.token) == 0 && board_combo.count(" ") == 1
      end
    end
  end
end
