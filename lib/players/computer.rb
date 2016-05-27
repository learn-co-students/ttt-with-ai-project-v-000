require'pry'
class Player::Computer < Player

  def move(board)
    free_spot = []
    board.cells.each_with_index {|point, index|
      if point == " "
        new_index = index+1
        free_spot << new_index.to_s
      end
    }
    free_spot.sample
  end





end