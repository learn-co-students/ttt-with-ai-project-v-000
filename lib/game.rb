# The Game class is the main model of the application and represents singular instance of a Tic-tac-toe session
class Game
  # A game has one board through it board property
  # A game has two players stored in a player_1 and player_2 property
  attr_accessor :board, :player_1, :player_2 
  
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
  #Board and Player do not directly relate to the Game but do collaborate with each other through arguments
  
  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end
  
  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end  
  
  def won?
    WIN_COMBINATIONS.each do |combination|   #[0,1,2] which is board range (0-8)
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          #Need to +1, because #taken? rspec test is working off user_input range (1-9)
          return combination
        end
      end
    return false
  end
  
  def draw?
    @board.full? && !won? ? true : false
  end
  
  def over?
     (won? || draw?) ? true : false
     # IF board is not full, game is in progress (FALSE), ELSE, game is over (TRUE)
  end
  
  def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    end
  end

  def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end







# Beyond providing relationships with player and a board, the Game instance must also provide the basic game runtime and logic.

# These methods relate to the state of the game such as #current_player, #won and #winner.

# The other methods relate to managing a game like #start, #play and #turn.

