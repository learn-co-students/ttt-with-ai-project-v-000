class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

module Players
  class Human < Player
    def move(board)
      puts "Place your token somewhere #{self.token}."
      input = gets.strip
      # board.display
    end
  end

  class Computer < Player
    attr_accessor :board, :choice, :game

    def move(board)
      binding.pry
      (self.choice + 1).to_s
      # rand(1..9).to_s
      #MAKE SURE YOU ADD 1 TO THE CHOICE VARIABLE BECAUSE INDICE
    end
  end
end



# score method
#{
# it returns a positive value if the player wins
# it returns a negative value if the player loses
# it returns a neutral value if the game is not over
#}

#minmax method
#{
#it returns the score if the game is over

#it generates an hash of future possible board states, with corresponding values
  #it uses recursion

#if the current turn is the player's
  #choose a move with a winning score, set the @choice variable to the move, return the score

#if current turn is opponent,
  #choose a move with a losing score, set @choice to move, return score


