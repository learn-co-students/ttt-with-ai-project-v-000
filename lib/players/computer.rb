class Player
  class Computer < Player
    def move(board)
      if board.turn_count == 0 || board.turn_count == 1
        go_for_middle(board)
        any_move(board)
      else
        # binding.pry
        occupied_positions(board).each do |position|
          ajacent_spots[position].each do |move|
            return move if board.valid_move?(move)
          end
        end
      end
    end

    def go_for_middle(board)
      "5" if board.valid_move?("5")
    end

    def ajacent_spots
      { "1" => ["2", "4", "5"],
        "2" => ["1", "3", "5"],
        "3" => ["2", "5", "6"],
        "4" => ["1", "5", "7"],
        "5" => ["1", "2", "3", "4", "6", "7", "8", "9"],
        "6" => ["3", "5", "9"],
        "7" => ["4", "5", "8"],
        "8" => ["7", "5", "9"],
        "9" => ["8", "5", "6"] }
    end

    def occupied_positions(board)
      positions = []
      board.cells.each.with_index do |t, i|
        positions << (i + 1).to_s if t == token
      end
      positions
    end

    def any_move(board)
      index = board.cells.find_index { |t| t == " " }
      (index + 1).to_s
    end
  end
end
