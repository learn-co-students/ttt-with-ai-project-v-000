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
        next_move(board)
        last_move(board)
      end
      @move.to_s
    end
    
    def next_move(board)
      array = CORNERS.select{|v| board.taken?(v)}
      array.sample  
    end

    def block_move(board)
      @move = almost_lose(board).detect{|b| b == " "}
      @move
    end

    def win_move(board)
      @move = almost_win(board).detect{|b|b == " "}
      @move
    end

    def last_move(board)
      array = EDGES.select{|v| board.taken?(v)}
      array.sample
    end

    def almost_win(board)
      a = WIN_COMBINATIONS.detect {|w|w.select {|a| board.cells[a-1] == self.token}.length == 2}
    end

    def almost_lose(board)
      a = WIN_COMBINATIONS.detect {|w| w.select {|a| board.cells[a-1] == opposite_token}.length == 2}
      binding.pry
    end

    def opposite_token
      self.token == "X" ? "O" : "X"
    end
  end
end