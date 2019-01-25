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
  input = self.player_1.gets.strip
  index = board.position(input)
  if board.valid_move?(index)
    board.update(index, player_1) if board.turn_count.even?
    board.update(index, player_2) if board.turn_count.odd?
    board.display
  # else
  #   turn
  end
end
  
  
  
end