# require_relative '../player.rb'

module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)  #returns user input as a string
      puts "Please enter 1-9:"
      input = gets.strip
    end



  end  #  End of Class
end  # End of Module
