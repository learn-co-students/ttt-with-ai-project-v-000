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
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
      end
    end

    def draw? #returns true for a draw, false for a won game, false for an in-progress game
      @board.full? && !won?
    end

    def winner #returns X when X won, O when O won, nil when no winner
      if winning_combo = won?
          @winner = @board.cells[winning_combo.first]
      end
    end

    def turn #makes valid moves, changes to player 2 after the first turn
      player = current_player
      current_move = player.move(@board)
        if !@board.valid_move?(current_move)
          turn
        else
         puts "Turn number: #{@board.turn_count+1}"
         @board.display
         @board.update(current_move, player)
         puts "#{player.token} made #{current_move}"
         @board.display #shows status
        end
    end

    def play #asks for players input on a turn of the game
      while !over? #checks if the game is over after every turn
        turn
      end
      if won?#stops playing if someone has won, congratulations the Winner X, Congratulates the winner O
        puts "Congratulations #{winner}!"
      elsif draw? #stops playing in a draw, prints "Cat's Game!" on adraw, plays through an entire game
        puts "Cat's Game!"
       end
    end

end
