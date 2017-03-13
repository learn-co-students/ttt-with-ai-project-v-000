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
    [6,4,2]
  ]

  #Initializes a new game with own board and players
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #Does the turn_count method on current board, if the count is even then player 1/X turn
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  #Checks status of game, returns true if there is a winner or if there is a draw
  def over?
    won? || draw?
  end

  #Checks to see if board is full, and if there is no winner, returns true
  def draw?
    @board.full? && !won?
  end

  #Detects to see if there is a win combination
  def won?
    #iterate throguh the combination to check if either X or O is the winner
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] ==  @board.cells[combo[1]] && 
      @board.cells[combo[1]] ==  @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  #returns the token of the winner if the game as been won
  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  #allows the game to turn
  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  #plays the game until the game is over
  def play
    #until over is true the game will call turn, and check for won or draw
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