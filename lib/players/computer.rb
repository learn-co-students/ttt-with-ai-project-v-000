module Players #overwriting module that wraps the Computer class
  class Computer < Player # Computer class inherits all functionality from Player class

    def move(board)
      Game::WIN_COMBINATIONS.each do |wins|
        tokens = board.cells.values_at(*wins) #array of things on the board
        if tokens.count(@token) == 2 && tokens.count(' ') == 1
          return wins[tokens.index(" ")]+1

        end
      end
      srand Time.now.to_i #srand starts with random seed for different sequence each time
      (rand(9)+1).to_s
    end
  end
end

###
#standard def:each of a set of standardized parts or independent units that
# can be used to construct a more complex structure, such as an item of furniture or a building.
#*****
#With modules you can share methods between classes
# Modules can be included into classes,
#and this makes their methods available on the class, just as if we’d copied and
#pasted these methods over to the class definition.
#This is useful if we have methods that we want to reuse in certain classes,
#but also want to keep them in a central place,
#so we do not have to repeat them everywhere
