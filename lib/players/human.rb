require "pry"
module Players

  class Human < Player

    attr_accessor :token


    def move(board)
      puts "Where would you like to move"
      i = gets.strip
      i
      # binding.pry
    end
  end


end
