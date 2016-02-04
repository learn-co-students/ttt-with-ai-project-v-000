class Player::Human < Player

  def move(board)
    puts "Please enter your move from 1 - 9"
    input = gets.chomp
  end

end