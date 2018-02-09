module Players
  class Human < Player

  def move(cells)
      puts "Where would you like to move? Select a spot 1-9:"
      user_input = gets.chomp
      position = user_input
    end
  end
end
 
