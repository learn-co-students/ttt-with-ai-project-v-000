class Computer < Player
  def move(_board)
    numbergen = (1..9).to_a
    numbergen.sample.to_s
  end
end
