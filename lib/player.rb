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
      min_max(game)
      (self.choice + 1).to_s
      # rand(1..9).to_s
      #MAKE SURE YOU ADD 1 TO THE CHOICE VARIABLE BECAUSE INDICE
    end

    def score(game)
      if game.winner == nil
        return 0
      elsif  game.winner == self.token
        return 10
      else
        return -10
      end
    end

    def possible_moves
      possible = []
      board.cells.each_with_index do |cell, indx|
         if board.valid_move?((indx + 1).to_s)
          possible << indx
         end
      end
      possible
    end    

    def get_new_state(move, current_game)
      #make new instance of game, with board as it currently is
      move = (move + 1).to_s
      current_state = board.cells
      theoretical_board = Game.new
      theoretical_board.board.cells = current_state
      theoretical_board.board.update(move, game.current_player)
      theoretical_board
    end

    def min_max(current_game)
      return score(current_game) if current_game.over?

      scores = []
      moves = []

      possible_moves.each do |move|
        possible_game = get_new_state(move, current_game)
        if min_max(possible_game) == nil
          next
        end
        binding.pry
        scores << min_max(possible_game)
        moves << move
      end

        if game.current_player == self.token
          max_score = scores.each_with_index.max[1]
          self.choice = moves[max_score]
          return scores[max_score]
        else
          min_score = scores.each_with_index.min[1]
          self.choice = moves[min_score]
          return scores[min_score]
      end
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


