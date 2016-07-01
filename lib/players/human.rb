class Human < Player

  def move(input)
    puts "Please choose your space."
    input = gets.chomp
    return input
  end

end