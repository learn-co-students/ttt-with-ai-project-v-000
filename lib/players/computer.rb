require 'pry'
class Computer < Player

  attr_accessor :valid_moves

  def move(board)
    @valid_moves = []
    @valid_moves.reject! {|position| board.taken?(spot)}
    return @valid_moves.sample
  end

end