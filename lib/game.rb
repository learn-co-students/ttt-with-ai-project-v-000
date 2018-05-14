class Game

  attr_accessor :board, :player_1, :player_2, :winner

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
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player()
  @board.turn_count % 2 == 0 ? player_1 : player_2
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
    @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
    (@board.cells[win_combination[0]] == "X" || @board.cells[win_combination[0]] == "O")
  end

end

def draw?
  @board.full? && !won?
end

def over?
  won? || draw?
end


def winner
  if win_arr = won?
    @winner = @board.cells[win_arr.first]
  end
end

def turn
 puts "Please enter 1-9:"
 input = gets.strip

 index = input.to_i - 1
 if(@board.valid_move?(index))
   move(@board)
   display
 else
   # turn board
 end

end

def play
end


end
