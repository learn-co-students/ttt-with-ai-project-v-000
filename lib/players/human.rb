require 'pry'
module Players
  class Human < Player
    def move(board)
      puts "Please select 1 - 9"
      user_move = gets.chomp
    end

  end
  class Computer < Player
    def move(board)
      # preferences = [5,1,3,7,9,2,4,6,8]
      # preferences.detect {|num| board.valid_move?(num)}.to_s
      preferences = rand(1..9).to_s

    end
  end

end
