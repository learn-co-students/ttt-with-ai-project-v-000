require 'pry'

class Player::Human < Player

  def move(board)
    puts 'Please enter valid move'
    gets.strip
  end

end
