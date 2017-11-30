module Players
  class Computer < Player
    def move(board = nil)


    end

    def corner(board = Board.new)
      corners = ["1", "3", "7", "9"]
      corners.detect{|i| !board.taken?(i)}.to_s
    end

    def random(board = Board.new)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
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
      if board[0] == self.token && board[1] == self.token && !board.taken?(2)
        "3"
      elsif board[0] == self.token && !board.taken?(1) && board[2] == self.token
        "2"
      elsif !board.taken?(0) && board[1] == self.token && board[2] == self.token
        "1"
      #middle row wins
      elsif board[3] == self.token && board[4] == self.token && !board.taken?(5)
        "6"
      elsif board[3] == self.token && !board.taken?(4) && board[5] == self.token
        "5"
      elsif !board.taken?(3) && board[4] == self.token && board[5] == self.token
        "4"
        #bottom row wins
      elsif board[6] == self.token && board[7] == self.token && !board.taken?(8)
        "9"
      elsif board[6] == self.token && !board.taken?(7) && board[8] == self.token
        "8"
      elsif !board.taken?(6) && board[7] == self.token && board[8] == self.token
        "7"
        #left column wins
      elsif board[0] == self.token && board[3] == self.token && !board.taken?(6)
        "7"
      elsif board[0] == self.token && !board.taken?(3) && board[6] == self.token
        "4"
      elsif !board.taken?(0) && board[3] == self.token && board[6] == self.token
        "1"
        #middle column wins
      elsif board[1] == self.token && board[4] == self.token && !board.taken?(7)
        "8"
      elsif board[1] == self.token && !board.taken?(4) && board[7] == self.token
        "5"
      elsif !board.taken?(1) && board[4] == self.token && board[7] == self.token
        "2"
        #right column wins
      elsif board[2] == self.token && board[5] == self.token && !board.taken?(8)
        "9"
      elsif board[2] == self.token && !board.taken?(5) && board[8] == self.token
        "6"
      elsif !board.taken?(2) && board[5] == self.token && board[8] == self.token
        "3"
        #top left to bottom right diagonal
      elsif board[0] == self.token && board[4] == self.token && !board.taken?(8)
        "9"
      elsif board[0] == self.token && !board.taken?(4) && board[8] == self.token
        "5"
      elsif !board.taken?(0) && board[4] == self.token && board[8] == self.token
        "1"
        #bottom left to top right diagonal
      elsif board[6] == self.token && board[4] == self.token && !board.taken?(2)
        "3"
      elsif board[6] == self.token && !board.taken?(4) && board[2] == self.token
        "5"
      elsif !board.taken?(6) && board[4] == self.token && board[2] == self.token
        "7"
      end

    end

    def block_opponent(board = Board.new)
      if self.token == "X"
        opponent = "O"
      elsif self.token == "O"
        opponent = "X"
      end

      if board[0] == opponent && board[1] == opponent && !board.taken?(2)
        "3"
      elsif board[0] == opponent && !board.taken?(1) && board[2] == opponent
        "2"
      elsif !board.taken?(0) && board[1] == opponent && board[2] == opponent
        "1"
      #middle row wins
      elsif board[3] == opponent && board[4] == opponent && !board.taken?(5)
        "6"
      elsif board[3] == opponent && !board.taken?(4) && board[5] == opponent
        "5"
      elsif !board.taken?(3) && board[4] == opponent && board[5] == opponent
        "4"
        #bottom row wins
      elsif board[6] == opponent && board[7] == opponent && !board.taken?(8)
        "9"
      elsif board[6] == opponent && !board.taken?(7) && board[8] == opponent
        "8"
      elsif !board.taken?(6) && board[7] == opponent && board[8] == opponent
        "7"
        #left column wins
      elsif board[0] == opponent && board[3] == opponent && !board.taken?(6)
        "7"
      elsif board[0] == opponent && !board.taken?(3) && board[6] == opponent
        "4"
      elsif !board.taken?(0) && board[3] == opponent && board[6] == opponent
        "1"
        #middle column wins
      elsif board[1] == opponent && board[4] == opponent && !board.taken?(7)
        "8"
      elsif board[1] == opponent && !board.taken?(4) && board[7] == opponent
        "5"
      elsif !board.taken?(1) && board[4] == opponent && board[7] == opponent
        "2"
        #right column wins
      elsif board[2] == opponent && board[5] == opponent && !board.taken?(8)
        "9"
      elsif board[2] == opponent && !board.taken?(5) && board[8] == opponent
        "6"
      elsif !board.taken?(2) && board[5] == opponent && board[8] == opponent
        "3"
        #top left to bottom right diagonal
      elsif board[0] == opponent && board[4] == opponent && !board.taken?(8)
        "9"
      elsif board[0] == opponent && !board.taken?(4) && board[8] == opponent
        "5"
      elsif !board.taken?(0) && board[4] == opponent && board[8] == opponent
        "1"
        #bottom left to top right diagonal
      elsif board[6] == opponent && board[4] == opponent && !board.taken?(2)
        "3"
      elsif board[6] == opponent && !board.taken?(4) && board[2] == opponent
        "5"
      elsif !board.taken?(6) && board[4] == opponent && board[2] == opponent
        "7"
      end
    end
  end
end
