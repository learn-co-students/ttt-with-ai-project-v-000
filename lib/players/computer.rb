class Players::Computer < Player
  

  def move(board)
   output = (1..9).to_a.sample.to_s
  end
end