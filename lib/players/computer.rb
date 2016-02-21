require 'pry'

class Computer < Player
  def move(_board)
    numbergen = (1..9).to_a
    # binding.pry
    numbergen.sample.to_s
  end
end
