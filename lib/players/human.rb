# require_relative '../player.rb'

module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      move = gets.chomp
    end



  end  #  End of Class
end  # End of Module
