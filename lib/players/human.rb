Human = Class.new(Player)

class Human
  def move(location)
    puts "Which spot you want to take?"
    input = gets.strip
  end
end
