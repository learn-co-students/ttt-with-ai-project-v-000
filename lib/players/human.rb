class Human < Player

  def move(board)
    puts "where would you like to move?"
    pos = gets
    board.update(pos, self)
  end

end