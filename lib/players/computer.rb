module Players

  class Computer < Player
  
    def move(board)
      if defence(board)
        resault = find_space(defence(board), board) + 1
      elsif offence(board)
        resault = find_space(offence(board), board) + 1
      else 
        resault = random(board)
      end 
      resault
    end
    
    def defence(board)
      a = [" "]
      a << self.token
      a << self.token
      Game::WIN_COMBINATIONS.detect {|wc|
      b = []
      b << board.cells[wc[0]]
      b << board.cells[wc[1]]
      b << board.cells[wc[2]]
      b.sort == a.sort}
    end
    
    def offence(board)
      op = "O" if self.token == "X"
      op = "X" if self.token == "O"
      a = [" "]
      a << op
      a << op
      Game::WIN_COMBINATIONS.detect {|wc|
      b = []
      b << board.cells[wc[0]]
      b << board.cells[wc[1]]
      b << board.cells[wc[2]]
      b.sort == a.sort}
    end
    
    def find_space(wc, board)
      wc.detect {|c| board.cells[c] == " "}
    end
    
    def random(board)
      c = ["1","3","7","9"]
      cs = c.shuffle
      corner = cs.detect {|num| board.valid_move?(num)}
      if board.valid_move?("5")
        "5"
      elsif corner != nil 
        corner
      else 
        rand(1..9).to_s
      end
    end
    
  end
end