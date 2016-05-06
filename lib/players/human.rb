class Player::Human < Player
  
  def move(board)
    puts "Enter an available number between 1 and 9:"
    input = gets.strip
    input
  end
  
end