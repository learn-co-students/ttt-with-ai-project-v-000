class Player::Computer < Player

  attr_accessor :board

  def move(board)
    if !board.taken?(5)
      "5"
    elsif
      !board.taken?(corner)
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
=begin
  def best_move(board)
    win(board) || block(board) || corner(board) || random
  end

  def block(board)
    block_test(board).detect {|x| board.cells[x] == " "} + 1 if !block_test(board).nil?
  end

  def random
    number = rand 1..9
  end

end


def move(board)
  if !board.taken?('5')
    '5'
  else
    best_move(board) + 1
  end
end
=end
