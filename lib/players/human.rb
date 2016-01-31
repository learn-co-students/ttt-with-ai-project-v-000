class Human < Player

  def move(board)
    puts "Which square do you want (1-9)?"
    gets.strip
  end

end