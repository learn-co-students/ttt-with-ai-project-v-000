class Player::Human < Player
  attr_reader :token, :board
  def move(board)
    puts "Please choose position on board between 1-9:"
    gets.rstrip
  end
end