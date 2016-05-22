require 'pry'
class Player::Human < Player
  def move(input)
    input = gets.chomp
    input
  end
end
