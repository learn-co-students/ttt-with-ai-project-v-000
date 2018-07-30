class Game
attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS= [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First column
      [1,4,7],  # Second column
      [2,5,8],  # Third column
      [0,4,8],  # diagonal 1
      [2,4,6]  # diagonal 2
      #an array for each win combination
    ]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  if @board.turn_count % 2 == 0
    player_1
  else
    player_2
  end
end

def position_taken?(index)
  !(@board.cells[index].nil? || @board.cells[index] == " ")
end

def won?
  WIN_COMBINATIONS.detect do |combination|
    if combination.all? {|i| @board.cells[i] == "X"}
        combination
    elsif combination.all? {|i| @board.cells[i] == "O"}
        combination
    end
  end
end

def full?
  @board.cells.all? {|i| i == "X" || i == "O"}
end

def draw?
  won? == nil && full? == true
end

def over?
  won? != nil || draw? == true || full? == true
end

def winner
  if won? != nil
    @board.cells[won?[0]]
  end
end

def turn
  input = current_player.move(@board)
     if @board.valid_move?(input)
        @board.update(input,current_player)
        @board.display
      else
       turn
    end
  end

  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    elsif won? != nil
        puts "Congratulations #{winner}!"
    end
  end


end
