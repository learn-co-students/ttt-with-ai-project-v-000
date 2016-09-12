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

    DIAGONALS = [
      [0,4,8],
      [2,4,6]
    ]
    SIDES = [
      [0,1,2],
      [6,7,8],
      [0,3,6],
      [2,5,8]
    ]

    VERTICALS = [
      [3,4,5],
      [1,4,7]
    ]

    MOVES = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]

    def move(board)
      if win(board) == true
        win(board)
      elsif block(board) == true
        block(board)
      elsif diagonal_fork_move(board) == true
        diagonal_fork_move(board)
      elsif sides_fork_move(board) == true
        sides_fork_move(board)
      elsif vertical_block_fork(board) == true
        vertical_block_fork(board)
      elsif diagonal_block_fork(board) == true
        diagonal_block_fork(board)
      elsif sides_block_fork(board) == true
        sides_block_fork(board)
      elsif opposite_corner(board) == true
        opposite_corner(board)
      else
        moves(board)
      end
    end


    def win(board)
      WIN_COMBINATIONS.each do |wc|
         if board.cells[wc[0]] == self.token && board.cells[wc[1]] == self.token && board.cells[wc[2]] == " "
           "#{wc[2]+1}"
         elsif board.cells[wc[1]] == self.token && board.cells[wc[2]] == self.token && board.cells[wc[0]] == " "
           "#{wc[0]+1}"
         elsif board.cells[wc[0]] == self.token && board.cells[wc[2]] == self.token && board.cells[wc[1]] == " "
           "#{wc[1]+1}"
         end
       end
    end

    def block(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      WIN_COMBINATIONS.each do |wc|
         if board.cells[wc[0]] == opponent_token && board.cells[wc[1]] == opponent_token && board.cells[wc[2]] == " "
           "#{wc[2]+1}"
         elsif board.cells[wc[1]] == opponent_token && board.cells[wc[2]] == opponent_token && board.cells[wc[0]] == " "
           "#{wc[0]+1}"
         elsif board.cells[wc[0]] == opponent_token && board.cells[wc[2]] == opponent_token && board.cells[wc[1]] == " "
           "#{wc[1]+1}"
         end
       end
    end

    def diagonal_fork_move(board)
      SIDES.each do |side|
        if board.cells[side[0]] == self.token && board.cells[side[1]] == " " && board.cells[side[2]] == self.token
          "8"
        else
          "6"
        end
      end
    end

    def sides_fork_move(board)
      SIDES.each do |side|
        if board.cells[side[0]] == self.token && board.cells[side[1]] == " " && board.cells[side[2]] == self.token
          if board.cells[0] == " " && board.cells[1] == " " && board.cells[2] == self.token
            "1"
          elsif board.cells[6] == " " && board.cells[7] == " " && board.cells[8] == self.token
            "7"
          elsif board.cells[0] == " " && board.cells[3] == " " && board.cells[6] == self.token
            "1"
          else board.cells[2] == " " && board.cells[5] == " " && board.cells[8] == self.token
            "3"
          end
        end
      end
    end

    def vertical_block_fork(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      DIAGONALS.each do |diag|
        if board.cells[diag[0]] == opponent_token && board.cells[diag[1]] == self.token && board.cells[diag[2]] == opponent_token
          if board.cells[3] == " " && board.cells[4] == self.token && board.cells[5] == " "
            "6"
          elsif board.cells[1] == " " && board.cells[4] == self.token && board.cells[7] == " "
            "8"
          end
        end
      end
    end

    def diagonal_block_fork(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      SIDES.each do |side|
        if board.cells[side[0]] == opponent_token && board.cells[side[1]] == " " && board.cells[side[2]] == opponent_token
          if board.cells[0] == opponent_token && board.cells[4] == " " && board.cells[8] == " "
            "9"
          else board.cells[2] == opponent_token && board.cells[4] == " " && board.cells[6] == " "
            "7"
          end
        end
      end
    end

    def sides_block_fork(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      SIDES.each do |side|
        if board.cells[side[0]] == opponent_token && board.cells[side[1]] == " " && board.cells[side[2]] == opponent_token
          if board.cells[0] == opponent_token && board.cells[1] == " " && board.cells[2] == " "
            "3"
          elsif board.cells[6] == opponent_token && board.cells[7] == " " && board.cells[8] == " "
            "9"
          elsif board.cells[0] == opponent_token && board.cells[3] == " " && board.cells[6] == " "
            "7"
          else board.cells[2] == opponent_token && board.cells[5] == " " && board.cells[8] == " "
            "9"
          end
        end
      end
    end

    def center(board)
      if board.cells[4] == " "
        "5"
      end
    end

    def opposite_corner(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      if board.cells[0] == opponent_token && board.cells[8] == " "
        "9"
      elsif board.cells[2] == opponent_token && board.cells[6] == " "
        "7"
      elsif board.cells[6] == opponent_token && board.cells[2] == " "
        "3"
      elsif board.cells[8] == opponent_token && board.cells[0] == " "
        "1"
      end
    end

    def moves(board)
      MOVES.find {|move| board.valid_move?(move)}
    end
  end #class Computer < Player
end#module Players
