class Human < Player # inherits from Player

  def move(board)
    # asks the user for input and returns it
    puts "Please enter a move from 1 to 9:"
    input = gets.strip
  end

end