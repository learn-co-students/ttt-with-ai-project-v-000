class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def self.start
      whos_first = nil
      how_many = nil


      puts "Welcome to Tic-Tac-Toe!"
      while how_many != "0" && how_many != "1" && how_many != "2" && how_many !="wargames"
        puts "How many humans will be playing? (enter 0, 1, or 2)"
        how_many = gets.chomp
        if how_many == "0"
          game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
          game.play
        elsif how_many == "1"
          while whos_first != "c" && whos_first != "h"
            puts "Who should go first? (enter c for computer, h for human)"
            whos_first = gets.chomp
            if whos_first == "c"
              game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
              game.play
            else
              game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
              game.play
            end
          end
        elsif how_many == "2"
          #launch regular game
          game = Game.new
          game.play
        elsif how_many == "wargames"
          ties = 0
          100.times do
            game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
            result = game.play
            ties += 1 if result
          end
          puts; puts "Number of games: 100"
          puts "Number of wins: #{100-ties}"
          puts; puts "A strange game.\nThe only winning move is\nnot to play.".upcase
          puts; puts "How about a nice game of chess?".upcase
          input = gets.strip
          if input == "yes" || input == "y"
            puts "https://www.chess.com/play/computer"
            break
          else
            break
          end
        else
          puts "Please enter a valid option"
        end
        puts "Would you like to play again?"
        input = gets.strip.downcase
        input == "y" || input == "yes" ? self.start : nil
      end

    end

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
       self.draw? || self.won?
    end

    def won?
      WIN_COMBINATIONS.detect { | combo | @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " " }
    end

    def draw?
      @board.full? && !self.won?
    end

    def winner
      self.won? ? @board.cells[self.won?[0]] : nil
    end

    def turn
      player_move = self.current_player.move(@board)
      puts "#{current_player.token} chooses position #{player_move}"
      self.board.cells[self.board.input_to_index(player_move)] = current_player.token
      self.board.display
      puts "\n"
    end

    def play
      while !self.over? do
        self.turn
      end
      if self.won?
        puts "Congratulations #{self.winner}!"
      else
        puts "Winner: none".upcase
        sleep 0.1
        "tie"
      end
    end

end
