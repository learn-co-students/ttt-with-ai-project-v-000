require_relative '../player.rb'

class Player::Human < Player

  def move(board)
    puts "Enter a position from 1-9: "
    gets.chomp
  end
end