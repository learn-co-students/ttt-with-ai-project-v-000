module Players
  class Computer < Player
    def move(board)
      if board.cells.count{|square| square != " " } == 0
        "1"
      elsif board.cells.count{|square| square != " " } == 1
        board.cells.find_index("X") == 4 ? "1" : "5"
      else
        possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        valid_moves = []
        possible_moves.each do |move|
          valid_moves << move if board.cells[move.to_i-1] == " "
        end
        valid_moves.sample
      end
    end
  end
end