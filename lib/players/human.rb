class Player::Human < Player

  def move(board)
    puts "Input an integer from 1 to 9 to select the location of your next move.\n\n"
    input = gets.strip
    puts "\n\n"
    input
  end



end
