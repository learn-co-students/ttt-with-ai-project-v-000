

class Player::Human < Player

  def move(board)
    puts "Please select a square."
    gets.chomp
  end
end
