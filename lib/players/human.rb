class Human < Player

  def move(board)
    puts "What move would you like to make (1-9)?"
    move = gets.chomp
  end

end
