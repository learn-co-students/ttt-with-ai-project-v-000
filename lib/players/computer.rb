require_relative '../player.rb'

class Computer < Player

  def move(board)
    rand(1..9).to_s
  end

end
