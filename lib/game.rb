require './lib/player.rb'
require './lib/board.rb'
require './lib/players/computer.rb'
require './lib/players/human.rb'

class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #returns whose turn it is, player_1 or player_2
    if @board.turn_count.even?
      return @player_1
    else
      return @player_2
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def won?  #returns false for a draw or in progress, winning combination otherwise
    WIN_COMBINATIONS.each do |win_array|
      win_index_0 = win_array[0]
      win_index_1 = win_array[1]
      win_index_2 = win_array[2]

      value_at_win_index_0 = @board.cells[win_index_0]
      value_at_win_index_1 = @board.cells[win_index_1]
      value_at_win_index_2 = @board.cells[win_index_2]

      if value_at_win_index_0 == "X" && value_at_win_index_1 == "X" && value_at_win_index_2 == "X"
        return win_array
      elsif value_at_win_index_0 == "O" && value_at_win_index_1 == "O" && value_at_win_index_2 == "O"
        return win_array
      end
    end
    false
  end

  def draw? #true for a draw, false otherwise
    if won?
      return false
    else
      if @board.full?
        return true
      else
        return false
      end
    end
  end

  def winner #returns winner, X or O or nil
    win_array = won?
    if !win_array
      return nil
    end

    if @board.cells[win_array[0]] == "X"
      return "X"
    elsif @board.cells[win_array[0]] == "O"
      return "O"
    end
  end

  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
      @board.display
    else
      puts "invalid"
      turn
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
end



computer_player_x = Players::Computer.new("X")
computer_player_o = Players::Computer.new("O")
human_player_x = Players::Human.new("X")
human_player_o = Players::Human.new("O")

puts "Welcome to Tic-Tac-Toe!"
input = ""
while !(input == '0' || input == '1' || input == '2')
  puts "Please type in desired number of players, '0', '1', or '2'"
  input = gets.chomp
  case input
  when "0"
    new_game = Game.new(computer_player_x, computer_player_o)
  when "1"
    player_input = ""
    while !(player_input == "o" || player_input == "x")
      puts "Would you like to play as X or O against the computer? type 'x' or 'o'"
      player_input = gets.chomp
      case player_input
      when "o"
        new_game = Game.new(computer_player_x, human_player_o)
        puts "Enter a number between 1-9 to choose a spot"
      when "x"
        new_game = Game.new(human_player_x, computer_player_o)
        puts "Enter a number between 1-9 to choose a spot"
      else
        puts "Invalid input, try again"
      end
    end
  when "2"
    new_game = Game.new(human_player_x, human_player_o)
    puts "Enter a number between 1-9 to choose a spot"
  else
    puts "Invalid input, try again"
  end
end

new_game.board.display
new_game.play
