##
# => Player module for cleanliness purposes
##
module Players
  ##
  # => Instantiates the human player
  ##
  class Human < Player

    ##
    # => Makes a move on the board based on player input
    ##
    def move(board)
      puts "What position do you want to move to?"
      gets.strip;
    end

  end
end
