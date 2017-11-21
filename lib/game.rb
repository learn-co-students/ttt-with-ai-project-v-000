class Game
  require_relative "../lib/players/computer.rb"


  attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #diagonal top left to bottom right
  [2, 4, 6] #diagonal top right to bottom left
  ]




  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
     @board.cells[combo[1]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0]+1)
   end
  end


  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def end_game
    @board.reset!
  end



  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    move = player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(move, player)
      puts "#{player.token} moved #{move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
      starting_input = gets.strip
      case starting_input
      when '0'

        game = Game.new
          until game.won?
            game.play
          end


      when '1'
          puts "prepare to be destroyed"

        when '2'
          game = Game.new
            if !game.won?
              game.play
            end

          new_game = ""
            puts "Would you like to start a new game?"
              new_game = gets.strip
                if new_game.downcase == "yes" || new_game.downcase == "y"
                  game = Game.new
                    until game.won?
                      game.play
                    end
                elsif new_game.downcase == "no" || new_game.downcase == "n"
                  puts "Thanks for playing, goodbye!!!"
                end
        else
          puts "Invalid entry, try again."
      end
  end

end
