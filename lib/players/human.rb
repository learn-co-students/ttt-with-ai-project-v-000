class Human < Player

  def move(board = nil)
    print "Choose your next move (1-9): "
    move = gets.chomp
    move
  end

end