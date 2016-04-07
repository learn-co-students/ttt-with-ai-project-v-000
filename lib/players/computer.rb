Computer = Class.new(Player)

class Computer
  def move(board)
    spot = []
    board.cells.each_with_index do |player, index|
      spot << index + 1 if player = " "
    end

    spot.join(" ").split.sample
  end
end
