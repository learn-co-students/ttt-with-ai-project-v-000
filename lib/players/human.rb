module Players
  class Human < Player
    def move(board)
      puts "Where do you want to move? Please enter an input."
      input = gets.chomp
    end
  end
end
