require "pry"
class Game
  attr_accessor :board, :player_1,:player_2

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

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
  if @board.turn_count % 2 == 0
    @player_1
  else
  @player_2
  end
end

def won?
  WIN_COMBINATIONS.detect do |wins|
    if wins.all?{|index| @board.cells[index] == "X"}
      wins
    elsif wins.all?{|index| @board.cells[index] == "O"}
      wins
    end
  end
end

def draw?
  if !won?
    @board.full?
end
end

def over?
  won? || draw?
end

def winner
  WIN_COMBINATIONS.detect do |wins|
    if wins.all?{|index| @board.cells[index] == "X"}
      return "X"
    elsif wins.all?{|index| @board.cells[index] == "O"}
      return "O"
    end
  end
end

def turn
  player = current_player
  valid_move = player.move(@board)
  if @board.valid_move?(valid_move)
    @board.update(valid_move,player)
    @board.display
  else
    turn
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


def input_to_index(input)
  input.to_i - 1
end

# def move(index,current_player = "X")
#   @board[index] = current_player
# end






end
