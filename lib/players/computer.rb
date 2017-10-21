
  class Player::Computer < Player

attr_accessor :valid_moves, :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      @board = board
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if board.turn_count == 0
        return "5"
      elsif board.turn_count == 1 && board.cells[4] == " "
        return "5"
      elsif board.turn_count == 1
        corner_move = self.corner
        return corner_move
      elsif
        block_move = self.blocking_move
        return block_move
      elsif
        win_game = self.winning_move
        return win_game
      elsif
        random_move = valid_moves.sample
        return random_move
      end
    end

    def opponent_token
      self.token == "X" ? "O":"X"
    end

    def winning_move
    WIN_COMBINATIONS.detect do |win|
      if (@board.cells[win[0]] == self.token && @board.cells[win[1]] == self.token) && (@board.taken?(win[2]+1) == false)
         win_move = win[2] + 1
         return "#{win_move}"
      elsif (@board.cells[win[0]] == self.token && @board.cells[win[2]] == self.token) && (@board.taken?(win[1]+1) == false)
        win_move = win[1] + 1
        return "#{win_move}"
      elsif (@board.cells[win[1]] == self.token && @board.cells[win[2]] == self.token) && (@board.taken?(win[0]+1) == false)
        win_move = win[0] + 1
        return "#{win_move}"
      end
    end
  end

  def blocking_move
    WIN_COMBINATIONS.detect do |win|
      if (@board.cells[win[0]] == opponent_token && @board.cells[win[1]] == opponent_token) && (@board.taken?(win[2]+1) == false)
         block_move = win[2] + 1
         return "#{block_move}"
      elsif (@board.cells[win[0]] == opponent_token && @board.cells[win[2]] == opponent_token) && (@board.taken?(win[1]+1) == false)
        block_move = win[1] + 1
        return "#{block_move}"
      elsif (@board.cells[win[1]] == opponent_token && @board.cells[win[2]] == opponent_token) && (@board.taken?(win[0]+1) == false)
        block_move = win[0] + 1
        return "#{block_move}"
      end
    end
  end

    def corner
      if board.cells[0] == " "
        return "1"
      elsif board.cells[2] == " "
        return "3"
      elsif board.cells[6] == " "
        return "7"
      elsif board.cells[8] == " "
        return "9"
      end
    end

  end
