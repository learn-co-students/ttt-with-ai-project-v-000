module Players
class Computer < Player

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
  ]

  def move(board)
    corners = ["1", "3", "7", "9"]
    edges = ["2", "4", "6", "8"]
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if board.cells.all?{ |i| i == " " }
        "1"
      elsif board.turn_count == 2 && board.position(5) == "O"
        "9"
      elsif board.turn_count == 2 && corners.any?{ |i| board.position(i) == "O"}
        corners.sample
      elsif board.turn_count == 2 && edges.any?{ |i| board.position(i) == "O"}
        "5"
      elsif board.cells.values_at(1, 3, 5, 7).any?{ |i| i == " " }
        edges.sample
      elsif board.cells.values_at(0, 2, 6, 8).any?{ |i| i == " " }
        corners.sample
      else
        valid_moves.sample
      end

  end

end
end
