require 'pry'


class Game

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

  attr_accessor :board, :player_1, :player_2
 

  def initialize(player_1=Human.new("X"),player_2=Human.new("O"),board =Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    counter = self.board.turn_count
    if counter %2 == 0
      player_1
    else
      player_2
    end
    #binding.pry
  end

  def over?
    self.draw? ||  self.won?
  end

      
  def draw?
    !(self.won?) && self.board.full?
    #binding.pry
  end    
 

  def won?
    WIN_COMBINATIONS.detect do |line|
      line.all?{|i| self.board.cells[i] == "X" } || line.all?{|i| self.board.cells[i] == "O"}
  end


  def winner
    if won?
      line = won?
      self.board.cells[line[0]]
    end
  end

  def turn
    puts ""
  end


end  

