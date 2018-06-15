class Computer < Player
  def move(board)
    (rand(9) + 1).to_s
   end
end