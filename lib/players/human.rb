require'pry'

module Players
    class Human < Player

        attr_reader :board

        def move(board)
          puts "Please enter 1-9:"
          user_input = gets.strip
        end

    end
end
