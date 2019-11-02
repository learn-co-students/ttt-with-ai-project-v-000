require 'pry'

module Players
  class Computer < Player
    def move(board = nil)
      if board.turn_count == 0 || board.turn_count == 1 || board.turn_count == 2
        corner(board)
      elsif board.turn_count == 3
        if win_game(board)
          win_game(board)
        elsif block_opponent(board)
          block_opponent(board)
        elsif corner(board)
          corner(board)
        end
      elsif board.turn_count > 3
        if win_game(board)
          win_game(board)
        elsif block_opponent(board)
          block_opponent(board)
        elsif corner(board)
          corner(board)
        elsif random(board)
          random(board)
        end
      end

    end

    def corner(board = Board.new)
      corners = [1, 3, 7, 9]
      corners.detect{|i| !board.taken?(i)}.to_s
    end

    def random(board = Board.new)
      valid_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      valid_moves.detect{|i| !board.taken?(i)}.to_s
    end
    #WIN_COMBINATIONS = [
    #  [0,1,2],
    #  [3,4,5],
    #  [6,7,8],
    #  [0,3,6],
    #  [1,4,7],
    #  [2,5,8],
    #  [0,4,8],
    #  [6,4,2]
    #]
    def win_game(board = Board.new)
      #top row wins
      if board.cells[0] == self.token && board.cells[1] == self.token && !board.taken?(3)
        input = "3"
      elsif board.cells[0] == self.token && !board.taken?(2) && board.cells[2] == self.token
        input = "2"
      elsif !board.taken?(1) && board.cells[1] == self.token && board.cells[2] == self.token
        input = "1"
      #middle row wins
    elsif board.cells[3] == self.token && board.cells[4] == self.token && !board.taken?(6)
        input = "6"
      elsif board.cells[3] == self.token && !board.taken?(5) && board.cells[5] == self.token
        input = "5"
      elsif !board.taken?(4) && board.cells[4] == self.token && board.cells[5] == self.token
        input = "4"
        #bottom row wins
      elsif board.cells[6] == self.token && board.cells[7] == self.token && !board.taken?(9)
        input = "9"
      elsif board.cells[6] == self.token && !board.taken?(8) && board.cells[8] == self.token
        input = "8"
      elsif !board.taken?(7) && board.cells[7] == self.token && board.cells[8] == self.token
        input = "7"
        #left column wins
      elsif board.cells[0] == self.token && board.cells[3] == self.token && !board.taken?(7)
        input = "7"
      elsif board.cells[0] == self.token && !board.taken?(4) && board.cells[6] == self.token
        input = "4"
      elsif !board.taken?(1) && board.cells[3] == self.token && board.cells[6] == self.token
        input = "1"
        #middle column wins
      elsif board.cells[1] == self.token && board.cells[4] == self.token && !board.taken?(8)
        input = "8"
      elsif board.cells[1] == self.token && !board.taken?(5) && board.cells[7] == self.token
        input = "5"
      elsif !board.taken?(2) && board.cells[4] == self.token && board.cells[7] == self.token
        input = "2"
        #right column wins
      elsif board.cells[2] == self.token && board.cells[5] == self.token && !board.taken?(9)
        input = "9"
      elsif board.cells[2] == self.token && !board.taken?(7) && board.cells[8] == self.token
        input = "6"
      elsif !board.taken?(3) && board.cells[5] == self.token && board.cells[8] == self.token
        input = "3"
        #top left to bottom right diagonal
      elsif board.cells[0] == self.token && board.cells[4] == self.token && !board.taken?(9)
        input = "9"
      elsif board.cells[0] == self.token && !board.taken?(5) && board.cells[8] == self.token
        input = "5"
      elsif !board.taken?(1) && board.cells[4] == self.token && board.cells[8] == self.token
        input = "1"
        #bottom left to top right diagonal
      elsif board.cells[6] == self.token && board.cells[4] == self.token && !board.taken?(3)
        input = "3"
      elsif board.cells[6] == self.token && !board.taken?(5) && board.cells[2] == self.token
        input = "5"
      elsif !board.taken?(7) && board.cells[4] == self.token && board.cells[2] == self.token
        input = "7"
      end

    end

    def block_opponent(board = Board.new)
      if self.token == "X"
        opponent = "O"
      elsif self.token == "O"
        opponent = "X"
      end

      if board.cells[0] == opponent && board.cells[1] == opponent && !board.taken?(3)
        input = "3"
      elsif board.cells[0] == opponent && !board.taken?(2) && board.cells[2] == opponent
        input = "2"
      elsif !board.taken?(1) && board.cells[1] == opponent && board.cells[2] == opponent
        input = "1"
      #middle row wins
    elsif board.cells[3] == opponent && board.cells[4] == opponent && !board.taken?(6)
        input = "6"
      elsif board.cells[3] == opponent && !board.taken?(5) && board.cells[5] == opponent
        input = "5"
      elsif !board.taken?(4) && board.cells[4] == opponent && board.cells[5] == opponent
        input = "4"
        #bottom row wins
      elsif board.cells[6] == opponent && board.cells[7] == opponent && !board.taken?(9)
        input = "9"
      elsif board.cells[6] == opponent && !board.taken?(8) && board.cells[8] == opponent
        input = "8"
      elsif !board.taken?(7) && board.cells[7] == opponent && board.cells[8] == opponent
        input = "7"
        #left column wins
      elsif board.cells[0] == opponent && board.cells[3] == opponent && !board.taken?(7)
        input = "7"
      elsif board.cells[0] == opponent && !board.taken?(4) && board.cells[6] == opponent
        input = "4"
      elsif !board.taken?(1) && board.cells[3] == opponent && board.cells[6] == opponent
        input = "1"
        #middle column wins
      elsif board.cells[1] == opponent && board.cells[4] == opponent && !board.taken?(8)
        input = "8"
      elsif board.cells[1] == opponent && !board.taken?(5) && board.cells[7] == opponent
        input = "5"
      elsif !board.taken?(2) && board.cells[4] == opponent && board.cells[7] == opponent
        input = "2"
        #right column wins
      elsif board.cells[2] == opponent && board.cells[5] == opponent && !board.taken?(9)
        input = "9"
      elsif board.cells[2] == opponent && !board.taken?(6) && board.cells[8] == opponent
        input = "6"
      elsif !board.taken?(3) && board.cells[5] == opponent && board.cells[8] == opponent
        input = "3"
        #top left to bottom right diagonal
      elsif board.cells[0] == opponent && board.cells[4] == opponent && !board.taken?(9)
        input = "9"
      elsif board.cells[0] == opponent && !board.taken?(5) && board.cells[8] == opponent
        input = "5"
      elsif !board.taken?(1) && board.cells[4] == opponent && board.cells[8] == opponent
        input = "1"
        #bottom left to top right diagonal
      elsif board.cells[6] == opponent && board.cells[4] == opponent && !board.taken?(3)
        input = "3"
      elsif board.cells[6] == opponent && !board.taken?(5) && board.cells[2] == opponent
        input = "5"
      elsif !board.taken?(7) && board.cells[4] == opponent && board.cells[2] == opponent
        input = "7"
      end
    end
  end
end
