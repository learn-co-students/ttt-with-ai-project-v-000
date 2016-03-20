require 'pry' 

class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [0,4,8], 
  [6,4,2]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.cells[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    @board.full? 
  end

  def winner
    if won?
      @win_combo = WIN_COMBINATIONS.find do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && 
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.cells[combo[0]] != " "
      end
      return @board.cells[@win_combo.first]
    else
      nil
    end
  end

  def self.won_games
    @@won_games
  end


  def turn
    make_move = current_player.move(@board)
    if !@board.valid_move?(make_move) 
      puts "Invalid move, silly!"
      turn
    else
      player = current_player
      @board.update(make_move, current_player)
      puts " "
      puts "- - - - - - - - - - - - - "
      puts "Player #{player.token} make move at #{make_move.to_s}!"
      @board.display
      puts "- - - - - - - - - - - - - "
      puts " "
    end
  end

  def play
    "Sup, brah! Wanna play a game? Make your move!"
    @board.display
    until over? || draw? || won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def self.zero_player_game
    self.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"), board = Board.new).play
  end

  def self.one_player_game
    puts "Choose your weapon: X or O. If choose X, you can go first."
        user_input = gets.strip
          until user_input == "X" || user_input == "O" || user_input == "x" || user_input == "o"
            puts "X or O, silly! Please choose again!"
            user_input = gets.strip
          end
          if user_input == "X" || user_input == "x"
            self.new(player_1 = Human.new("X"), player_2 = Computer.new("O"), board = Board.new).play
          elsif user_input == "O" || user_input == "o"
            self.new(player_1 = Computer.new("X"), player_2 = Human.new("O"), board = Board.new).play
          end
  end

  def self.two_player_game
    puts "X will be the first to play. You two can take turn from here. Have fun!"
    self.new(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new).play
  end

  def self.continue
    puts "One more game? How many players are we having?"
    puts "0 | 1 | 2 ------------------------ exit"
  end

  def self.goodbye
    puts "Hope you had fun! This game was made with a lot of love by Tra <3."
  end

  def self.run
    puts "Hey hey! Let's play Tic Tac Toe like it's 1995!"
    puts "What's your name(s)?"
    user_input = gets.strip
    puts "Hi #{user_input}! How many players are we having?"
    puts "0 | 1 | 2 ------------------------ exit"
    user_input = gets.strip
    until user_input == "exit" 

      if user_input == "0"
        zero_player_game
        continue
        user_input = gets.strip

      elsif user_input == "1"
        one_player_game
        continue
        user_input = gets.strip
      
      elsif user_input == "2"
        two_player_game
        continue
        user_input = gets.strip
      
      elsif user_input == "exit"
        goodbye

      else 
        puts "Wrong answer. Try again!"
        user_input = gets.strip
      end
    end
  end

  

end
