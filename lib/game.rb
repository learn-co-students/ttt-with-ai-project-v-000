class Game

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
end
