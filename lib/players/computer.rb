module Players
  class Computer < Player
  
    def move(board)
      if has_two?(board, self.token)
        has_two?(board, self.token)
      elsif has_two?(board, other_player)
        has_two?(board, other_player)
      elsif !board.taken?("5")
        "5"
      elsif ["1", "3", "7", "9"].find {|cell| !board.taken?(cell)}
        ["1", "3", "7", "9"].find {|cell| !board.taken?(cell)}
      else
        (board.cells.index(" ") + 1).to_s
      end
    end
    
    def has_two?(board, token)
      move = nil
      Game::WIN_COMBINATIONS.each do |combination|
        if board.cells[combination[0]] == token && board.cells[combination[1]] == token && !board.taken?((combination[2] + 1).to_s) 
          move= (combination[2] + 1).to_s
        elsif board.cells[combination[1]] == token && board.cells[combination[2]] == token && !board.taken?((combination[0] + 1).to_s) 
          move = (combination[0] + 1).to_s
        elsif board.cells[combination[0]] == token && board.cells[combination[2]] == token && !board.taken?((combination[1] + 1).to_s) 
          move = (combination[1] + 1).to_s
        end
      end
      move
    end
    
    def other_player
      self.token == "X" ? "O" : "X"
    end
  end
end