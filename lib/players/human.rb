module Players
  class Human < Player

    def move(token)
      puts "Where would you like to move"
      input = gets.strip
      #Board.input_to_index(input)

    end
  end
end
