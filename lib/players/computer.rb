require 'pry'
class Player::Computer < Player
  def move(board)
    input = 1 + rand(9)
    number = input.to_s
    #binding.pry
    if board.valid_move?(number)
       number
    else
      move(board)
    end
  end
end
