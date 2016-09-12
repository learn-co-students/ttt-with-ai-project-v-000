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

    DIAGONAL_WINS = [
      [0,4,8],
      [2,4,6]
    ]
    SIDE_WINS = [
      [0,1,2],
      [0,3,6],
      [6,7,8],
      [2,5,8]
    ]
    CENTER_WINS = [
      [3,4,5],
      [1,4,7]
    ]

    OPPOSITES = [[0,8],[2,6]]
    CORNERS = ["1","3","7","9"]
    SIDES = ["2","4","6","8"]
    MOVES = ["1", "5", "3", "7", "9", "2", "4", "6", "8"]

    def move(board)
      if win(board) !=nil
        win(board)
      elsif block(board) !=nil
        block(board)
      elsif center(board) !=nil
        center(board)
      elsif opposite_corner(board) !=nil
        opposite_corner(board)
      else
        moves(board)
      end
    end

    def win(board)
      win = nil
      WIN_COMBINATIONS.find do |wc|
         if board.cells[wc[0]] == self.token && board.cells[wc[1]] == self.token && board.cells[wc[2]] == " "
           win = "#{wc[2]+1}"
         elsif board.cells[wc[1]] == self.token && board.cells[wc[2]] == self.token && board.cells[wc[0]] == " "
           win = "#{wc[0]+1}"
         elsif board.cells[wc[0]] == self.token && board.cells[wc[2]] == self.token && board.cells[wc[1]] == " "
           win = "#{wc[1]+1}"
         end
       end
       win
    end


    def block(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      block = nil
      WIN_COMBINATIONS.find do |wc|
         if board.cells[wc[0]] == opponent_token && board.cells[wc[1]] == opponent_token && board.cells[wc[2]] == " "
           block = "#{wc[2]+1}"
         elsif board.cells[wc[1]] == opponent_token && board.cells[wc[2]] == opponent_token && board.cells[wc[0]] == " "
           block = "#{wc[0]+1}"
         elsif board.cells[wc[0]] == opponent_token && board.cells[wc[2]] == opponent_token && board.cells[wc[1]] == " "
           block = "#{wc[1]+1}"
         end
       end
       block
    end

    def center(board)
      if board.cells[4] == " "
        "5"
      end
    end

    def opposite_corner(board)
      opposite = nil
      OPPOSITES.find do |opp|
        if board.taken?("#{opp[0]+1}") && board.cells[opp[1]] == " "
          opposite = "#{opp[1]+1}"
        elsif board.taken?("#{opp[1]+1}") && board.cells[opp[0]] == " "
          opposite = "#{opp[0]+1}"
        end
      end
      opposite
    end

    def moves(board)
      MOVES.find {|move| board.valid_move?(move)}
    end
  end #class Computer < Player
end#module Players
