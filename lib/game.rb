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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
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

 def play
   until over?
     turn
   end
   puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
 end

end