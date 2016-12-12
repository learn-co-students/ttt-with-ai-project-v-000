

class Player::Human < Player

  def move(board)
    puts "Please select a square. ( 1 - 9 )"
    gets.chomp
  end
end
