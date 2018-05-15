module Players
  class Human < Player

    def move(board)
      puts "Please select your turn :"
      return gets.strip
    end


  end
end
