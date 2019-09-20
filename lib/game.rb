class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
         (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]) && @board.cells[combo[0]] != " "
      end
    end

    def draw?
      board.full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      #binding.pry
      if won? == nil
        nil
      else
        @board.cells[won?[0]]
      end
    end

    def turn
      board.display
      puts " "
      input = current_player.move(board)
      board.valid_move?(input) ? board.update(input, current_player) : turn
    end

    def play
      turn until over?
      board.display
      if over?
        if won?
          who = winner
          puts "Congratulations #{who}!"
        else
          puts "Cat's Game!"
        end
      end
    end

    def start
      puts "Welcome to Tic-tac-toe"
      puts "Would you like to play:"
      puts "0 - Zero player Tic-tac-toe"
      puts "1 - One player Tic-tac-toe"
      puts "2 -  Two player Tic-tac-toe"
      puts "Enter 0, 1 or 2"
      game_preference = gets.chomp
      case game_preference
        when "0"
          puts "Begin computer Tic-tac-toe"
          game = Game.new(Players::Computer.new("X"), Players::Computer.new("0"))
          game.play
        when "1"
          puts "Begin one player Tic-tac-toe"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("0"))
          game.play
        when "2"
          puts "Begin two player Tic-tac-toe"
          puts "Choose a player to go first as X and enter a move (1-9)"
          game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
          game.play
        else
          puts "Not a valid choice."
      end
      puts "Would you like to play again?  Press Y/y for yes.)"
      again = gets.chomp
      if again == "Y" || again == "y"
        self.start
      else
        puts "Good-bye"
      end
    end

end
