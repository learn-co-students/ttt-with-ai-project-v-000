require_relative '../player.rb'
module Players
class Human < Player

  attr_accessor :input
  def move(input)
    puts "Choose your destiny"
    @input = gets.strip

end
end
end