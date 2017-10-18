require 'pry'

module Players
  class Computer < Player

    ### simple AI ###
    def move(board)
      # unable to use (1..9).to_a.sample.to_s #=> SyntaxError
      # ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample.to_s # Error Prone
      move = (1..9).to_a
      move.sample.to_s
    end

  end
end
