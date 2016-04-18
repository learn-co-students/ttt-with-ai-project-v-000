require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_2 = player_2
    @player_1 = player_1
  end

  def won?
    WIN_COMBINATIONS.each do |winning|
    a,b,c = winning[0], winning[1], winning[2]
    if @cells[a] == 'X' && @cells[b] == 'X' && @cells[c] == 'X'
      return winning
    elsif @cells[a] == 'O' && @cells[b] == 'O' && @cells[c] == 'O'
      return winning
    end
    end
    nil
  end

  def turn_count #returns number of turns based on cell value
    @cells.reject{|x| x == ' '}.size
  end

  def current_player
    turn_count.even? ? "O" : "X"
  end

  def play01_
   won?
  until over? || won?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
   end
  if draw?
    puts "Cats Game!"
  end
  end

  def draw?
  full? && won?.nil?
end
end





