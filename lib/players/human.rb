class Player::Human < Player
  def move(board)
    puts "Please choose a spot to put your marker: "
    choice = gets.strip
  end
end
