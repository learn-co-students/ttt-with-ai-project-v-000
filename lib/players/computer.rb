require "pry"
  class Players::Computer < Player
    def move(board)
      #board.cells
      #binding.pry
      puts "\r" , "\r"
      self.token == "O" ? enemy = "X" : enemy = "O"
      #binding.pry
      if board.turn_count > 2
      great = Game.win_comb.detect do |win_array|
        (board.cells[win_array[0]] == enemy || board.cells[win_array[0]] == " ") && (board.cells[win_array[1]] == enemy || board.cells[win_array[1]] == " ") && (board.cells[win_array[2]] == enemy || board.cells[win_array[2]] == " ")
      end
      better = great.detect do |array|
      board.valid_move?(array)
      end
      better.to_s
    elsif board.turn_count == 1
      "5"
    elsif board.turn_count == 0
      "1"
    end
  end
end
