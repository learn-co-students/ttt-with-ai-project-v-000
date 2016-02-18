class Human < Player
  def move(board)
    puts "Where would you like to move?"
    move=gets.strip
  end
end