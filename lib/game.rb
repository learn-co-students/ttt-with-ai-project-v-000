class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  #other classes passed in to the game class as arguments
  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #state remembered interactions
  def current_player(board= @board)
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    @board.cells[combo[0]] == @board.cells[combo[1]] &&
    @board.cells[combo[1]] == @board.cells[combo[2]] &&
    @board.taken?(combo[0]+1)
    end
  end

  def draw? #board if full and no one won
    @board.full? && !won?
  end

  def over? #did anyone win, is the board full or is there a draw?
    won? || @board.full? || draw?
  end

  def winner #returns value when player wins or nil with no winner
    if winning_combo = won?
    @winner = @board.cells[winning_combo.first]
    end
  end

  def input_to_index(user_input)
      user_input.to_i - 1
  end

  def turn
    player = current_player
    current_move = player.move(@board) #if current move is not valid, give another turn
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Next: #{@board.turn_count + 1}"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts " "
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
