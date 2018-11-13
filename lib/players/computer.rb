module Players
class Computer < Player
  #inherits from Player
  def move(board)
    #returns a valid position for the computer to move
    rand(1...9).to_s
  end
end
end
