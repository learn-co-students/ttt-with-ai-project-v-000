class Player::Human < Player
  attr_accessor :board

  def move(board)
    puts "Please provide a number from 1-9"
    input = gets.strip
  end

end