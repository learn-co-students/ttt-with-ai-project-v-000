require "pry"
class Player::Computer < Player

  def move(board)
    @moves = board.cells.each_index.select { |index| board.cells[index] == " "}
      corners || edges || rand(1..9).to_s 
  end

    def corners
    if @moves.include?(0)
     "1"
    elsif @moves.include?(2)
     "3"
    elsif @moves.include?(6)
    "7"
    elsif @moves.include?(8)
    "9"
    end
  end

  def edges
    if @moves.include?(1)
     "2"
    elsif @moves.include?(3)
     "4"
    elsif @moves.include?(5)
     "6"
    elsif @moves.include?(7)
     "8"
    end
  end

end
