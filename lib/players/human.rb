require_relative '../player.rb'

class Player::Human < Player
constant PLAYERS

  def initialize
  end

  def move
    puts "where would you like to move to?"
  end
end
