require_relative '../player.rb'
module Players
class Human < Player

  attr_accessor :input
  def move(input)
    puts "Pick a number corresponging to the grid-board (1-9)"
    @input = gets.strip

end
end
end