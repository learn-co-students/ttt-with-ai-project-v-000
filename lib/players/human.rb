module Players
  class Human < Player
    def move(position = nil)
      puts "Please enter 1 to 9:"
      position = gets.chomp unless position
      position
    end
  end
end
