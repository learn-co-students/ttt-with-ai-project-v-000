class Player::Human < Player

  def move(board)
    puts "Enter a move between 1 and 9:"
    input = gets.strip
  end
  
end
