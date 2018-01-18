class Game
  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    # horizontal wins
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    # vertical wins
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    # diagonal wins
    [0, 4, 8], # top left to bottom right diagonal
    [2, 4, 6] # top right to bottom left diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[0]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0] + 1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    # ask for input, if the move is valid, make the move and change to player_2
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      # if the move is not valid, ask for input, call turn again
      puts "That move has already been taken! Try again."
      turn
    end
  end

  def play
    while !over?
      board.display
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      board.display
      puts "Cat's Game!"
    end
  end

end
