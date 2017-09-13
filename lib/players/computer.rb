require 'pry'

module Players
  class Computer < Player

    def opposite
      if self.token == "X"
        return "O"
      else
        return "X"
      end
    end

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
    ]

    def enemy_progress(token, board)
      counter = 0
      progress = 0
      while counter <= 8
        if board.cells[counter] == token
          progress = progress + 1
        end
      counter = counter + 1
      end
      progress
    end


    def middle_taken_by_enemy(token, board)
      if board.cells[4] == token
        return true
      else
        return false
      end
    end

    def corner_taken_by_enemy(token, board)
      if board.cells[0] == token
        return true
      elsif board.cells[2] == token
        return true
      elsif board.cells[6] == token
        return true
      elsif board.cells[8] == token
        return true
      else
        return false
      end
    end

    def side_taken_by_enemy(token, board)
      if board.cells[1] == token
        return true
      elsif board.cells[3] == token
        return true
      elsif board.cells[5] == token
        return true
      elsif board.cells[7] == token
        return true
      else
        return false
      end
    end

    def almost_win(token, board)
      WIN_COMBINATIONS.each do |set|
        position_1 = board.cells[set[0]]
        position_2 = board.cells[set[1]]
        position_3 = board.cells[set[2]]
        if position_1 == position_2 && position_1 == token && board.not_taken(set[2] + 1) == true
          return set[2]
        elsif position_2 == position_3 && position_2 == token && board.not_taken(set[0] + 1) == true
          return set[0]
        elsif position_1 == position_3 && position_1 == token && board.not_taken(set[1] + 1) == true
          return set[1]
        else
        end
      end
      return false
    end


    def almost_lose(token, board)
      WIN_COMBINATIONS.each do |set|
        position_1 = board.cells[set[0]]
        position_2 = board.cells[set[1]]
        position_3 = board.cells[set[2]]
        if position_1 == position_2 && position_1 == token && board.not_taken(set[2] + 1) == true
          return set[2]
        elsif position_2 == position_3 && position_2 == token && board.not_taken(set[0] + 1) == true
          return set[0]
        elsif position_1 == position_3 && position_1 == token && board.not_taken(set[1] + 1) == true
          return set[1]
        else
        end
      end
      return false
    end


    def move(board)
      valid_move_array = []
      move_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      move_array.each do |option|
        if board.valid_move?(option) == true
          valid_move_array << option
        end
      end
      opposite_token = opposite

      # if the difficulty is hard
      if self.difficulty == "hard"

        # if enemy takes a non-middle space, or if this player goes first
        if board.game_progress <= 1 && board.valid_move?("5")
            return '5'

        # if enemy takes a middle space on first turn
        elsif board.game_progress <= 1 && middle_taken_by_enemy(opposite_token, board) == true
          return ['1','3','5','7'][rand(4)]

        # to make sure the computer tries to win
        elsif almost_win(self.token, board) != false
          answer = almost_win(self.token, board) + 1
          return answer.to_s

        # to make sure the computer tries to avoid losing
        elsif almost_lose(opposite_token, board) != false
          answer = almost_lose(opposite_token, board) + 1
          return answer.to_s

        # if enemy tries to win via non-corner, non-middle route
        elsif enemy_progress(opposite_token, board) == 2 && board.cells[1] == board.cells[3] && board.cells[1] == opposite_token
          return '1'
        elsif enemy_progress(opposite_token, board) == 2 && board.cells[3] == board.cells[7] && board.cells[3] == opposite_token
          return '7'
        elsif enemy_progress(opposite_token, board) == 2 && board.cells[1] == board.cells[5] && board.cells[1] == opposite_token
          return '3'
        elsif enemy_progress(opposite_token, board) == 2 && board.cells[7] == board.cells[5] && board.cells[7] == opposite_token
          return '9'

        # if enemy tries to outplay using corner and middle when opposite corner is taken by me.
        elsif enemy_progress(opposite_token, board) == 2 && corner_taken_by_enemy(opposite_token, board) == true && middle_taken_by_enemy(opposite_token, board)
          return ['1','3','7','9'][rand(4)]

        # if enemy tries to outplay using two corners.
        elsif enemy_progress(opposite_token, board) == 2 && corner_taken_by_enemy(opposite_token, board) == true
          return ['2','4','6','8'][rand(4)]

        # to keep the game moving
        else
          return valid_move_array[rand(4)]
        end

      # if the difficulty is easy
      else

        # to make sure the computer tries to win
        if almost_win(self.token, board) != false
          answer = almost_win(self.token, board) + 1
          return answer.to_s

        # to keep the game moving
        else
          length = valid_move_array.size
          return valid_move_array[rand(4)]
        end
      end
    end

  end
end
