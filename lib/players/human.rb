class Player::Human < Player
  attr_accessor :token

  def move(board)
    puts "Please enter a move: "
    input = gets.strip
    input
  end

end
