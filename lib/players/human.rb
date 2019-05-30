module Players
  class Human < Player

    def move(board)
      puts "Hey there! Please select a position!"
      input = gets.strip
    end
  end
end
