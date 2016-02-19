require "pry"
class Player::Computer < Player

  def move(board)
    position = rand(1..9).to_s
    until !board.taken?(position)
      position = rand(1..9).to_s
    end
    position
  end
end
