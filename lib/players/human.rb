require_relative '../player.rb'

class Human
  extend Player


  def initialize
  end

  def move
    puts "where would you like to move to?"
  end
end
