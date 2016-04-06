Human = Class.new(Player)

class Human
  def move(cell)
    puts "Which spot you want to take?"
    input = gets.strip
  end
end
