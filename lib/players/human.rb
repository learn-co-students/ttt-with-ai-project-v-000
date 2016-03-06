class Human < Player
  attr_accessor :input
  
  def move(input)
    puts "Please input your choice 1-9:"
    input = gets.to_s.strip
    input
  end

end
