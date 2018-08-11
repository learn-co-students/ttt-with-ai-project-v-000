module Players
  class Human < Player

    def input_to_index(input)
        input.to_i - 1
    end

    def move(token)
        puts "Please enter a number 1 - 9"
        input = gets.strip
        index = input_to_index(input)
        input
    end


  end
end
