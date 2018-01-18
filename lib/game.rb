class Game
  attr_accessor :board, :player_1, :player_2

  ::WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], #right column
    [0,4,8], # diag_1
    [2,4,6]  # diag_2
  ]

  def initialize (player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    (turn_count % 2) == 0 ? player_1 : player_2
  end

  def turn
    board.display
    puts "Player #{current_player.token}'s move..."
    player_move = current_player.move(board)

    board.valid_move?(player_move) ? board.update(player_move, current_player) : turn
  end

  def turn_count
    counter = 0
    board.cells.each do |play| 
      counter += 1 if play == "X" || play == "O"
    end
    counter
  end

  def play
    until over? do
      turn
    end
    board.display
    if won?
      puts "Congratulations #{winner}!" if won?
    else
      puts "Cats Game!" if draw?
    end
  end # play



  def full?
    board.cells.all? {|i| i == "X" || i == "O"}
  end 

  def draw?
      won? == nil && full? # Test for a draw
  end 

  def over?
      draw? || won? != nil
  end
  
#----------This method was developed by Motti Gottlieb  
  def won?
    ::WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == @board.cells[combo[1]] &&
      board.cells[combo[1]] == @board.cells[combo[2]] &&
      board.taken?(combo[0]+1)
    end
  end
#------------------------------ 
  def winner
    board.cells[won?[0]] if won?
  end
  



end #of Game CLASS

#  a.sort.eql?(b.sort)  where a and b are arrays


