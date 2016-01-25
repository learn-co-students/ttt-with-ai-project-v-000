
class Player::Human < Player

  def move(board)
    puts "Where would you like to go (choose a number from 1-9)?"
    input = gets.chomp
  end

end
