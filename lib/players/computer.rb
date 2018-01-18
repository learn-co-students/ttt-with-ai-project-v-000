class Players::Computer < Player
  def move(board)
    puts "\r" , "\r"
    self.token == "O" ? enemy = "X" : enemy = "O"
    if board.turn_count >= 2
      great = Game.win_comb.detect do |win_array|
        (board.cells[win_array[0]] == enemy || board.cells[win_array[0]] == " ") && (board.cells[win_array[1]] == enemy || board.cells[win_array[1]] == " ") && (board.cells[win_array[2]] == enemy || board.cells[win_array[2]] == " ")
      end
      add1_and_str = great.map do |int|
        int +=1
        int.to_s
      end
      add1_and_str.detect do |array|
      board.valid_move?(array)
      end
    elsif board.turn_count == 1
      "5"
    elsif board.turn_count == 0
      "1"
    end
  end
end
