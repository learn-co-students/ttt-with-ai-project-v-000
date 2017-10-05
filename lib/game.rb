class Game

  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
      [0,1,2], #top row win
      [3,4,5], #middle row win
      [6,7,8], #bottom row win
      [0,3,6], #left column win
      [1,4,7], #middle column win
      [2,5,8], #right column win
      [0,4,8], #left vertical win
      [2,4,6] #right vertical win
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new) #defaults to human X & O w/empty board
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player  #returns correct player, X, for 3rd move
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def over? #returns true for a draw, won game, false for in-progress
      won? || draw?
    end

    def won? #returns false for a draw, correct winning combination for a win, isn't hard-coded
      WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
      end
    end

    def draw? #returns true for a draw, false for a won game, false for an in-progress game
      @board.full? && !won?
    end

    def winner #returns X when X won, O when O won, nil when no winner
    end

    def turn #makes valid moves, asks for input again after a failed validation, changes to player 2 after the first turn
    end

    def play #asks for players input on a turn of the game, checks if the game is over after every turn, plays the first turn of the game, plays the first few turns of the game, checks if the game is a draw after every turn, stops playing if someone has won, congratulations the Winner X, Congratulates the winner O, stops playing in a draw, prints "Cat's Game!" on adraw, plays through an entire game
    end

end
