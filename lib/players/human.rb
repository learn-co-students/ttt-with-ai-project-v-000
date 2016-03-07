require_relative '../player.rb'

class Player::Human < Player
  def move(board)
    puts "please make a move from 1-9"
    input = gets.chomp
  end
end