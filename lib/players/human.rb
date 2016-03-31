class Human < Player

  #-----gets pos for player move-----#
  def move(board = Board.new)
    pos = gets.chomp
    pos
  end

end