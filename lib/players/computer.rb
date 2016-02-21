class Computer < Player


  def move(board)
    gets.chomp
  end

  def move(board)
    possible_moves = ["1","2","3","4","5","6","7","8","9"]
    list_of_moves = possible_moves.detect{|position| board.valid_move?(position) == true}
    list_of_moves
  end

end