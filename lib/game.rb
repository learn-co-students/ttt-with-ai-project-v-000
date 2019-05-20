require 'pry'
class Game

  attr_accessor :player_1, :board, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count.even? ? player_1 : player_2
    end

    def over?
      won? || draw?
    end

    def draw?
      !won? && @board.full?
    end

    def won?
      WIN_COMBINATIONS.detect do |combination|
        @board.cells[combination[0]] == @board.cells[combination[1]] &&
        @board.cells[combination[1]] == @board.cells[combination[2]] &&
        (@board.cells[combination[0]] == "X" || @board.cells[combination[0]] == "O")
      end
    end

    def winner
      if won?
        the_winner = won?[0]
        @board.cells[the_winner]
      else
        nil
      end
    end

    def turn
      player = current_player
      move = player.move(board)
      if @board.valid_move?(move)
        @board.update(move, player)
        @board.display
      else
        @board.display
        turn
      end
    end

    def play
      until over?
        turn
      end

      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
    end



    def start
      puts "Welcome to Tic Tac Toe!"
      puts "How many players? Please select '0', '1', or '2'."

      game_mode = gets.strip

      if game_mode == "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play

      elsif game_mode == "1"
        puts "Who will go first as 'X'? Please select 'human' or 'computer'."
        input = gets.strip
          if input == "human"
            game = Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
          elsif input == "computer"
            game = Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
          end

      elsif game_mode == "2"
        game = Game.new(Players::Human.new("X"), Players::Human.new("O")).play
        end

        play_again = ""
        puts "Would you like to play again? y/n"
        play_again = gets.strip

          if play_again.downcase == "yes" || play_again.downcase == "y"
          game = Game.new

            until game.over?
              game.play
            end


      end
    end
end
