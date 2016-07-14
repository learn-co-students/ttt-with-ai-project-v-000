require "pry"

class Player

  attr_reader :token

  def initialize token
    @token = token
  end

  def take_turn
    puts "Please make a move"
    input = gets.strip.to_i
  end

end