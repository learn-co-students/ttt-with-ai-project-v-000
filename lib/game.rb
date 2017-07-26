class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Back diagonal
    [2,4,6]  # Front diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    if !won? && board.full?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
      board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
      board.taken?(win_combo[0]+1)
    end
  end

  def winner
    if won?
      winning_array = won?
      board.cells[winning_array[0]]
    end
  end

  def turn
    puts "Please input your move:"
    board.display
    input = current_player.move(board)
      if board.valid_move?(input)
          board.cells[input.to_i - 1] = current_player.token
      else
        turn
      end
  end

  def play
    while !over?
      turn
    end
    if draw?
        puts "Cat's Game!"
    elsif won?
        puts "Congratulations #{winner}!"
    end
  end


end
