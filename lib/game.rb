class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal Top Left to Bottom Right
    [2,4,6] #Diagona Top Right to Bottom Left
    
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    winning_numbers = [] #return this if game is won
    empty = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    win_status = []
    WIN_COMBINATIONS.each do |array|
      if empty == board.cells
        return false
      elsif array.all? { |value| board.cells[value] =="X" } || array.all? { |value| board.cells[value] =="O" }
        win_status = array
        break
      else
        win_status = nil
      end
    end
    win_status
  end
  
  def draw?
    !won? && full? ? true : false
  end
  
  def full?
   !board.cells.detect { |x| x == " " }
  end
 
  def over?
   won? || draw? ? true : false
  end
  
  def winner
    combo = won?
    board.cells[combo[0]] if won?
  end

  def turn
    #makes valid moves
    #asks for input again after a failed validation
    #changes to player 2 after the first turn
    board.display
    player = current_player
    index = player.move(board)
    
    if board.valid_move?(index) == false #!board.valid_move?(index) also does the same thing or even !@board.valid_move(index)
      turn
    else
      board.update(index, player) #@board.update(index, player) is also good
    end
  end
  
  def play
    while !over? #over? == false
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def list_game_modes
    puts "Pick a game mode."
    puts "1. Computer vs Computer"
    puts "2. Human vs Computer"
    puts "3. Human vs Computer"  
  end
  
end