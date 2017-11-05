class Players::Human
  def move(x)
    puts "Please enter your next move (1-9)"
    x = gets.strip
    x
  end
end
