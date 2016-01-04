class Player::Computer < Player

  def move(board)
    possible_moves = []
    board.cells.each_with_index do |cell, index| 
      if cell == " "
        return (index + 1).to_s
        possible_moves << index 
      end
    end 
  end 

end 