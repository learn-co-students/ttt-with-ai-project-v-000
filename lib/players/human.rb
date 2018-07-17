module Players
  class Human < Player

    def move(board)
      puts "Where do you want to move?"
      index = gets.strip
    end


  end
end
