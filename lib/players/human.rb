require 'pry'

module Players
  class Human < Player

    attr_reader :playermove

    def move(board)
      gets.strip
    end



  end
end
