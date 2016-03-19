class Human < Player
  def move(input = nil)
   puts "Please enter 1-9:"
   input = gets.strip
  end
end