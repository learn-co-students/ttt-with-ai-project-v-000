class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8],
  ]

def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  @board.turn_count.even? ? @player_1 : @player_2
end

def over?
  draw? || won?
end

def won?
  WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
  end
end

def draw?
  full? && !won?
end

def full?
  @board.cells.all?{|player| player == "X" || player == "O"}
end

def winner
  if won?
    @board.cells[won?.first]
  end
end

def turn
  player = current_player
  input = player.move(board)
  if !@board.valid_move?(input)
    turn
  else
    puts "Turn: #{@board.turn_count + 1}"
    @board.display
    @board.update(input, player)
    puts "#{player.token} moved #{input}"
    @board.display
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
