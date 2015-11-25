require 'pry'


class Player::Computer < Player
  
  def initialize(token)
    @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def move(board_inst)
    if board_inst.valid_move?(4)
      "5"
    end
  end

end
