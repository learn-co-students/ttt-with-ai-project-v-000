module Players
  class Human < Player

    def move(board)
      puts "Please enter a position: "
      position = gets.chomp.to_s
      return position
    end
    
  end
end
