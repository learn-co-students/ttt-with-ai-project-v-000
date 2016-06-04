class Human < Player

  def move(board = nil)
    puts "Choose your next move."
    move = gets.chomp
    move
  end

end