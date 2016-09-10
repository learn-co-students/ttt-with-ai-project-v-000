module Players
  class Human < Player

  def move(x)
    puts "Please enter a position: "
    input = gets.chomp
    input.to_s
  end
end
end