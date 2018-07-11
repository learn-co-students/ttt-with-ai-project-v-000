require 'pry'
module Players
  class Human < Player
    def move(board)
      moved = false
      while moved == false
        puts "Please select cell."
        input = gets.strip
        input = input.to_i
        if board.valid_move?(input) == true
          return input.to_s
        else
          puts "Sorry, invalid move."
          return "invalid"
        end
      end

    end
  end
end
