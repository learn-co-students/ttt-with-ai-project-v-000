require_relative '../config/environment.rb'

require "pry"
class Game
  attr_accessor :board, :player_1, :player_2, :cells

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |wc|
      if @board.cells[wc[0]] == "X" &&
         @board.cells[wc[1]] == "X" &&
         @board.cells[wc[2]] == "X"
         wc
       elsif @board.cells[wc[0]] == "O" &&
         @board.cells[wc[1]] == "O" &&
         @board.cells[wc[2]] == "O"
         wc
       else
         false
       end #end of if
     end #end of of find
  end #end of def

  def draw?
    !won? and @board.full?
  end

  def over?
    won? or @board.full? or draw?
  end

  def winner
    @board.cells[won?[0]] if won?
  end

  def turn
    used = current_player.move(board)
    if board.valid_move?(used)
      board.update(used, current_player)
      board.display
    else
      turn
    end
  end #end of turn

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end #end of play

end #end of class
