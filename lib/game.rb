class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [6,4,2]]

def initialize(player_1 = Players::Human.new("X") , player_2 =Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  if board.cells.count("X").even?
    player_2
  else
    player_1
  end
end

def won?
  WIN_COMBINATIONS.detect do |win|
  # @cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
  board.cells[win[0]] == board.cells[win[1]] && board.cells[win[1]] == board.cells[win[2]] && board.taken?(win[0] + 1)
end
end

def draw?
  WIN_COMBINATIONS.detect do |win|
    board.cells[win[0]] != board.cells[win[1]] && board.cells[win[1]] != board.cells[win[2]] && board.taken?(win[0] + 1) unless won?
end
end

def over?
  if !board.full?
    false
  elsif draw? || won?
    true
  end
end

def winner
  binding.pry
end

end
