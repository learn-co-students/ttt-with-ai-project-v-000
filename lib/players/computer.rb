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
# To continue my AI I'll take the WIN_COMBINATIONS and iterate over them to see if any 2 of the positions are == to the current_player's :token. If so play in the 3rd space from that array. If not, check to see if the other player's token has 2. then play the 3rd. If neither, play a random square.
