require_relative '../player.rb'

class Player::Human < Player
  def move(board)
    puts "Where would you like to move?"
    input = gets.chomp
  end
end