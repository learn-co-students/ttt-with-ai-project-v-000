require_relative '../player.rb'


class Player::Computer < Player

  def move(board)
    
    position = rand(1..9).to_s
    board.valid_move?(position) ? position : move(board)

  end
end
