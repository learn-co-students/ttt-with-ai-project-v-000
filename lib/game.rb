class Game
  
  attr_accessor :board, :player_1,:player_2
  
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


 def initialize(player_1= Players::Human.new("X"),player_2=Players::Human.new("O"),board= Board.new)
  @board=board
  @player_1= player_1
  @player_2 =player_2
end


def current_player
  @board.turn_count % 2  == 0 ? player_1 : player_2
end

def won? 
  WIN_COMBINATIONS.detect do |winner|
    @board.cells[winner[0]]== @board.cells[winner[1]] &&
     @board.cells[winner[1]]== @board.cells[winner[2]] &&
     (@board.cells[winner[0]]=="X" || @board.cells[winner[0]]=="O")
    end 
end 


def draw?
  @board.full? && !won?
  
end 

def over? 
  won? || draw?
end 

def winner
  if winning_combo = won?
    @winner =board.cells[winning_combo.first]
end
end

def turn
  puts "Player #{current_player.token}'s turn!\n"
    puts "Where would you like to move? (1-9):\n"
    board.display

    user_input = current_player.move(board)

    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      puts "That number is invalid."
      turn
end
  
end 


  def play
    until over?
      turn
    end

    if won?
      puts "\n"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "\n"
      puts "Cat's Game!"
    end
    board.display
  end
  







end