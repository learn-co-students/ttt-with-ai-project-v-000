class Player::Human < Player
  def move(board)
    puts "Please enter a position from 1-9"
    input = ' '
    input = gets.chomp
  end
end
