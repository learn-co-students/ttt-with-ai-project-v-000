module Players
  class Human < Player

    def move(board = nil)
      puts "Pick a square 1-9"
      input = gets.strip.to_i
      #binding.pry
        if input > 0 && input < 9
          input.to_s
        else
          puts "invalid"
          move
        end
    end

  end
=begin
=end


end
