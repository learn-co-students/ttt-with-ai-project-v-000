module Players
  class Human < Player

    def move(board)
      numbers = (0..9).to_a
      puts "Please enter 1-9:"
      input = gets.to_i
      puts "Please try again." unless numbers.include?(input)
      input.to_s
    end
  end
end
