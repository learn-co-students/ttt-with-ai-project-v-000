module Players
  class Human < Player

    def move(value)
      loop do
        puts "Please choose a cell between 1-9"
        choice = gets.to_i
        case choice
          when 1..9
            puts "You chose #{choice}."
            break
        end
      end
    end
  end
end
