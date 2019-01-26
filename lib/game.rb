require_relative './players/human'
require_relative './players/computer'

class Game
  
  attr_accessor :board, :player_1, :player_2
  attr_reader 
  
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
  
  def initialize(player_1 = (Players::Human.new("X")), player_2 = (Players::Human.new("O")), board = (Board.new))
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end
  
def won?
  WIN_COMBINATIONS.any? do |combo| #iterate over WIN_COMBINATIONS
    position_1 = board.cells[combo[0]]
    position_2 = board.cells[combo[1]]
    position_3 = board.cells[combo[2]]
    return combo if position_1 == position_2 && position_2 == position_3 && position_1 != " "
    end
end

def draw?
  board.full? && self.won? == false
end

def over?
  self.draw? || self.won? || board.full?
end

def winner
  board.cells[self.won?[0]] if self.won?
end

def turn
  puts "Please enter 1-9:"
  if board.turn_count.even?
    move1 = player_1.move(board)
    move1
    if board.valid_move?(move1)
      board.update(move1, player_1)
    else
      turn
    end
  elsif board.turn_count.odd?
    move2 = player_2.move(board)
    move2
    if board.valid_move?(move2)
      board.update(move2, player_2)
    else
      turn
    end
  end
end

def play
  self.turn until self.over?
end
  
end