
class Player::Human < Player

  def move(board) # why doesn't @board work? 'formal argument cannot be an instance variable'
    puts "Where would you like to go (choose a number from 1-9)?"
    input = gets.chomp
  end

end

# Define a class Player::Human that inherits from Player. The human player must implement a #move method that 
# takes in a board argument and allows a human player to enter a move via the CLI. The method should return the value 
# the user enters. Even though the method accepts a board argument, it does not need to use it.