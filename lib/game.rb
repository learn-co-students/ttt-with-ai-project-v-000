require 'pry'
class Game
  # extend Players::Human
  # extend Players::Computer
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8], [2,4,6]]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.cells[combo[0]] != " "
    end
  end 
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
  
  #methods relating to managing a game
  
  def start 
  end
  
  def play 
  end 
  
  def turn
      board.update(player_1.move(board), player_1)
      board.display
      board.update(player_2.move(board), player_2)
      board.display
  end
end
  
  