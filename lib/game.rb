require 'pry'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'players/computer.rb'
require_relative 'players/human.rb'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Board.new
  end

  def game_type(input)
    case input
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    when "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    end
  end


  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

 def won?
   matches = WIN_COMBINATIONS.select do |combo|
    tokens = combo.map {|cell| @board.cells[cell]}
    tokens.uniq.size == 1 && tokens.none? { |token| token == " " }
   end
   if matches.size > 1
     @board.cells[matches[0][0]] == player_1.token ? matches[0] : matches[1]
   else
     matches[0]
   end
 end

  def draw?
    @board.full? && !won?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

 def turn
  input = ""
  until @board.valid_move?(input)
    input = current_player.move(@board)
  end
  @board.update(input, current_player)
 end

 def start
  puts "Welcome! 0, 1, or 2 player game?"
  input = ""
    until %w(0 1 2).include?(input)
      input = gets.strip
    end
  input
  end

 def play
   game_type(start)
   until over?
    @board.display
    turn
   end
   @board.display
   puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
 end

end