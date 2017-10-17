require 'pry'

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

    def move(board=Board.new)
      first_precedent_moves = []
      second_precedent_moves = []
      move = 0
      computer_token = self.token
      if computer_token == "X"
        enemy_token = "O"
      else
        enemy_token = "X"
      end

      WIN_COMBINATIONS.each do |win_combos|
        if board.cells[win_combos[0]] == computer_token && board.cells[win_combos[1]] == computer_token && board.cells[win_combos[2]] == " "
          first_precedent_moves << win_combos[2]
        end
        if board.cells[win_combos[0]] == computer_token && board.cells[win_combos[2]] == computer_token && board.cells[win_combos[1]] == " "
          first_precedent_moves << win_combos[1]
        end
        if board.cells[win_combos[1]] == computer_token && board.cells[win_combos[2]] == computer_token && board.cells[win_combos[0]] == " "
          first_precedent_moves << win_combos[0]
        end
        if board.cells[win_combos[0]] == enemy_token && board.cells[win_combos[1]] == enemy_token && board.cells[win_combos[2]] == " "
          second_precedent_moves << win_combos[2]
        end
        if board.cells[win_combos[0]] == enemy_token && board.cells[win_combos[2]] == enemy_token && board.cells[win_combos[1]] == " "
          second_precedent_moves << win_combos[1]
        end
        if board.cells[win_combos[1]] == enemy_token && board.cells[win_combos[2]] == enemy_token && board.cells[win_combos[0]] == " "
          second_precedent_moves << win_combos[0]
        end
      end

      if first_precedent_moves.size > 0
        move = first_precedent_moves.sample
      elsif first_precedent_moves.size == 0 && second_precedent_moves.size > 0
        move = second_precedent_moves.sample
      else
        while board.valid_move?(move+1) == false
          move = rand(1..9)
        end
      end

      move += 1
      move.to_s
    end
  end
end
