require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

def current_player
  board.turn_count.even? ? player_1 : player_2
end

def won?
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0]+1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
    end
end

def full?
    board.cells.all?{|square| square != " " }
  end

def draw?
    full? && !won?
end

def over?
    won? || draw?
  end
  
def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end
  
def turn
  input = current_player.move(board)
  
   if !board.valid_move?(input)
     puts "Invalid move...try again"
     turn
    else
      @board.display
      puts "\n"
      @board.update(input, current_player)
      puts "#{current_player} moving."
      puts "\n"
      @board.display
      puts "\n\n"
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

