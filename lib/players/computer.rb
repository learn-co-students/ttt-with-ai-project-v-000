require 'pry'
module Players
  class Computer < Player

    WIN_COMBINATIONS = [[2,5,8], [3,5,7], [4,5,6], [1,5,9], [1,4,7], [1,2,3], [7,8,9], [3,6,9]]    
    CORNERS = ["1", "3", "7", "9"]
    EDGES = ["2", "4", "6", "8"]
    def move(board)
      @move = nil
      one = 5
      if board.valid_move?(one)
        @move = one
      elsif almost_lose(board)
        block_move(board)
      elsif almost_win(board)
        win_move(board)
      else
        next_move(board) ? next_move(board) : last_move(board)
      end
      @move.to_s
    end

    def my_positions(board, combo)
      array = combo.select{|x| board.cells[x-1] == self.token}
      array.length == 2 ? true : false
    end
    
    def opp_positions(board, combo)
      array = combo.select{|x| board.cells[x-1] == opposite_token}
      array.length == 2 ? true : false
    end

    def empty_positions(board, combo)
      array = combo.select{|x| board.cells[x-1] == " "}
      array.length == 1 ? true : false
    end
    
    def next_move(board)
      array = CORNERS.select{|v| !board.taken?(v)}
      @move = array.sample  
    end

    def block_move(board)
      @move = almost_lose(board).detect{|b| board.cells[b-1] == " "}
    end

    def win_move(board)
      @move = almost_win(board).detect{|b|board.cells[b-1] == " "}
    end

    def last_move(board)
      array = EDGES.select{|v| !board.taken?(v)}
      @move = array.sample
    end

    def almost_win(board)
      a = WIN_COMBINATIONS.detect {|combo| empty_positions(board, combo) && my_positions(board, combo)}
    end

    def almost_lose(board)
      a = WIN_COMBINATIONS.detect {|combo| empty_positions(board, combo) && opp_positions(board, combo)}
    end

    def opposite_token
      self.token == "X" ? "O" : "X"
    end
  end
end