class Human < Player # inherits from Player

  def move(board)
    # asks the user for input and returns it
    puts "Please enter a move from 1 to 9"
    puts "These are the only valid moves: #{board.available_moves}"
    input = gets.strip
  end

end