module Players
class Human < Player
  def move(input)
    puts "Which space would you like to occupy?"
      input = gets.chomp
     input
  end
end
end
