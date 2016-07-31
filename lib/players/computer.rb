class Player::Computer < Player

  attr_accessor :board

  def move(board)
    if !board.taken?('5')
      '5'
    elsif
      corner(board)
      corner.sample
    else
      location.to_i.between?(1,9).sample
      #!position_taken?(board, location.to_i - 1)
    end
  end

  def corner(board)
    [1, 3, 7, 9].detect{ |x| !board.taken?(x)}
  end

end
