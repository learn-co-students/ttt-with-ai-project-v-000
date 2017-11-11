class Players
  class Human < Player

    def move(array)
      puts "Make a move"
      input = gets.chomp
      input.to_s
    end

  end
end
