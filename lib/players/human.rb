require_relative "../player.rb"

module Players



  class Human < Player
    #

    def move(input)
      input = gets.strip
    end



  end




end
