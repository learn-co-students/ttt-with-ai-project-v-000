class Human < Player

  def move(board)
    puts "Enter a move between 1-9 please:"
    gets.strip
  end
end