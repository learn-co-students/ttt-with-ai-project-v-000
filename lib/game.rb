class Game
include Players
attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
   [0, 1, 2], [3, 4, 5], [6, 7, 8],
   [0, 3, 6], [1, 4, 7], [2, 5, 8],
   [0, 4, 8], [2, 4, 6]
 ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if combo = won?
      @board.cells[combo[0]]
    end
  end

  def turn
    player = current_player
    new_move = player.move(@board)

    if @board.valid_move?(new_move)
       @board.update(new_move, player)
       @board.display
       puts "\n******************************* \n"
    else
      puts "Woops! That space is already taken!"
      turn
    end

  end

  def play
    turn until over?
    puts self.winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def start
    puts "****************************"
    puts "Welcome to Ruby Tic Tac Toe\n"
    puts "****************************"
    puts "Please enter:\n
      0 to watch computers duke it out
      1 to play against the computer
      2 to play with yourself & a pal\n"
    puts "\nYou can always enter 'quit' to return to menu"

    input = gets.strip

    until input == "quit"
      if input == "0"
        computer_play_computer
      elsif input == "1"
        human_play_computer
      elsif input == "2"
        human_play_human
      end
    end

  end

  def computer_play_computer
    puts "Computer vs. Computer. GO!"
    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), Board.new).play
    play_again?
  end

  def human_play_computer
    puts "\nWho would you like to go first?"
    puts "Select 1 to be the first player"
    puts "select 2 to be the second player"
    new_input = gets.strip
      if new_input == "1"
        puts "\nYou will be X"
        puts "Computer will be O"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), Board.new).play
      elsif new_input == "2"
        puts "\nComputer will be X"
        puts "You will be O"
          Game.new(player_1 = Players::Computer.new("X"), player_1 = Players::Human.new("O"), Board.new).play
      end
        play_again?
      end

    def human_play_human
      puts "\nPlayer 1, would you like to be X or O?"
      puts "Select 1 to be X"
      puts "Select 2 to be O"
      new_input = gets.strip
        if new_input == "1"
          puts "\nThe first player will be X"
          puts "The second player will be O"
            Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), Board.new).play
        elsif new_input == "2"
          puts "\nThe first player will be O"
          puts "The second player will be X"
            Game.new(player_1 = Players::Human.new("O"), player_1 = Players::Human.new("X"), Board.new).play
        end
        play_again?
      end

  def play_again?
    puts "\nWould you like to play again? If so, pick a number:"
    puts "1. Computer vs computer"
    puts "2. You vs computer"
    puts "3. You vs your pal\n"
    puts "\or type 'quit' to return to menu"
    new_input = gets.strip
        if new_input == "1"
          computer_play_computer
        elsif new_input == "2"
          human_play_computer
        elsif new_input == "3"
          human_play_human
        elsif new_input == "quit"
          start
    end
  end



end
