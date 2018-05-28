
class Human < Player
  attr_accessor :input
  
  def move(input)
    puts "Please enter a valid position between 1-9:"
    puts ""
    puts ""
    input = gets.to_s.strip
    input
  end
end
