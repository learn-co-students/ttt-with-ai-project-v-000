class Player::Computer < Player
  
  attr_accessor :board, :token
  
  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
  ]
  
  def move(board)
    @board = board
    if potential_combo
      win_or_block.to_s
    else
      rand(1..9).to_s
    end
  end

  def potential_combo
    WIN_COMBINATIONS.detect do |combination|
      c = combination
      space0 = @board.cells[c[0]]
      space1 = @board.cells[c[1]]
      space2 = @board.cells[c[2]]
      (space0 != " " && space0 == space1 && space2 == " ") || (space1 != " " && space1 == space2 && space0 == " ") || (space2 != " " && space2 == space0 && space1 == " ")
    end
  end

  def win_or_block
    potential_combo.detect {|index| @board.cells[index] == " "} + 1
  end

end