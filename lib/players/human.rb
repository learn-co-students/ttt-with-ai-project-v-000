require_relative '../player.rb'
module Players
class Human < Player
  attr_accessor :input
  def move(input)
    puts "give me a move"
    @input = gets.strip
  end
end
end