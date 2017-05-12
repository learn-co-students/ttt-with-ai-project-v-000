require 'pry'

module Players
  class Human < Player

    attr_reader :playermove

    def move(board)
      playermove = gets.strip
      @playermove = playermove
    end



  end
end
