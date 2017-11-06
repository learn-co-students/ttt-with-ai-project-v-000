require "pry"

class Players::Computer < Player

  def move(board)
    current_move = 0
    (1..9).each do |cell|
      if board.valid_move?(cell)
        current_move = cell
        break
      end
    end
    current_move.to_s
  end
end
