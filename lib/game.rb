class Game
  
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0 
      @player_1 
    else
      @player_2
    end
  end
  
  def won?
    #previous code used .each to enumerate, but we really needed to use . detect so that it would stop the firts time the code finds that example
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0]+1)
      end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
     won? || draw?
  end
  
  def winner
    if winning = won?
      @winner = @board.cells[winning[0]]
    end
  end

  def turn
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      puts "You chose an occupied cell. Please choose an empty cell."
      turn
    else
      puts "Turn Number: #{@board.turn_count+1}\n" #\n breaks a new line for the board to display underneath
      #@board.display
      puts "#{current_player.token} moved into cell number #{current_move}."
      @board.update(current_move, current_player)
      @board.display
      #binding.pry
      #current_player
    end
  end

  def play
    while !over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end