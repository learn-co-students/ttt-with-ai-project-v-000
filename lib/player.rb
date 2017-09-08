class Player
  attr_reader :token

  def switch(token)
    token == 'X' ? 'O' : 'X'
  end

  def initialize(token)
    @token = token
    @opponent = switch(token)
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
    attr_accessor :choice


    def move(game)
    return 0 if game.board.cells.all? {|cell| cell == " "}
    min_max(game.clone)
    input_maker
    end

    def input_maker
      (self.choice.first + 1).to_s
    end

    def min_max(game)
      board = game.board
      return score(game) if game.over? != false

      scores = {}

      get_possible_moves(board).each do |move|
        possible_game = get_new_state(game, move)
        scores[move] = min_max(possible_game)
      end

      if game.current_player.token == self.token
        self.choice = scores.max_by {|move, score| score}
        return scores.values.max
      else
        return scores.values.min 
      end

    end

    def score(game)
      return 10 if game.winner == self.token
      return -10 if game.winner == switch(token)
      return 0
    end

    def get_possible_moves(board)
      moves = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          moves << index
        end
      end
      moves
    end

    def get_new_state(game, move)
      new_game_state = game.clone
      new_game_state.board.move(move, game.current_player.token)
      new_game_state
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


