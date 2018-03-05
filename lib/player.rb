class Player

  attr_reader :token


  def initialize(token = "X")
    @token = token
  end

end
#first_picks = [4, 0, 2, 6, 8]
#first_picks.each do |pick|
  #if !board.taken?(pick)
    #input = board.cells[pick]
  #end
#end
#input.to_s
