require 'pry'

module Players

  class Computer < Player

    OPPOSITES = [[0,8],[2,6]]
    CORNERS = ["1","3","7","9"]
    SIDES = ["2","4","6","8"]
    MOVES = ["1", "5", "3", "7", "9", "2", "4", "6", "8"]

    def move(board)
      if first_move(board) !=nil
        first_move(board)
      elsif win(board) !=nil
        win(board)
      elsif block(board) !=nil
        block(board)
      elsif corner_fork(board) != nil
        corner_fork(board)
      elsif block_corner_fork(board) !=nil
        block_corner_fork(board)
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
      Game::WIN_COMBINATIONS.find do |wc|
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
      Game::WIN_COMBINATIONS.find do |wc|
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

    def corner_fork(board)
      fork = nil
      OPPOSITES.find do |opp|
        if opp[0] == self.token && opp[1] == self.token
          fork = CORNERS.find {|corner| board.valid?(corner)}
        end
      end
      fork
    end

    def block_corner_fork(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      block = nil
      OPPOSITES.find do |opp|
        if board.cells[opp[0]] == opponent_token && board.cells[opp[1]] == opponent_token && board.cells[4] == self.token
          block = SIDES.find {|side| board.valid_move?(side)}
        end
      end
      block
    end

    def first_move(board)
      if board.turn_count == 0
        "1"
      end
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
