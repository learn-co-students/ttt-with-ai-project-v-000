require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [2,5,8],
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [0,4,8],
  [2,4,6],
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    player = @player_1
      if board.turn_count % 2 == 1
        player = @player_2
      else player = @player_1
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if won?
      board.cells[won?.first]
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.turn_count
      current_player
    else
      current_player.move(board)
    end
  end

  def play
    # puts "Please enter 1-9:"
    turn while !over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
