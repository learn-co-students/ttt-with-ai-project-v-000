module Players 
  class Computer < Player 

    def move(board)
      valid_moves = Array.new
      board.cells.each_with_index do |position, index|
        if position == " "
          valid_moves << index
        end
      end
      test_board = board
      game = Game.new(test_board)
      if game.won?
        valid_moves.each do |valid_move|
          test_board.update(valid_move+1, self)
          return (valid_move+1).to_s
        end
      else 
        valid_moves.map{ |move| (move+1).to_s }.sample
      end 
    end   
  end 
end