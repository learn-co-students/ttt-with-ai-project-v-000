
class Player::Computer < Player
	attr_accessor :board, :game 

  def initialize(board = Board.new, game = Game.new)
  	@board = board
  	@game = game 
  end

  def move(board)
  	spot = rand(1..9).to_s
  	if board.valid_move?(spot)
  	  board.update(spot, self)
  	  spot
  	else
  	  spot
  	end
  end
end