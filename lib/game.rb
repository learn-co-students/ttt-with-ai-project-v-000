class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left col
    [1,4,7], # Middle col
    [2,5,8], # Right col
    [0,4,8], # Left top to right bottom
    [2,4,6], # Right top to left bottom
  ]

  def initialize(player1 = Players::Human.new("X"), player2=Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    # @board should have a turn_count method

    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def winner
    # if won?
    #   #win = won? # won? returns the winning array
    #   @board.cells[won?[0]] # take an index from the winning array to show the winners token(X/O)
    # elsif !over? || !@board.full?
    #   nil
    # end
    
    # if !won? || draw?
    #   binding.pry
    # elsif over? && won?
    #   @board.cells[won?[0]]
    # end

    if won?
      @winner = @board.cells[won?.first]
    end

  end

  def turn
    # player should have a move method
    # board should have a valid_move? method
    # board should have a display method
    # board should have an update method
    player = current_player
    current_move = player.move(@board) # this calls the move method from the player class which prompts the user for input 1-9
    
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n" #increment turn count and display it
      @board.display
      @board.update(current_move, player) # update the board with the player's move
      puts "#{player.token} moved to spot #{current_move}"
      @board.display
      puts "\n"
    end

  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

end